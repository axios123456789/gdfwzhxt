<template>
  <div class="transformerSource">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      变压器信息资源管理
    </h2>

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
            <el-form-item label="额定容量（大于）">
              <el-input-number
                v-model="queryTransformerDto.ratedCapacity"
                :precision="2"
                :step="0.1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="变压器型号">
              <el-input
                v-model="queryTransformerDto.model"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <!--    第二行查询条件    -->
        <el-row>
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
          <el-button type="primary" size="small" @click="searchTransformerInfo">
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  添加变压器  -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addShow">添 加</el-button>
    </div>

    <!--  点击线路文本框后打开该模态窗口  -->
    <el-dialog v-model="dialogVisibleLineSelect" title="选择线路" width="80%">
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

    <!-- 点击添加或修改按钮后打开该模态窗口  -->
    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="60%">
      <el-form label-width="140px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="变压器局号*">
              <el-input v-model="transformerInfo.transformerCode" clearable />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属线路*">
              <el-input
                v-model="transformerInfo.lineName"
                clearable
                prefix-icon="search"
                @click="selectLine2"
                readonly
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="变压器名称*">
              <el-input v-model="transformerInfo.transformerName" clearable />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="变压器型号">
              <el-input v-model="transformerInfo.model" clearable />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="额定容量（kVA）">
              <el-input-number
                v-model="transformerInfo.ratedCapacity"
                :precision="2"
                :step="0.1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="变压器类型*">
              <el-select
                v-model="transformerInfo.transformerType"
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
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="一次侧电压（kV）">
              <el-input-number
                v-model="transformerInfo.primaryVoltage"
                :precision="2"
                :step="0.1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="二次侧电压（kV）">
              <el-input-number
                v-model="transformerInfo.secondaryVoltage"
                :precision="2"
                :step="0.1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="制造厂家">
              <el-input v-model="transformerInfo.manufacturer" clearable />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="安装时间">
              <el-date-picker
                v-model="transformerInfo.installDate"
                type="datetime"
                style="width: 100%"
                placeholder="选择日期时间"
                :editable="false"
                :value-format="'YYYY-MM-DD HH:mm:ss'"
              ></el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="维护记录">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                v-model="transformerInfo.maintenanceRecords"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="地址">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                v-model="transformerInfo.address"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                v-model="transformerInfo.remark"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item>
              <el-button type="primary" @click="saveOrUpdate">提交</el-button>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item>
              <el-button @click="dialogVisible = false">取消</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-dialog>

    <!-- 变压器资源展示表格   -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column label="操作" align="center" width="200" #default="scope">
        <el-button
          type="primary"
          size="small"
          @click="editTransformerInfo(scope.row)"
        >
          修改
        </el-button>
        <el-button
          type="danger"
          size="small"
          @click="deleteTransformerInfoById(scope.row)"
        >
          删除
        </el-button>
      </el-table-column>
      <el-table-column prop="transformerCode" label="变压器局号" width="120" />
      <el-table-column prop="transformerName" label="变压器名称" width="140" />
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
      <el-table-column prop="maintenanceRecords" label="维护记录" width="200" />
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
import { GetLineInfoListByConditionAndPage } from '@/api/lineInfo'
import {
  DeleteTransformerInfoById,
  GetTransformerInfoListByConditionAndPage,
  SaveTransformerInfo,
} from '@/api/transformerInfo'
import { ElMessage, ElMessageBox } from 'element-plus'

//---------------------------------------------------列表------------------------------------------
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
const queryTransformerDto = ref({
  transformerName: '', //变压器名称
  model: '', //变压器型号（TM-100）
  ratedCapacity: '', //额定容量kVA
  lineId: '', //所属线路
  lineName: '', //所属线路名称
  transformerType: '', //变压器类型
})

//加载数据
onMounted(() => {
  getTransformerTypeItem()
  fetchData()
})

//分页列表
const fetchData = async () => {
  const {
    data,
    code,
    message,
  } = await GetTransformerInfoListByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    queryTransformerDto.value
  )
  list.value = data.list
  total.value = data.total
}

