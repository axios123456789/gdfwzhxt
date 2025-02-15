<template>
  <div class="lineSource">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      线路信息列表
    </h2>

    <!--  查询条件  -->
    <div class="search-div">
      <el-form label-width="120px" size="small">
        <!--    第一行查询条件    -->
        <el-row>
          <el-col :span="8">
            <el-form-item label="线路名称">
              <el-input
                v-model="queryLineDto.lineName"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="线路长度（大于）">
              <el-input-number
                v-model="queryLineDto.lineLength"
                :precision="2"
                :step="0.1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="线路半径（大于）">
              <el-input-number
                v-model="queryLineDto.radius"
                :precision="2"
                :step="0.1"
                :max="100"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
        </el-row>
        <!--    第二行查询条件    -->
        <el-row>
          <el-col :span="8">
            <el-form-item label="线路类型">
              <el-select
                v-model="queryLineDto.lineType"
                multiple
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in lineTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="线路状态">
              <el-select
                v-model="queryLineDto.lineStatus"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in lineStatusItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="所属单位">
              <el-input
                v-model="queryLineDto.unitName"
                clearable
                @click="selectUnit"
                readonly
              />
            </el-form-item>
          </el-col>
        </el-row>
        <!--    按钮行查询条件    -->
        <el-row style="display:flex">
          <el-button type="primary" size="small" @click="searchLineInfo">
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  点击单位文本框后打开该模态窗口  -->
    <el-dialog v-model="dialogVisibleUnitSelect" title="选择单位" width="80%">
      <!---搜索表单-->
      <div class="search-div">
        <el-form label-width="70px" size="small">
          <el-row>
            <el-col :span="12">
              <el-form-item label="单位名称">
                <el-input
                  v-model="queryUnitDto.unitName"
                  style="width: 100%"
                  clearable
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="单位等级">
                <el-select
                  v-model="queryUnitDto.unitLevel"
                  placeholder="请选择"
                  style="width: 100%"
                  clearable
                >
                  <el-option
                    v-for="item in unitLevelItem"
                    :key="item.value"
                    :label="item.text"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row style="display:flex">
            <el-button type="primary" size="small" @click="searchUnit">
              搜索
            </el-button>
            <el-button size="small" @click="resetDataUnit">重置</el-button>
          </el-row>
        </el-form>
      </div>

      <!--   单位列表   -->
      <el-table
        :data="unitList"
        style="width: 100%"
        @cell-click="unitHandleCellClick"
      >
        <el-table-column prop="unitId" label="单位id" />
        <el-table-column prop="unitName" label="单位名称" />
        <el-table-column prop="unitLevelName" label="单位等级" />
      </el-table>

      <!--分页条-->
      <el-pagination
        style="margin-top: 30px"
        v-model:current-page="unitPageParams.page"
        v-model:page-size="unitPageParams.limit"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="unitFetchData"
        @current-change="unitFetchData"
        layout="total, sizes, prev, pager, next"
        :total="unitTotal"
      />
    </el-dialog>

    <!-- 线路资源展示表格   -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column prop="lineName" label="线路名称" width="180" />
      <el-table-column prop="unitName" label="所属单位" width="120" />
      <el-table-column prop="lineLength" label="线路长度（km）" width="140" />
      <el-table-column prop="radius" label="线路半径（cm）" width="140" />
      <el-table-column prop="address" label="线路地址" width="200" />
      <el-table-column prop="voltageLevel" label="电压等级（kv）" width="140" />
      <el-table-column prop="ratedCurrent" label="额定电流（A）" width="140" />
      <el-table-column prop="lineTypeName" label="线路类型" width="120" />
      <el-table-column prop="lineStatusName" label="线路状态" width="120" />
      <el-table-column prop="mainLineName" label="所属母线" width="180" />
      <el-table-column prop="accessTime" label="接入时间" width="200" />
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
import { GetKeyAndValueByType } from '@/api/sysDict'
import { GetUnitListByConditionAndPage } from '@/api/unit'
import {
  addLineInfo,
  deleteLineInfoById,
  findNodes,
  GetLineInfoListByConditionAndPage,
  updateLineInfo,
} from '@/api/lineInfo'

//---------------------------------------------------列表---------------------------------------
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
//封装线路查询条件
const queryLineDto = ref({
  lineName: '',
  lineLength: '',
  radius: '',
  lineType: [],
  lineStatus: '',
  unitName: '',
})

//加载数据
onMounted(() => {
  getLineTypeItem()
  getLineStatusItem()
  fetchData()
})

//分页列表
const fetchData = async () => {
  const { data, code, message } = await GetLineInfoListByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    queryLineDto.value
  )
  list.value = data.list
  total.value = data.total
}

const lineTypeItem = ref([])
const lineStatusItem = ref([])

//发送请求，获取线路类型的下拉列表
const getLineTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_line_type')
  lineTypeItem.value = data
}

//发送请求，获取线路状态下拉列表
const getLineStatusItem = async () => {
  const { data } = await GetKeyAndValueByType('t_line_status')
  lineStatusItem.value = data
}

//搜索方法
const searchLineInfo = () => {
  fetchData()
}

//重置方法
const resetData = () => {
  queryLineDto.value = {}
  fetchData()
}

//------------------------点击单位选择框模态窗口中单位选择-------------------------
//控制单位选择的模态窗口
const dialogVisibleUnitSelect = ref(false)
//定义条件查询的单位
const queryUnitDto = ref({
  unitName: '',
  unitLevel: '',
})
//定义单位下拉列表选项
const unitLevelItem = ref([])
//定义数据模型
const unitList = ref([])

//分页条数据模型
const unitTotal = ref(0)
//分页
const unitPageParamsForm = {
  page: 1,
  limit: 10,
}
const unitPageParams = ref(unitPageParamsForm)

//查询表格数据
const unitFetchData = async () => {
  const { data, code, message } = await GetUnitListByConditionAndPage(
    unitPageParams.value.page,
    unitPageParams.value.limit,
    queryUnitDto.value
  )
  unitList.value = data.list
  unitTotal.value = data.total
}
//点击搜索按钮
const searchUnit = () => {
  unitFetchData()
}
//重置方法
const resetDataUnit = () => {
  queryUnitDto.value = {}
  unitFetchData()
}

//发送请求，获取单位等级的下拉列表
const getUnitLevelItem = async () => {
  const { data } = await GetKeyAndValueByType('t_unit_level')
  unitLevelItem.value = data
}

//点击添加或修改模态窗口中单位文本框触发
const selectUnit = () => {
  //重置查询条件
  queryUnitDto.value = {}
  //获取单位等级下拉列表
  getUnitLevelItem()
  dialogVisibleUnitSelect.value = true
  unitFetchData()
}
//处理单元格点击事件
const unitHandleCellClick = row => {
  queryLineDto.value.unitName = row.unitName
  dialogVisibleUnitSelect.value = false
}
</script>

<style scoped>
.lineSource {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.lineSource::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/dwbjt.webp');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.lineSource > * {
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
