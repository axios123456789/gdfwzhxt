<template>
  <div class="consInfoSource">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      用电户信息列表
    </h2>

    <!--  查询条件  -->
    <div class="search-div">
      <el-form label-width="120px" size="small">
        <!--    第一行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="用户编号">
              <el-input
                v-model="consQueryDto.consNo"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="用户名称">
              <el-input
                v-model="consQueryDto.consName"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="用户类型">
              <el-select
                v-model="consQueryDto.consType"
                multiple
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in consTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="所属变压器">
              <el-input
                v-model="consQueryDto.transformerName"
                clearable
                @click="selectTransformer"
                readonly
              />
            </el-form-item>
          </el-col>
        </el-row>
        <!--    第二行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="账户余额（大于）">
              <el-input-number
                v-model="consQueryDto.balance"
                :precision="2"
                :step="0.1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="用户状态">
              <el-select
                v-model="consQueryDto.consStatus"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in consStatusItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="总用电量（大于）">
              <el-input-number
                v-model="consQueryDto.totalConsumption"
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
          <el-button type="primary" size="small" @click="searchConsInfo">
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  点击变压器文本框后打开该模态窗口  -->
    <el-dialog
      v-model="dialogVisibleTransformerSelect"
      title="选择变压器"
      width="80%"
    >
      <!--  查询条件  -->
      <div class="search-div">
        <el-form label-width="120px" size="small">
          <!--    第一行查询条件    -->
          <el-row>
            <el-col :span="8">
              <el-form-item label="变压器名称">
                <el-input
                  v-model="queryTransformerDto.transformerName"
                  style="width: 100%"
                  clearable
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="变压器类型">
                <el-select
                  v-model="queryTransformerDto.transformerType"
                  placeholder="请选择"
                  style="width: 100%"
                  clearable
                >
                  <el-option
                    v-for="item in transformerTypeItem"
                    :key="item.value"
                    :label="item.text"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="所属线路">
                <el-input
                  v-model="queryTransformerDto.lineName"
                  clearable
                  @click="selectLine"
                  readonly
                />
              </el-form-item>
            </el-col>
          </el-row>
          <!--    按钮行查询条件    -->
          <el-row style="display:flex">
            <el-button
              type="primary"
              size="small"
              @click="searchTransformerInfo"
            >
              搜索
            </el-button>
            <el-button size="small" @click="resetDataTransformer">
              重置
            </el-button>
          </el-row>
        </el-form>
      </div>

      <!-- 变压器资源展示表格   -->
      <el-table
        :data="transformerList"
        style="width: 100%; margin-bottom: 20px;"
        @cell-click="transformerHandleCellClick"
      >
        <el-table-column
          prop="transformerCode"
          label="变压器局号"
          width="120"
        />
        <el-table-column
          prop="transformerName"
          label="变压器名称"
          width="140"
        />
        <el-table-column prop="model" label="变压器型号" width="80" />
        <el-table-column
          prop="ratedCapacity"
          label="额定容量（kVA）"
          width="70"
        />
        <el-table-column prop="lineName" label="所属线路" width="140" />
        <el-table-column
          prop="transformerTypeName"
          label="变压器类型"
          width="70"
        />
        <el-table-column
          prop="primaryVoltage"
          label="一次侧电压（kV）"
          width="70"
        />
        <el-table-column
          prop="secondaryVoltage"
          label="二次侧电压（kV）"
          width="70"
        />
        <el-table-column prop="manufacturer" label="制造厂家" width="120" />
        <el-table-column prop="installDate" label="安装日期" width="180" />
        <el-table-column
          prop="maintenanceRecords"
          label="维护记录"
          width="200"
        />
        <el-table-column prop="address" label="地址" width="200" />
        <el-table-column prop="remark" label="备注" width="250" />
        <el-table-column prop="createTime" label="记录创建时间" width="180" />
        <el-table-column prop="createBy" label="记录创建者" width="80" />
        <el-table-column prop="updateTime" label="记录修改时间" width="180" />
        <el-table-column prop="updateBy" label="记录修改者" width="80" />
      </el-table>

      <!--分页条-->
      <el-pagination
        style="margin-top: 30px"
        v-model:current-page="transformerPageParams.page"
        v-model:page-size="transformerPageParams.limit"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="transformerFetchData"
        @current-change="transformerFetchData"
        layout="total, sizes, prev, pager, next"
        :total="transformerTotal"
      />
    </el-dialog>

    <!--  点击线路文本框后打开该模态窗口  -->
    <el-dialog v-model="dialogVisibleLineSelect" title="选择线路" width="70%">
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
            <el-button size="small" @click="resetLineData">重置</el-button>
          </el-row>
        </el-form>
      </div>

      <!-- 线路资源展示表格   -->
      <el-table
        :data="lineList"
        style="width: 100%; margin-bottom: 20px;"
        @cell-click="lineHandleCellClick"
      >
        <el-table-column prop="lineName" label="线路名称" width="180" />
        <el-table-column prop="unitName" label="所属单位" width="120" />
        <el-table-column prop="lineLength" label="线路长度（km）" width="140" />
        <el-table-column prop="radius" label="线路半径（cm）" width="140" />
        <el-table-column prop="address" label="线路地址" width="200" />
        <el-table-column
          prop="voltageLevel"
          label="电压等级（kv）"
          width="140"
        />
        <el-table-column
          prop="ratedCurrent"
          label="额定电流（A）"
          width="140"
        />
        <el-table-column prop="lineTypeName" label="线路类型" width="120" />
        <el-table-column prop="lineStatusName" label="线路状态" width="120" />
        <el-table-column prop="mainLineName" label="所属母线" width="180" />
        <el-table-column prop="accessTime" label="接入时间" width="200" />
      </el-table>

      <!--分页条-->
      <el-pagination
        style="margin-top: 30px"
        v-model:current-page="linePageParams.page"
        v-model:page-size="linePageParams.limit"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="lineFetchData"
        @current-change="lineFetchData"
        layout="total, sizes, prev, pager, next"
        :total="lineTotal"
      />
    </el-dialog>

    <!--  点击单位文本框后打开该模态窗口  -->
    <el-dialog v-model="dialogVisibleUnitSelect" title="选择单位" width="60%">
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

    <!--  用电户信息列表展示  -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column prop="consNo" label="用户编号" width="120" />
      <el-table-column prop="consName" label="用户名称" width="120" />
      <el-table-column prop="consTypeName" label="用户类型" width="100" />
      <el-table-column prop="tel" label="联系电话" width="120" />
      <el-table-column prop="transformerName" label="所属变压器" width="140" />
      <el-table-column
        prop="emergencyTransformerName"
        label="应急变压器"
        width="140"
      />
      <el-table-column prop="connectionDate" label="接电日期" width="120" />
      <el-table-column prop="balance" label="账户余额（元）" width="140" />
      <el-table-column prop="consStatusName" label="用户状态" width="120" />
      <el-table-column
        prop="totalConsumption"
        label="用电总量（kWh）"
        width="140"
      />
      <el-table-column prop="address" label="地址" width="200" />
      <el-table-column prop="remark" label="备注" width="250" />
      <el-table-column prop="createTime" label="记录创建时间" width="180" />
      <el-table-column prop="createBy" label="记录创建者" width="120" />
      <el-table-column prop="updateTime" label="记录修改时间" width="180" />
      <el-table-column prop="updateBy" label="记录修改者" width="120" />
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
import { GetTransformerInfoListByConditionAndPage } from '@/api/transformerInfo'
import { GetLineInfoListByConditionAndPage } from '@/api/lineInfo'
import { GetUnitListByConditionAndPage } from '@/api/unit'
import { GetConsInfoListByConditionAndPage } from '@/api/consInfo'

