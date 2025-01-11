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
        <el-button type="warning" size="small" @click="showAssignMenu(scope.row)">
          分配菜单
        </el-button>
      </el-table-column>
      <el-table-column prop="roleName" label="角色名称" width="180" />
      <el-table-column prop="roleCode" label="角色code" width="180" />
      <el-table-column prop="createTime" label="创建时间" width="200"/>
      <el-table-column prop="createBy" label="创建者" width="120"/>
      <el-table-column prop="updateTime" label="修改时间" width="200"/>
      <el-table-column prop="updateBy" label="修改者" width="120"/>
      <el-table-column prop="description" label="描述" width="300"/>
    </el-table>

    <!-- 分配菜单的对话框
        // tree组件添加ref属性，后期方便进行tree组件对象的获取
        -->
    <el-dialog v-model="dialogMenuVisible" title="分配菜单" width="40%">
      <el-form label-width="80px">
        <el-tree
            :data="sysMenuTreeList"
            ref="tree"
            show-checkbox
            default-expand-all
            :check-on-click-node="true"
            node-key="id"
            :props="defaultProps"
        />
        <el-form-item>
          <el-button type="primary" @click="doAssign">提交</el-button>
          <el-button @click="dialogMenuVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

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
import {allocateMenus, DeleteRoleById, GetSysRoleListByPage, SaveRole} from "@/api/sysRole";
import {ElMessage, ElMessageBox} from "element-plus";
import {getAllMenus} from "@/api/SysMenu";

//---------------------分配菜单-------------------
const defaultProps = {
  children: 'children',
  label: 'title',
}
const dialogMenuVisible = ref(false)
const sysMenuTreeList = ref([])

// 树对象变量
const tree = ref()

// 默认选中的菜单数据集合
let roleId = ref()
const showAssignMenu = async row => {
  dialogMenuVisible.value = true
  roleId = row.id
  const { data } = await getAllMenus(row.id)   // 请求后端地址获取所有的菜单数据，以及当前角色所对应的菜单数据
  sysMenuTreeList.value = data.sysMenuList
  tree.value.setCheckedKeys(data.roleMenuIds)   // 进行数据回显
  //console.log("data"+data.roleMenuIds)
}

const doAssign = async () => {
  const checkedNodes = tree.value.getCheckedNodes() ; // 获取选中的节点
  const checkedNodesIds = checkedNodes.map(node => {  // 获取选中的节点的id
    return {
      id: node.id,
      isHalf: 0
    }
  })

  // 获取半选中的节点数据，当一个节点的子节点被部分选中时，该节点会呈现出半选中的状态
  const halfCheckedNodes = tree.value.getHalfCheckedNodes() ;
  const halfCheckedNodesIds = halfCheckedNodes.map(node => {   // 获取半选中节点的id
    return {
      id: node.id,
      isHalf: 1
    }
  })

  // 将选中的节点id和半选中的节点的id进行合并
  const menuIds = [...checkedNodesIds , ...halfCheckedNodesIds]
  //console.log(menuIds);

  // 构建请求数据
  const assignMenuDto = {
    roleId: roleId,
    menuIdList: menuIds
  }

  // 发送请求
  const {code, message} = await allocateMenus(assignMenuDto) ;
  if (code === 200) {
    ElMessage.success(message)
    dialogMenuVisible.value = false
    fetchData()
  }else {
    ElMessage.error(message)
  }
}

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