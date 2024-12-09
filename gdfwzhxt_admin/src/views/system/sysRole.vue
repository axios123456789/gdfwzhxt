<template>
  <div class="search-div">
    <!-- 搜索表单 -->
    <el-form label-width="70px" size="small">
      <el-form-item label="角色名称">
        <el-input
            v-model="queryDto.roleName"
            style="width: 100%"
            placeholder="角色名称"
        ></el-input>
      </el-form-item>
      <el-row style="display:flex">
        <el-button type="primary" size="small" @click="searchSysRole">
          搜索
        </el-button>
        <el-button size="small" @click="resetData">重置</el-button>
      </el-row>
    </el-form>

    <!-- 添加按钮 -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addRole">添 加</el-button>
    </div>

    <!-- 添加或修改角色表单对话框 -->
    <el-dialog v-model="dialogVisible" title="添加或修改角色" width="30%">
      <el-form label-width="80px">
        <el-form-item label="角色名称">
          <el-input v-model="sysRole.roleName"
                    placeholder="" />
        </el-form-item>
        <el-form-item label="角色Code">
          <el-input v-model="sysRole.roleCode"
                    placeholder="" />
        </el-form-item>
        <el-form-item label="角色描述">
          <el-input
              type="textarea"
              :rows="3"
              placeholder="请输入内容"
              v-model="sysRole.description">
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submit">提交</el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!--- 角色表格数据 -->
    <el-table :data="list" style="width: 100%">
      <el-table-column label="操作" align="center" width="280" #default="scope">
        <el-button type="primary" size="small" @click="editRole(scope.row)">
          修改
        </el-button>
        <el-button type="danger" size="small" @click="deleteRoleById(scope.row)">
          删除
        </el-button>
      </el-table-column>
      <el-table-column prop="roleName" label="角色名称" width="180" />
      <el-table-column prop="roleCode" label="角色code" width="180" />
      <el-table-column prop="createTime" label="创建时间" />
      <el-table-column prop="description" label="描述" width="300"/>
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
import {onMounted, ref} from 'vue';
import {DeleteRoleById, GetSysRoleListByPage, SaveRole} from "@/api/sysRole";
import {ElMessage, ElMessageBox} from "element-plus";

//------------------------------------------角色列表---------------------------------------------
//定义数据模型
let total = ref(0);  //总记录数
let list = ref([]); //角色列表

//分页数据
const pageParamsForm = {
  page: 1,  //当前页
  limit: 10 //每页记录数
};
const pageParams = ref(pageParamsForm);

const queryDto = ref({"roleName":""}); //条件封装数据

//钩子函数
onMounted(() => {
  fetchData();
})

//操作方法：列表方法和搜索方法
//列表方法：axios请求调用接口得到数据
const fetchData = async () =>{
  const {data, code, message} = await GetSysRoleListByPage(pageParams.value.page, pageParams.value.limit, queryDto.value);
  list.value = data.list;
  total.value = data.total;
}

//搜索方法
const searchSysRole = () => {
  fetchData();
}

//重置方法
const resetData = () => {
  queryDto.value.roleName = "";
  fetchData();
}

//----------------------------------------------添加或修改角色------------------------------------------------------
//定义传递对象
const sysRole = ref({});
const dialogVisible = ref(false); //控制模态框的关闭

//点击添加按钮后触发
const addRole = () => {
  sysRole.value = {};
  dialogVisible.value = true;
}

//点击修改后触发
const editRole = (row) => {
  sysRole.value = {...row};
  dialogVisible.value = true;
}

//点击添加或修改模态窗口中的提交按钮后触发
const submit = async () => {
  if (sysRole.value.roleName == undefined){
    ElMessage.warning("【角色名称】不能为空");
    return;
  }
  if (sysRole.value.roleCode == undefined){
    ElMessage.warning("【角色编码】不能为空");
    return;
  }
  const {code, message} = await SaveRole(sysRole.value);
  if (code === 200){
    //关闭弹窗
    dialogVisible.value = false;

    //提升消息
    ElMessage.success(message);

    //刷新页面
    fetchData();
  }else {
    ElMessage.error(message);
  }
}

//------------------------------------------------角色删除--------------------------------------------
//点击删除角色按钮后触发
const deleteRoleById = (row) => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const {code, message} = await DeleteRoleById(row.id);
    if (code === 200){
      ElMessage.success(message);
      fetchData();
    }else {
      ElMessage.error(message);
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