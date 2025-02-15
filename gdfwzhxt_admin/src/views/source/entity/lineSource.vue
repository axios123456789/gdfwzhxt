<template>
  <div class="lineSource">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      线路资源信息管理
    </h2>

    <!--  添加线路  -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addShow">添 加</el-button>
    </div>

    <!--  新增或修改线路模态窗口  -->
    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="60%">
      <el-form label-width="140px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="线路名称*">
              <el-input v-model="lineInfo.lineName" clearable />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属单位*">
              <el-input
                v-model="lineInfo.unitName"
                clearable
                prefix-icon="search"
                @click="selectUnit"
                readonly
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="线路长度（km）">
              <!--              <el-input v-model="lineInfo.lineLength" clearable/>-->
              <el-input-number
                v-model="lineInfo.lineLength"
                :precision="2"
                :step="0.1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="线路半径（cm）">
              <!--              <el-input v-model="lineInfo.radius" clearable/>-->
              <el-input-number
                v-model="lineInfo.radius"
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
            <el-form-item label="电压等级（kv）">
              <el-input v-model="lineInfo.voltageLevel" clearable />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="额定电流（A）">
              <el-input v-model="lineInfo.ratedCurrent" clearable />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="线路类型*">
              <el-select
                v-model="lineInfo.lineType"
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
          <el-col :span="12">
            <el-form-item label="接入时间">
              <el-date-picker
                v-model="lineInfo.accessTime"
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
          <el-col :span="12">
            <el-form-item label="线路状态">
              <el-select
                v-model="lineInfo.lineStatus"
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
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="线路详细地址">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                v-model="lineInfo.address"
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

    <!--  点击新增或修改线路中单位文本框后打开该模态窗口  -->
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
    <el-table
      :data="list"
      style="width: 100%; margin-bottom: 20px;"
      row-key="id"
      border
      default-expand-all
    >
      <el-table-column label="操作" align="center" width="300" #default="scope">
        <el-button type="success" size="small" @click="addShow(scope.row)">
          添加下级线路
        </el-button>
        <el-button type="primary" size="small" @click="editShow(scope.row)">
          修改
        </el-button>
        <el-button type="danger" size="small" @click="remove(scope.row.id)">
          删除
        </el-button>
      </el-table-column>
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
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { GetKeyAndValueByType } from '@/api/sysDict'
import { GetUnitListByConditionAndPage } from '@/api/unit'
import {
  addLineInfo,
  deleteLineInfoById,
  findNodes,
  updateLineInfo,
} from '@/api/lineInfo'

//---------------------------------------------------列表---------------------------------------
// 定义表格数据模型
const list = ref([])

//加载数据
onMounted(() => {
  fetchData()
})

//分页列表
const fetchData = async () => {
  const { code, data, message } = await findNodes()
  list.value = data
}

//================================================添加和修改功能========================================================
//------------------------添加或修改线路模态窗口中单位选择-------------------------
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
  lineInfo.value.unitId = row.unitId
  lineInfo.value.unitName = row.unitName
  dialogVisibleUnitSelect.value = false
}

//--------------------添加和修改---------------------
// 定义添加表单菜单表单相关数据模型
const dialogTitle = ref('新增线路')
const dialogVisible = ref(false)

//页面表单数据
const defaultForm = {
  id: '',
  lineName: '',
  unitId: '',
  unitName: '',
  lineLength: '',
  radius: '',
  address: '',
  voltageLevel: '',
  ratedCurrent: '',
  lineType: '',
  lineStatus: '',
  mainLine: '',
  accessTime: '',
  //url: '',
  //icon: '',
}
// 表单响应式数据模型对象
const lineInfo = ref(defaultForm)
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

//进入添加
const addShow = row => {
  //获取线路类型下拉列表
  getLineTypeItem()
  //获取线路状态下拉列表
  getLineStatusItem()

  lineInfo.value = {}
  dialogVisible.value = true
  if (!row.id) {
    dialogTitle.value = '新增线路'
  } else {
    dialogTitle.value = '添加下级线路'
    lineInfo.value.mainLine = row.id
  }
}

//进入修改
const editShow = row => {
  //获取线路类型下拉列表
  getLineTypeItem()
  //获取线路状态下拉列表
  getLineStatusItem()

  lineInfo.value = { ...row }
  dialogVisible.value = true
}

//提交保存与修改
const saveOrUpdate = () => {
  if (lineInfo.value.lineName == undefined) {
    ElMessage.warning('【线路名称】不能为空')
    return
  }
  if (lineInfo.value.unitId == undefined) {
    ElMessage.warning('【所属单位】不能为空')
    return
  }
  if (lineInfo.value.lineType == undefined) {
    ElMessage.warning('【线路类型】不能为空')
    return
  }

  if (!lineInfo.value.id) {
    if (!lineInfo.value.mainLine) {
      lineInfo.value.mainLine = '0'
    }
    saveData()
  } else {
    updateData()
  }
}

// 修改
const updateData = async () => {
  const { code, message } = await updateLineInfo(lineInfo.value)
  if (code === 200) {
    dialogVisible.value = false
    ElMessage.success(message)
    fetchData()
  } else {
    ElMessage.error(message)
  }
}

// 新增
const saveData = async () => {
  const { code, message } = await addLineInfo(lineInfo.value)
  if (code === 200) {
    dialogVisible.value = false
    ElMessage.success(message)
    fetchData()
  } else {
    ElMessage.error(message)
  }
}

//=======================删除功能====================
const remove = async id => {
  console.log('removeDataById:' + id)
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await deleteLineInfoById(id)
    console.log('code:' + code + 'message' + message)
    if (code === 200) {
      ElMessage.success('删除成功')
      fetchData()
    } else {
      ElMessage.error(message)
    }
  })
}
</script>

<style scoped>
/*.lineSource {*/
/*  width: 100%;*/
/*  !*overflow-x: auto;*! !* 允许水平滚动 *!*/
/*  min-height: 100%;*/
/*  margin: 0;*/
/*  padding: 0;*/
/*  background-image: url("src/assets/dwbjt.webp");*/
/*  opacity: 0.5; !* 设置背景图片的透明度为50% *!*/
/*  background-size: cover; !* 使背景图片覆盖整个区域 *!*/
/*  background-attachment: fixed; !* 背景图片固定，不随滚动条滚动 *!*/
/*}*/
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
  background-color: #fff;
}
</style>
