<template>
  <div class="electricityUsageDT">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      电能使用情况
    </h2>

    <!--  查询条件  -->
    <div class="search-div">
      <el-form label-width="120px" size="small">
        <!--    第一行查询条件    -->
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户编号">
              <el-input
                v-model="electricityUsageQueryDto.consNo"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="用户名称">
              <el-input
                v-model="electricityUsageQueryDto.consName"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <!--    第二行查询条件    -->
        <el-row>
          <el-col :span="12">
            <el-form-item label="记录时间">
              <el-date-picker
                v-model="recordTime"
                type="datetimerange"
                range-separator="To"
                start-placeholder="开始时间"
                end-placeholder="结束时间"
                format="YYYY-MM-DD HH:mm:ss"
                value-format="YYYY-MM-DD HH:mm:ss"
                :editable="false"
                clearable
              />
            </el-form-item>
          </el-col>
        </el-row>
        <!--    按钮行查询条件    -->
        <el-row style="display:flex">
          <el-button
            type="primary"
            size="small"
            @click="searchElectricityUsage"
          >
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  查看电能使用明细模态窗口  -->
    <el-dialog
      v-model="electricityUsedDialogVisible"
      title="电能使用情况详情"
      width="70%"
    >
      <!--  tab页切换处理  -->
      <div class="tab">
        <div v-if="tabFlag != 1" @click="showDetail">
          <span>展示电能使用情况明细</span>
        </div>
        <div
          style="border-bottom: 2px solid green; color: green"
          v-if="tabFlag == 1"
        >
          <span>展示电能使用情况明细</span>
        </div>
        <div v-if="tabFlag != 2" @click="showView">
          <span>电能使用情况可视化</span>
        </div>
        <div
          style="border-bottom: 2px solid green; color: green"
          v-if="tabFlag == 2"
        >
          <span>电能使用情况可视化</span>
        </div>
      </div>

      <!--   展示详情   -->
      <div style="width: 100%;float: left" v-if="tabFlag == 1">
        <el-table
          :data="electricityUsedList"
          style="width: 100%; margin-bottom: 20px;"
        >
          <el-table-column prop="consNo" label="用户编号" width="120" />
          <el-table-column prop="consName" label="用户名称" width="120" />
          <el-table-column prop="recordTime" label="记录时间" width="180" />
          <el-table-column
            prop="usedEnergy"
            label="已耗电能（kwh）"
            width="150"
          />
          <el-table-column
            prop="remainingBalance"
            label="剩余电费（元）"
            width="150"
          />
          <el-table-column
            prop="lastRecordToNowUsedEnergy"
            label="距离上次记录到现在使用电能（kwh）"
            width="160"
          />
          <el-table-column
            prop="lastRecordToNowUsedBalance"
            label="距离上传记录到现在使用电费（元）"
            width="160"
          />
        </el-table>

        <!--分页条-->
        <el-pagination
          style="margin-top: 30px"
          v-model:current-page="electricityUsedPageParams.page"
          v-model:page-size="electricityUsedPageParams.limit"
          :page-sizes="[10, 20, 50, 100]"
          @size-change="electricityUsedFetchData"
          @current-change="electricityUsedFetchData"
          layout="total, sizes, prev, pager, next"
          :total="electricityUsedTotal"
        />
      </div>

      <!--   可视化电能使用情况明细   -->
      <div
        ref="chart"
        style="width: 100%; min-height: 450px; margin-top: 50px"
        v-if="tabFlag == 2"
      ></div>

      <!--   关闭按钮       -->
      <el-button
        @click="electricityUsedDialogVisible = false"
        type="warning"
        style="margin-left: 450px"
      >
        关闭
      </el-button>
    </el-dialog>

    <!--  电能使用情况  -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column prop="consNo" label="用户编号" width="200" />
      <el-table-column prop="consName" label="用户名称" width="200" />
      <el-table-column
        prop="electricityUsed"
        label="查询期间电能使用情况（kwh）"
        width="450"
        #default="scope"
      >
        <a
          @click="electricityUsedDetail(scope.row)"
          style="color: green; text-decoration: underline"
        >
          {{ scope.row.electricityUsed }}
        </a>
      </el-table-column>
      <el-table-column
        prop="chargeUsed"
        label="查询期间电费使用情况（元）"
        width="450"
        #default="scope"
      >
        <a
          @click="electricityUsedDetail(scope.row)"
          style="color: green; text-decoration: underline"
        >
          {{ scope.row.chargeUsed }}
        </a>
      </el-table-column>
    </el-table>

    <!--分页条-->
    <el-pagination
      style="margin-top: 30px"
      v-model:current-page="pageParams.page"
      v-model:page-size="pageParams.limit"
      :page-sizes="[10, 20, 50, 100]"
      @size-change="fetchData"
      @current-change="fetchData"
      layout="total, sizes, prev, pager, next"
      :total="total"
    />
  </div>
