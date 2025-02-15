<template>
  <!---搜索表单-->
  <div class="search-div">
    <el-form label-width="70px" size="small">
      <el-row>
        <el-col :span="12">
          <el-form-item label="字典值">
            <el-input
              v-model="queryDto.value"
              style="width: 100%"
              clearable
            ></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="字典类型">
            <el-input
              v-model="queryDto.type"
              style="width: 100%"
              clearable
            ></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row style="display:flex">
        <el-button type="primary" size="small" @click="searchSysDict">
          搜索
        </el-button>
        <el-button size="small" @click="resetData">重置</el-button>
      </el-row>
    </el-form>
  </div>

  <!--添加按钮-->
  <div class="tools-div">
    <el-button type="success" size="small" @click="addDict">添 加</el-button>
  </div>

  <!-- 添加或修改数据字典表单对话框 -->
  <el-dialog v-model="dialogVisible" title="添加或修改数据字典" width="30%">
    <el-form label-width="80px">
      <el-form-item label="字典类型">
        <el-input v-model="sysDict.type" placeholder="" />
      </el-form-item>
      <el-form-item label="字典码值">
        <el-input v-model="sysDict.code" placeholder="" />
      </el-form-item>
      <el-form-item label="字典值">
        <el-input v-model="sysDict.value" placeholder="" />
      </el-form-item>
      <el-form-item label="描述">
        <el-input
          type="textarea"
          :rows="3"
          placeholder="请输入内容"
          v-model="sysDict.description"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submit">提交</el-button>
        <el-button @click="dialogVisible = false">取消</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>

  <!---数据表格-->
  <el-table :data="list" style="width: 100%">
    <el-table-column label="操作" align="center" width="200" #default="scope">
      <el-button type="primary" size="small" @click="editDict(scope.row)">
        修改
      </el-button>
      <el-button type="danger" size="small" @click="deleteDictById(scope.row)">
        删除
      </el-button>
    </el-table-column>
    <el-table-column prop="type" label="字典类型" width="100" />
    <el-table-column prop="code" label="字典码值" width="120" />
    <el-table-column prop="value" label="字典值" width="120" />
    <el-table-column prop="description" label="描述" width="200" />
    <el-table-column prop="createTime" label="创建时间" width="180" />
    <el-table-column prop="createBy" label="创建者" width="120" />
    <el-table-column prop="updateTime" label="修改时间" width="180" />
    <el-table-column prop="updateBy" label="修改者" width="120" />
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
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { DeleteDictById, GetSysDictList, SaveDict } from '@/api/sysDict'
import { ElMessage, ElMessageBox } from 'element-plus'

//-----------------------------------------------查询数据字典列表----------------------------------
//表格数据模型
const list = ref([])

//分页条数据模型
const total = ref(0)

//分页
const pageParamsForm = {
  page: 1,
  limit: 10,
}
const pageParams = ref(pageParamsForm)

//封装条件数据模型
const queryDto = ref({
  value: '',
  type: '',
})

//钩子函数
onMounted(() => {
  //展示列表数据
  fetchData()
})

//搜索方法
const searchSysDict = () => {
  fetchData()
}

//重置方法
const resetData = () => {
  queryDto.value = {}
  fetchData()
}

//列表方法：axios请求调用接口得到数据
const fetchData = async () => {
  const { data, code, message } = await GetSysDictList(
    pageParams.value.page,
    pageParams.value.limit,
    queryDto.value
  )
  list.value = data.list
  total.value = data.total
}

//----------------------------------------------------添加修改-------------------------------------------
const sysDict = ref({
  type: '',
  code: '',
  value: '',
  description: '',
})

const dialogVisible = ref(false)

//点击添加按钮后触发
const addDict = () => {
  sysDict.value = {}
  dialogVisible.value = true
}

//点击修改后触发
const editDict = row => {
  sysDict.value = { ...row }
  dialogVisible.value = true
}

//点击添加或修改模态窗口中的提交按钮后触发
const submit = async () => {
  if (sysDict.value.type == undefined) {
    ElMessage.warning('【字典类型】不能为空')
    return
  }
  if (sysDict.value.code == undefined) {
    ElMessage.warning('【字典状态码】不能为空')
    return
  }
  if (sysDict.value.value == undefined) {
    ElMessage.warning('【字典值】不能为空')
    return
  }
  const { code, message } = await SaveDict(sysDict.value)
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

//------------------------------------------------角色删除--------------------------------------------
//点击删除角色按钮后触发
const deleteDictById = row => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await DeleteDictById(row.id)
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
.search-div {
  margin-bottom: 10px;
  padding: 10px;
  border: 1px solid #ebeef5;
  border-radius: 3px;
  background-color: #fff;
}
.tools-div {
  margin: 10px 0;
  padding: 10px;
  border: 1px solid #ebeef5;
  border-radius: 3px;
  background-color: #fff;
}
</style>