const transformerTypeItem = ref([])

//发送请求，获取变压器类型的下拉列表
const getTransformerTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_transformer_type')
  transformerTypeItem.value = data
}

//搜索方法
const searchTransformerInfo = () => {
  fetchData()
}

//重置方法
const resetData = () => {
  queryTransformerDto.value = {}
  fetchData()
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

//根据点击的是查询条件中的线路文本框还是添加或修改模态窗中的文本框来设值并做出相应的处理
var lineTextBoxFlag
//点击条件查询线路文本框触发
const selectLine = () => {
  //重置查询条件
  queryLineDto.value = {}
  //获取线路各下拉列表
  getLineTypeItem()
  getLineStatusItem()
  dialogVisibleLineSelect.value = true
  lineFetchData()
  lineTextBoxFlag = 1
}
//点击添加或修改模态窗口中线路文本框触发
const selectLine2 = () => {
  //重置查询条件
  queryLineDto.value = {}
  //获取线路各下拉列表
  getLineTypeItem()
  getLineStatusItem()
  dialogVisibleLineSelect.value = true
  lineFetchData()
  lineTextBoxFlag = 2
}
//处理单元格点击事件
const lineHandleCellClick = row => {
  if (lineTextBoxFlag == 1) {
    queryTransformerDto.value.lineName = row.lineName
    queryTransformerDto.value.lineId = row.id
  } else if (lineTextBoxFlag == 2) {
    transformerInfo.value.lineName = row.lineName
    transformerInfo.value.lineId = row.id
  }
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

//-------------------------------------------------------添加或修改变压器信息---------------------------------------
//变压器表单信息
const transformerInfo = ref({
  transformerCode: '', //变压器局号
  transformerName: '', //变压器名称
  model: '', //变压器型号（TM-100）
  ratedCapacity: '', //额定容量kVA
  lineId: '', //所属线路
  lineName: '', //所属线路名称
  transformerType: '', //变压器类型
  primaryVoltage: '', //一次侧电压
  secondaryVoltage: '', //二次侧电压
  manufacturer: '', //制造厂家
  installDate: '', //安装日期
  maintenanceRecords: '', //维护记录
  address: '', //地址
  remark: '', //备注
})

//控制添加或修改变压器信息模态窗口的开闭（默认关闭）
const dialogVisible = ref(false)
//设置模态窗口的标题
const dialogTitle = ref('变压器')

//点击添加按钮
const addShow = () => {
  transformerInfo.value = {}
  dialogTitle.value = '录入变压器信息'
  dialogVisible.value = true
}

//点击修改按钮
const editTransformerInfo = row => {
  transformerInfo.value = { ...row }
  dialogTitle.value = '修改变压器信息'
  dialogVisible.value = true
}

//点击模态窗口中提交按钮后触发
const saveOrUpdate = async () => {
  if (transformerInfo.value.transformerCode == undefined) {
    ElMessage.warning('【变压器局号】不能为空')
    return
  }
  if (transformerInfo.value.transformerName == undefined) {
    ElMessage.warning('【变压器名称】不能为空')
    return
  }
  if (transformerInfo.value.lineName == undefined) {
    ElMessage.warning('【所属线路】不能为空')
    return
  }
  if (transformerInfo.value.transformerType == undefined) {
    ElMessage.warning('【变压器类型】不能为空')
    return
  }

  const { code, message } = await SaveTransformerInfo(transformerInfo.value)
  if (code === 200) {
    //关闭弹窗
    dialogVisible.value = false

    //提升消息
    ElMessage.success(message)

    //刷新页面
    fetchData()
  } else {
    ElMessage.error(message)
  }
}

//------------------------------------------------删除变压器xinx--------------------------------------------
//点击删除变压器按钮后触发
const deleteTransformerInfoById = row => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await DeleteTransformerInfoById(row.id)
    if (code === 200) {
      ElMessage.success(message)
      fetchData()
    } else {
      ElMessage.error(message)
    }
  })
}
</script>

<style scoped>
.transformerSource {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.transformerSource::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/byqInfo.webp');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.transformerSource > * {
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