</template>

<script setup>
import { onMounted, ref, nextTick } from 'vue'
import {
  GetElectricityUsedByConditionAndPage,
  GetElectricityUsedDetailByConditionAndPage,
  GetEveryDayElectricityUsedByCondition,
} from '@/api/consInfo'
import * as echarts from 'echarts'

//-----------------------------------------电能使用情况列表------------------------------------------
// 定义表格数据模型
const list = ref([])
//分页条数据模型
const total = ref(0)
//分页
const pageParamsForm = {
  page: 1,
  limit: 10,
}
const pageParams = ref(pageParamsForm)
//封装电能使用情况条件查询参数
const electricityUsageQueryDto = ref({
  consNo: '',
  consName: '',
  recordBeginTime: '',
  recordEndTime: '',
})
//设置默认时间
const now = new Date()
const beginTime = new Date(now.getFullYear(), now.getMonth(), 1, 0, 0, 0)
const endTime = new Date(now.getFullYear(), now.getMonth() + 1, 0, 23, 59, 59)
const beginTimeStr = beginTime.toLocaleString('zh-CN', {
  year: 'numeric',
  month: '2-digit',
  day: '2-digit',
  hour: '2-digit',
  minute: '2-digit',
  second: '2-digit',
  hour12: false,
})
const endTimeStr = endTime.toLocaleString('zh-CN', {
  year: 'numeric',
  month: '2-digit',
  day: '2-digit',
  hour: '2-digit',
  minute: '2-digit',
  second: '2-digit',
  hour12: false,
})
const recordTime = ref([]) //封装查询条件中的记录时间参数
recordTime.value[0] = beginTimeStr
recordTime.value[1] = endTimeStr
electricityUsageQueryDto.value.recordBeginTime = beginTimeStr
electricityUsageQueryDto.value.recordEndTime = endTimeStr

//点击搜索按钮触发
const searchElectricityUsage = () => {
  electricityUsageQueryDto.value.recordBeginTime = recordTime.value[0]
  electricityUsageQueryDto.value.recordEndTime = recordTime.value[1]
  //调用查询电能使用情况接口函数
  fetchData()
}
//点击重置按钮触发
const resetData = () => {
  recordTime.value = []
  electricityUsageQueryDto.value = {}
  //调用查询电能使用情况接口函数
  fetchData()
}
//调用后端接口查询电能电费使用情况数据
const fetchData = async () => {
  const { data } = await GetElectricityUsedByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    electricityUsageQueryDto.value
  )
  list.value = data.list
  total.value = data.total
}

//钩子函数
onMounted(() => {
  //调用查询电费充值记录接口函数
  fetchData()
})