//------------------------------------------------------------列表-------------------------------------------------------
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
//封装用户查询条件
const consQueryDto = ref({
  consNo: '', //用户编号
  consName: '', //用户名称
  consType: [], //用户类型
  transformerCode: '', //所属变压器局号
  transformerName: '', //所属变压器
  balance: '', //账户余额
  consStatus: '', //用户状态
  totalConsumption: '', //总用电量
})
const consTypeItem = ref([]) //封装用户类型item
const consStatusItem = ref([]) //封装用户状态item

//获取用户类型下拉列表键值对
const getConsTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_cons_consType')
  consTypeItem.value = data
}
//获取用户状态下拉列表键值对
const getConsStatusItem = async () => {
  const { data } = await GetKeyAndValueByType('t_cons_consStatus')
  consStatusItem.value = data
}

//加载列表数据
const fetchData = async () => {
  const { data } = await GetConsInfoListByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    consQueryDto.value
  )
  list.value = data.list
  total.value = data.total
}

//点击查询按钮
const searchConsInfo = () => {
  fetchData()
}

//重置方法
const resetData = () => {
  consQueryDto.value = {}
  fetchData()
}

//钩子函数
onMounted(() => {
  //获取用户类型下拉列表键值对
  getConsTypeItem()
  //获取用户状态下拉列表键值对
  getConsStatusItem()

  fetchData()
})

