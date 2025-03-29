<template>
  <div class="rechargeRecordDT">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      电费充值记录
    </h2>

    <!--  查询条件  -->
    <div class="search-div">
      <el-form label-width="120px" size="small">
        <!--    第一行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="用户编号">
              <el-input
                v-model="rechargeRecordQueryDto.consNo"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="用户名称">
              <el-input
                v-model="rechargeRecordQueryDto.consName"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="充值时间">
              <el-date-picker
                v-model="rechargeTime"
                type="daterange"
                range-separator="To"
                start-placeholder="开始时间"
                end-placeholder="结束时间"
                format="YYYY-MM-DD"
                value-format="YYYY-MM-DD"
                :editable="false"
                clearable
              />
            </el-form-item>
          </el-col>
        </el-row>
        <!--    第二行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="充值金额（大于）">
              <el-input-number
                v-model="rechargeRecordQueryDto.rechargeAmount"
                :precision="2"
                :step="0.1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
        </el-row>
        <!--    按钮行查询条件    -->
        <el-row style="display:flex">
          <el-button type="primary" size="small" @click="searchRechargeRecord">
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  用户电费充值记录列表展示  -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column prop="rechargeBy" label="充值人" width="120" />
      <el-table-column prop="rechargeTime" label="充值时间" width="180" />
      <el-table-column prop="relation" label="充值人与用电户关系" width="160" />
      <el-table-column prop="consNo" label="用户编号" width="120" />
      <el-table-column prop="consName" label="用户名称" width="120" />
      <el-table-column
        prop="rechargeAmount"
        label="充值金额（元）"
        width="140"
      />
      <el-table-column prop="remark" label="备注" width="200" />
      <el-table-column prop="operator" label="操作人" width="120" />
      <el-table-column prop="operateTime" label="操作时间" width="180" />
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
import { onMounted, ref } from 'vue'
import { GetRechargeRecordByConditionAndPage } from '@/api/consInfo'
//-------------------------------------------------列表展示------------------------------------------------
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
//封装电费充值记录查询条件
const rechargeRecordQueryDto = ref({
  consNo: '',
  consName: '',
  rechargeBeginTime: '',
  rechargeEndTime: '',
  rechargeAmount: '',
})
const rechargeTime = ref([]) //封装查询条件中时间范围参数

//点击搜索按钮
const searchRechargeRecord = () => {
  rechargeRecordQueryDto.value.rechargeBeginTime = rechargeTime.value[0]
  rechargeRecordQueryDto.value.rechargeEndTime = rechargeTime.value[1]
  //调用查询电费充值记录接口函数
  fetchData()
}
//点击重置按钮
const resetData = () => {
  rechargeTime.value = []
  rechargeRecordQueryDto.value = {}
  //调用查询电费充值记录接口函数
  fetchData()
}
//查询查询电费充值记录列表
const fetchData = async () => {
  const { data } = await GetRechargeRecordByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    rechargeRecordQueryDto.value
  )
  list.value = data.list
  total.value = data.total
}
//钩子函数
onMounted(() => {
  //调用查询电费充值记录接口函数
  fetchData()
})
</script>

<style scoped>
.rechargeRecordDT {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.rechargeRecordDT::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/ercy1.gif');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.rechargeRecordDT > * {
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

.search-div {
  margin-bottom: 10px;
  padding: 10px;
  border: 1px solid #ebeef5;
  border-radius: 3px;
  background-color: transparent;
}
</style>
