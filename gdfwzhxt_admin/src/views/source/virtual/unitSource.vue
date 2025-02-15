<template>
  <div class="unitSource">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      单位资源信息管理
    </h2>

    <!--  添加单位  -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addShow">添 加</el-button>
    </div>

    <!--  新增或修改单位模态窗口  -->
    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="30%">
      <el-form label-width="120px">
        <el-form-item label="单位id">
          <el-input v-model="unit.unitId" />
        </el-form-item>
        <el-form-item label="单位名称">
          <el-input v-model="unit.unitName" />
        </el-form-item>
        <el-form-item label="单位等级">
          <el-select
            v-model="unit.unitLevel"
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
        <el-form-item>
          <el-button type="primary" @click="saveOrUpdate">提交</el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!-- 单位资源展示表格   -->
    <el-table
      :data="list"
      style="width: 100%; margin-bottom: 20px;"
      row-key="id"
      border
      default-expand-all
    >
      <el-table-column label="操作" align="center" width="300" #default="scope">
        <el-button type="success" size="small" @click="addShow(scope.row)">
          添加下级单位
        </el-button>
        <el-button type="primary" size="small" @click="editShow(scope.row)">
          修改
        </el-button>
        <el-button type="danger" size="small" @click="remove(scope.row.unitId)">
          删除
        </el-button>
      </el-table-column>
      <el-table-column prop="unitId" label="单位id" />
      <el-table-column prop="unitName" label="单位名称" />
      <el-table-column prop="unitLevelName" label="单位级别" />
    </el-table>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { GetKeyAndValueByType } from '@/api/sysDict'
import { addUnit, deleteUnitByUnitId, findNodes, updateUnit } from '@/api/unit'

// 定义表格数据模型
const list = ref([])

// 定义添加表单菜单表单相关数据模型
const dialogTitle = ref('新增单位')
const dialogVisible = ref(false)

//页面表单数据
const defaultForm = {
  unitId: '',
  unitName: '',
  parentUnitId: '',
  unitLevel: '',
  //url: '',
  //icon: '',
}
// 表单响应式数据模型对象
const unit = ref(defaultForm)
const unitLevelItem = ref([])

//发送请求，获取单位等级的下拉列表
const getUnitLevelItem = async () => {
  const { data } = await GetKeyAndValueByType('t_unit_level')
  unitLevelItem.value = data
}

//=======================加载数据=========================
onMounted(() => {
  //获取线路类型下拉列表
  getUnitLevelItem()
  fetchData()
})

//=======================添加和修改功能====================
//进入添加
const addShow = row => {
  unit.value = {}
  dialogVisible.value = true
  if (!row.id) {
    dialogTitle.value = '新增单位'
  } else {
    dialogTitle.value = '添加下级单位'
    unit.value.parentUnitId = row.unitId
  }
}

//进入修改
const editShow = row => {
  unit.value = { ...row }
  dialogVisible.value = true
}

//提交保存与修改
const saveOrUpdate = () => {
  if (unit.value.unitId == undefined) {
    ElMessage.warning('【单位id】不能为空')
    return
  }
  if (unit.value.unitName == undefined) {
    ElMessage.warning('【单位名称】不能为空')
    return
  }
  if (unit.value.unitLevel == undefined) {
    ElMessage.warning('【单位级别】不能为空')
    return
  }

  if (!unit.value.id) {
    if (!unit.value.parentUnitId) {
      unit.value.parentUnitId = '0'
    }
    saveData()
  } else {
    updateData()
  }
}

// 修改
const updateData = async () => {
  const { code, message } = await updateUnit(unit.value)
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
  const { code, message } = await addUnit(unit.value)
  if (code === 200) {
    dialogVisible.value = false
    ElMessage.success(message)
    fetchData()
  } else {
    ElMessage.error(message)
  }
}

//=======================分页列表====================
const fetchData = async () => {
  const { code, data, message } = await findNodes()
  list.value = data
}

//=======================删除功能====================
const remove = async unitId => {
  console.log('removeDataById:' + unitId)
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await deleteUnitByUnitId(unitId)
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
.unitSource {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.unitSource::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/srgxqdw.webp');
  background-size: cover;
  background-attachment: fixed;
  opacity: 1; /* 设置背景图片的透明度为50% */
}
.unitSource > * {
  position: relative;
  z-index: 1; /* 确保内容在伪元素上方 */
}

.tools-div {
  margin: 10px 0;
  padding: 10px;
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
</style>