//-------------------------------------------------穿透查明细----------------------------------------------
const electricityUsedDialogVisible = ref(false) //控制查看电能使用情况模态窗口的开闭
const tabFlag = ref(1) //控制标签页切换
const electricityUsedDetail = row => {
  tabFlag.value = 1
  electricityUsedPageParams.value.page = 1
  //查询明细数据
  electricityUsageQueryDto.value.consNo = row.consNo
  electricityUsedFetchData()
  electricityUsedDialogVisible.value = true
}

//点击展示详情tab页
const showDetail = () => {
  tabFlag.value = 1
}
//点击展示可视化
const showView = async () => {
  tabFlag.value = 2
  const { data } = await GetEveryDayElectricityUsedByCondition(
    electricityUsageQueryDto.value
  )
  await nextTick()
  //eCharts可视化
  setChartOption(data)
}
//---------------------展示电能使用情况详情----------------------------
// 定义表格数据模型
const electricityUsedList = ref([])
//分页条数据模型
const electricityUsedTotal = ref(0)
//分页
const electricityUsedPageParamsForm = {
  page: 1,
  limit: 10,
}
const electricityUsedPageParams = ref(electricityUsedPageParamsForm)
//查询明细接口函数
const electricityUsedFetchData = async () => {
  const { data } = await GetElectricityUsedDetailByConditionAndPage(
    electricityUsedPageParams.value.page,
    electricityUsedPageParams.value.limit,
    electricityUsageQueryDto.value
  )
  electricityUsedList.value = data.list
  electricityUsedTotal.value = data.total
}

//---------------------eCharts图表可视化-----------------------------
const chart = ref()
const setChartOption = data => {
  const myChart = echarts.init(chart.value)
  // 指定图表的配置项和数据
  const option = {
    title: {
      text: '电能电费日情况可视化',
    },
    tooltip: {
      trigger: 'axis',
    },
    legend: {
      data: [
        '日电能使用量（kwh）',
        '日电费使用量（元）',
        '当日电能使用总量（kwh）',
        '当日最小电费（元）',
      ],
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      containLabel: true,
    },
    toolbox: {
      feature: {
        saveAsImage: {},
      },
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: data.dayDateList,
    },
    yAxis: {
      type: 'value',
    },
    series: [
      {
        name: '日电能使用量（kwh）',
        type: 'line',
        stack: 'Total',
        data: data.totalEnergyUsedList,
      },
      {
        name: '日电费使用量（元）',
        type: 'line',
        stack: 'Total',
        data: data.totalBalanceUsedList,
      },
      {
        name: '当日电能使用总量（kwh）',
        type: 'line',
        stack: 'Total',
        data: data.dayUsedEnergyList,
      },
      {
        name: '当日最小电费（元）',
        type: 'line',
        stack: 'Total',
        data: data.dayMinBalanceList,
      },
    ],
  }
  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option)
}
</script>

<style scoped>
.electricityUsageDT {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.electricityUsageDT::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/ercy2.gif');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.electricityUsageDT > * {
  position: relative;
  z-index: 1; /* 确保内容在伪元素上方 */
}

.tools-div {
  margin: 10px 0;
  padding: 10px;
  /*border: 1px solid #ebeef5;*/
  border-radius: 3px;
  background-color: transparent;
}

/deep/ .el-table,
/deep/ .el-table__expanded-cell {
  background-color: transparent;
  color: #001528;
  border: 1px solid;
}
/deep/ .el-table th,
/deep/ .el-table tr,
/deep/ .el-table td {
  background-color: transparent;
  color: #001528;
  border: 1px solid;
}

.tab {
  width: 100%;
  height: 30px;
  border-bottom: black;
  float: left;
  margin-bottom: 30px;
}
.tab div {
  width: 20%;
  height: 25px;
  margin-top: 5px;
  float: left;
  text-align: center;
  color: black;
}
.tab div:hover {
  color: green;
}

.search-div {
  margin-bottom: 10px;
  padding: 10px;
  border: 1px solid #ebeef5;
  border-radius: 3px;
  background-color: transparent;
}
</style>
