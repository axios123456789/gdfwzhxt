<template>
  <div class="sysMenuDT">
    <div class="tools-div">
      <el-button type="success" size="small" @click="addShow">添 加</el-button>
    </div>

    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="30%">
      <el-form label-width="120px">
        <el-form-item label="菜单标题">
          <el-input v-model="sysMenu.title" />
        </el-form-item>
        <el-form-item label="路由名称">
          <el-input v-model="sysMenu.component" />
        </el-form-item>
        <el-form-item label="排序">
          <el-input v-model="sysMenu.sortValue" />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="sysMenu.status">
            <el-radio :label="1">正常</el-radio>
            <el-radio :label="0">停用</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="saveOrUpdate">提交</el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-table
      :data="list"
      style="width: 100%; margin-bottom: 20px"
      row-key="id"
      border
      default-expand-all
    >
      <el-table-column label="操作" align="center" width="300" #default="scope">
        <el-button type="success" size="small" @click="addShow(scope.row)">
          添加下级节点
        </el-button>
        <el-button type="primary" size="small" @click="editShow(scope.row)">
          修改
        </el-button>
        <el-button type="danger" size="small" @click="remove(scope.row.id)">
          删除
        </el-button>
      </el-table-column>
      <el-table-column prop="title" label="菜单标题" />
      <el-table-column prop="component" label="路由名称" />
      <el-table-column prop="sortValue" label="排序" />
      <el-table-column prop="status" label="状态" #default="scope">
        {{ scope.row.status == 1 ? '正常' : '停用' }}
      </el-table-column>
      <el-table-column prop="createTime" label="创建时间" />
    </el-table>
  </div>
</template>

<script setup>
//引入调用的方法
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { addMenu, deleteMenuById, findNodes, updateMenu } from '@/api/SysMenu'

// 定义表格数据模型
const list = ref([])

// 定义添加表单菜单表单相关数据模型
const dialogTitle = ref('添加')
const dialogVisible = ref(false)

//页面表单数据
const defaultForm = {
  id: '',
  parentId: '0',
  title: '',
  url: '',
  component: '',
  icon: '',
  sortValue: 1,
  status: 1,
}
// 表单响应式数据模型对象
const sysMenu = ref(defaultForm)

//=======================加载数据=========================
onMounted(() => {
  fetchData()
})

//=======================添加和修改功能====================
//进入添加
const addShow = row => {
  sysMenu.value = {}
  dialogVisible.value = true
  if (!row.id) {
    dialogTitle.value = '添加'
  } else {
    dialogTitle.value = '添加下级节点'
    sysMenu.value.parentId = row.id
  }
}

//进入修改
const editShow = row => {
  sysMenu.value = row
  dialogVisible.value = true
}

//提交保存与修改
const saveOrUpdate = () => {
  if (!sysMenu.value.id) {
    if (!sysMenu.value.parentId) {
      sysMenu.value.parentId = '0'
    }
    saveData()
  } else {
    updateData()
  }
}

// 修改
const updateData = async () => {
  const { code, message } = await updateMenu(sysMenu.value)
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
  const { code, message } = await addMenu(sysMenu.value)
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
const remove = async id => {
  console.log('removeDataById:' + id)
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await deleteMenuById(id)
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
.sysMenuDT {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.sysMenuDT::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/jntm1.gif');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.sysMenuDT > * {
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