//-------------------------------------列表->点击所属变压器选择框------------------------------
// 定义变压器表格数据模型
const transformerList = ref([])
//分页条数据模型
const transformerTotal = ref(0)
//分页
const transformerPageParamsForm = {
  page: 1,
  limit: 10,
}
const transformerPageParams = ref(transformerPageParamsForm)

//封装变压器查询条件
const queryTransformerDto = ref({
  transformerName: '', //变压器名称
  //model: "",            //变压器型号（TM-100）
  //ratedCapacity: "",    //额定容量kVA
  lineId: '', //所属线路
  lineName: '', //所属线路名称
  transformerType: '', //变压器类型
})
//控制点击所属变压器文本框后模态窗口的开闭
const dialogVisibleTransformerSelect = ref(false)
const transformerTypeItem = ref([])

//发送请求，获取变压器类型的下拉列表
const getTransformerTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_transformer_type')
  transformerTypeItem.value = data
}

//变压器分页列表
const transformerFetchData = async () => {
  const {
    data,
    code,
    message,
  } = await GetTransformerInfoListByConditionAndPage(
    transformerPageParams.value.page,
    transformerPageParams.value.limit,
    queryTransformerDto.value
  )
  transformerList.value = data.list
  transformerTotal.value = data.total
}

//搜索
const searchTransformerInfo = () => {
  transformerFetchData()
}

//重置
const resetDataTransformer = () => {
  queryTransformerDto.value = {}
  transformerFetchData()
}

//点击所属变压器文本框触发
const selectTransformer = () => {
  //重置查询条件
  queryTransformerDto.value = {}
  getTransformerTypeItem()
  transformerFetchData()
  dialogVisibleTransformerSelect.value = true
}

//变压器单元格点击事件
const transformerHandleCellClick = row => {
  consQueryDto.value.transformerCode = row.transformerCode
  consQueryDto.value.transformerName = row.transformerName
  dialogVisibleTransformerSelect.value = false
}

//------------------------点击线路选择框模态窗口中单位选择-------------------------
//控制线路选择的模态窗口
const dialogVisibleLineSelect = ref(false)
//定义条件查询的单位
const queryLineDto = ref({
  lineName: '',
  lineLength: '',
  radius: '',
  lineType: [],
  lineStatus: '',
  unitName: '',
})
//定义线路下拉列表选项
const lineTypeItem = ref([])
const lineStatusItem = ref([])

//定义数据模型
const lineList = ref([])

//分页条数据模型
const lineTotal = ref(0)
//分页
const linePageParamsForm = {
  page: 1,
  limit: 10,
}
const linePageParams = ref(linePageParamsForm)

//查询表格数据
const lineFetchData = async () => {
  const { data, code, message } = await GetLineInfoListByConditionAndPage(
    linePageParams.value.page,
    linePageParams.value.limit,
    queryLineDto.value
  )
  lineList.value = data.list
  lineTotal.value = data.total
}
//点击搜索按钮
const searchLineInfo = () => {
  lineFetchData()
}
//重置方法
const resetLineData = () => {
  queryLineDto.value = {}
  lineFetchData()
}

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

//点击所属线路文本框触发
const selectLine = () => {
  //重置查询条件
  queryLineDto.value = {}
  //获取线路各下拉列表
  getLineTypeItem()
  getLineStatusItem()
  dialogVisibleLineSelect.value = true
  lineFetchData()
}
//处理单元格点击事件
const lineHandleCellClick = row => {
  queryTransformerDto.value.lineName = row.lineName
  queryTransformerDto.value.lineId = row.id
  dialogVisibleLineSelect.value = false
}

//----------------------------点击单位选择框--------------------------
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
  queryLineDto.value.unitId = row.unitId
  queryLineDto.value.unitName = row.unitName
  dialogVisibleUnitSelect.value = false
}
</script>

<style scoped>
.consInfoSource {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.consInfoSource::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/cons2.jpg');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.consInfoSource > * {
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
