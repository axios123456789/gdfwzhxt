<template>
  <div class="sysUserZbj">
    <!---搜索表单-->
    <div class="search-div">
      <el-form label-width="70px" size="small">
        <el-row>
          <el-col :span="6">
            <el-form-item label="账号">
              <el-input
                v-model="queryDto.account"
                style="width: 100%"
                placeholder="账号"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="用户名称">
              <el-input
                v-model="queryDto.name"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="创建时间">
              <el-date-picker
                v-model="createTimes"
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
        <el-row>
          <el-col :span="6">
            <el-form-item label="账号等级">
              <el-select
                v-model="queryDto.level"
                multiple
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in levelItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="账号状态">
              <el-select
                v-model="queryDto.status"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in StatusItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row style="display:flex">
          <el-button type="primary" size="small" @click="searchSysUser">
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--添加按钮-->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addUser">添 加</el-button>
    </div>

    <!-- 添加修改用户模态窗口 -->
    <el-dialog v-model="dialogVisible" title="添加修改用户" width="40%">
      <el-form label-width="120px">
        <el-form-item label="用户账号">
          <el-input v-model="sysUser.loginAccount" />
        </el-form-item>
        <el-form-item v-if="sysUser.id == null" label="密码">
          <el-input
            type="password"
            show-password
            v-model="sysUser.loginPassword"
          />
        </el-form-item>
        <el-form-item v-if="sysUser.id != null" label="状态">
          <el-select
            v-model="sysUser.status"
            placeholder="请选择"
            style="width: 100%"
            clearable
          >
            <el-option
              v-for="item in StatusItem"
              :key="item.value"
              :label="item.text"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="账号等级">
          <el-select
            v-model="sysUser.level"
            placeholder="请选择"
            style="width: 100%"
            clearable
          >
            <el-option
              v-for="item in levelItemByPower"
              :key="item.value"
              :label="item.text"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="用户姓名">
          <el-input v-model="sysUser.name" />
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="sysUser.sex">
            <el-radio
              v-for="(item, index) in sexItem"
              :key="index"
              :label="item.value"
            >
              {{ item.text }}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="手机">
          <el-input v-model="sysUser.phone" />
        </el-form-item>
        <el-form-item label="头像">
          <el-upload
            class="avatar-uploader"
            action="http://localhost:8501/electricity/system/fileUpload"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :headers="headers"
          >
            <img v-if="sysUser.avatar" :src="sysUser.avatar" class="avatar" />
            <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
          </el-upload>
        </el-form-item>
        <el-form-item label="用户地址">
          <el-input v-model="sysUser.address" />
        </el-form-item>
        <el-form-item label="描述">
          <el-input v-model="sysUser.description" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submit">提交</el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!---数据表格-->
    <el-table :data="list" style="width: 100%">
      <el-table-column label="操作" align="center" width="280" #default="scope">
        <el-button type="primary" size="small" @click="editUser(scope.row)">
          修改
        </el-button>
        <el-button
          type="danger"
          size="small"
          @click="deleteUserById(scope.row)"
        >
          删除
        </el-button>
        <el-button
          type="warning"
          size="small"
          @click="showAssignRole(scope.row)"
        >
          分配角色
        </el-button>
      </el-table-column>
      <el-table-column prop="loginAccount" label="账号" width="100" />
      <el-table-column prop="name" label="用户姓名" width="120" />
      <el-table-column prop="sex" label="性别" #default="scope" width="100">
        {{ scope.row.sex == 1 ? '男' : scope.row.sex == 2 ? '女' : '无' }}
      </el-table-column>
      <el-table-column prop="phone" label="手机" width="120" />
      <el-table-column prop="levelName" label="账号等级" width="80" />
      <el-table-column prop="avatar" label="头像" #default="scope">
        <img :src="scope.row.avatar" width="50" />
      </el-table-column>
      <el-table-column prop="description" label="描述" width="200" />
      <el-table-column prop="address" label="地址" width="200" />
      <el-table-column prop="company" label="所属公司" width="120" />
      <el-table-column prop="status" label="状态" #default="scope" width="100">
        {{ scope.row.status == 1 ? '正常' : '停用' }}
      </el-table-column>
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

    <!-- 分配角色的模态窗口 -->
    <el-dialog v-model="dialogRoleVisible" title="分配角色" width="40%">
      <el-form label-width="80px">
        <el-form-item label="用户名">
          <el-input disabled :value="sysUser.name"></el-input>
        </el-form-item>

        <el-form-item label="角色列表">
          <el-checkbox
            :indeterminate="isIndeterminate"
            v-model="checkAll"
            @change="handleCheckAllChange"
          >
            全选
          </el-checkbox>
          <div style="margin: 15px 0;"></div>
          <el-checkbox-group
            v-model="userRoleIds"
            @change="handleCheckedCitiesChange"
          >
            <el-checkbox
              v-for="role in allRoles"
              :label="role.id"
              :key="role.id"
            >
              {{ role.roleName }}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="doAssign">提交</el-button>
          <el-button @click="dialogRoleVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { GetKeyAndValueByType, GetUserLevelByPower } from '@/api/sysDict'
import {
  allocateRoles,
  DeleteUserById,
  GetSysUserListByPage,
  SaveSysUser,
} from '@/api/sysUser'
import { useApp } from '@/pinia/modules/app'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getAllRoles } from '@/api/sysRole'

//-----------------------------------------------------------列表方法---------------------------------------------
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
  account: '',
  name: '',
  beginTime: '',
  endTime: '',
  level: [],
  status: '',
})

//开始时间和结束时间数据模型
const createTimes = ref([])
//账号等级下拉选项
const levelItem = ref([])
//账号状态下拉选项
const StatusItem = ref([])

//钩子函数
onMounted(() => {
  //获取账号等级下拉列表项
  getLevelItem()
  //获取账号状态下拉列表
  getStatusItem()
  //展示列表数据
  fetchData()
})

//发送请求，获取账号等级的下拉列表
const getLevelItem = async () => {
  const { data } = await GetKeyAndValueByType('t_user_level')
  levelItem.value = data
}
//发送请求，获取账号状态的下拉列表
const getStatusItem = async () => {
  const { data } = await GetKeyAndValueByType('t_user_status')
  StatusItem.value = data
}

//列表方法：axios请求调用接口得到数据
const fetchData = async () => {
  const { data, code, message } = await GetSysUserListByPage(
    pageParams.value.page,
    pageParams.value.limit,
    queryDto.value
  )
  list.value = data.list
  total.value = data.total
}

//搜索方法
const searchSysUser = () => {
  queryDto.value.beginTime = createTimes.value[0]
  queryDto.value.endTime = createTimes.value[1]
  fetchData()
}

//重置方法
const resetData = () => {
  createTimes.value = []
  queryDto.value = {}
  fetchData()
}

//----------------------------------------------添加/修改用户--------------------------------------------
const sysUser = ref({
  id: '',
  loginAccount: '',
  name: '',
  status: '',
  level: '',
  address: '',
  sex: '',
  phone: '',
  loginPassword: '',
  description: '',
  avatar: '',
}) //用户对象模型
const sexItem = ref([]) //性别下拉列表
const levelItemByPower = ref([]) //账号等级下拉列表（权限分级）
const dialogVisible = ref(false) //模态窗口默认关闭

//添加用户按钮触发事件
const addUser = () => {
  getSexItem()
  getLevelItemByPower()
  sysUser.value = {}
  dialogVisible.value = true
}
//修改用户按钮触发事件
const editUser = row => {
  getSexItem()
  getLevelItemByPower()
  sysUser.value = { ...row }
  dialogVisible.value = true
}
//获取性别下拉列表
const getSexItem = async () => {
  const { data } = await GetKeyAndValueByType('t_user_sex')
  sexItem.value = data
}
//获取账号等级下拉列表
const getLevelItemByPower = async () => {
  const { data } = await GetUserLevelByPower('t_user_level')
  levelItemByPower.value = data
}

//提交方法
const submit = async () => {
  if (sysUser.value.loginAccount == undefined) {
    ElMessage.warning('【用户账号】不能为空')
    return
  }
  if (sysUser.value.loginPassword == undefined) {
    ElMessage.warning('【密码】不能为空')
    return
  }
  if (sysUser.value.name == undefined) {
    ElMessage.warning('【用户名称】不能为空')
    return
  }
  if (sysUser.value.sex == undefined) {
    ElMessage.warning('【性别】不能为空')
    return
  }
  if (sysUser.value.level == undefined) {
    ElMessage.warning('【账号等级】不能为空')
    return
  }
  const { code, message } = await SaveSysUser(sysUser.value)
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

//-------------------------------------------------文件上传--------------------------------------------
const headers = {
  token: useApp().authorization.token, // 从pinia中获取token，在进行文件上传的时候将token设置到请求头中
}

// 图像上传成功以后的事件处理函数
const handleAvatarSuccess = (response, uploadFile) => {
  sysUser.value.avatar = response.data
}

//---------------------------------------------删除用户----------------------------------------------
const deleteUserById = row => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await DeleteUserById(row.id)
    if (code === 200) {
      ElMessage.success(message)
      fetchData()
    } else {
      ElMessage.error(message)
    }
  })
}

//-------------------------------------------分配角色--------------------------------------------
const dialogRoleVisible = ref(false)

//设置 indeterminate 状态，只负责样式控制
const isIndeterminate = ref(true)

//设置全选状态
const checkAll = ref(false)

//设置默认选中的角色
const userRoleIds = ref([])

//所有角色的数据模型
/*const allRoles = ref({
  id: "",
  roleName: ""
});*/
const allRoles = ref([
  { id: 1, roleName: '管理员' },
  { id: 2, roleName: '业务人员' },
  { id: 3, roleName: '商品录入员' },
])

const handleCheckAllChange = () => {
  if (checkAll.value) {
    for (let i = 0; i < allRoles.value.length; i++) {
      userRoleIds.value[i] = allRoles.value[i].id
    }
    isIndeterminate.value = false
  } else {
    userRoleIds.value = []
    isIndeterminate.value = true
  }
}
const handleCheckedCitiesChange = () => {
  //console.log("data",userRoleIds.value)
  if (userRoleIds.value.length === allRoles.value.length) {
    checkAll.value = true
    isIndeterminate.value = false
  }
  if (
    userRoleIds.value.length > 0 &&
    userRoleIds.value.length < allRoles.value.length
  ) {
    checkAll.value = false
    isIndeterminate.value = true
  }
}

//点击分配角色后触发
const showAssignRole = async row => {
  sysUser.value = { ...row }
  dialogRoleVisible.value = true

  //查询所有角色
  const { data } = await getAllRoles(row.id)
  allRoles.value = data.allRoleList

  //用户分配过的角色
  userRoleIds.value = data.sysUserRoles
}

//点击提交后分配角色
const doAssign = async () => {
  if (userRoleIds.value.length == 0) {
    ElMessage.warning('必须选择一个或多个角色')
    return
  }

  let assignRoleVo = {
    userId: sysUser.value.id,
    roleIdList: userRoleIds.value,
  }

  //发送axios请求，进行分配角色
  const { code, message } = await allocateRoles(assignRoleVo)
  if (code === 200) {
    ElMessage.success(message)
    dialogRoleVisible.value = false
    fetchData()
  } else {
    ElMessage.error(message)
  }
}
</script>

<style scoped>
.sysUserZbj {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.sysUserZbj::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/qwdt7.gif');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.sysUserZbj > * {
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
.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}
.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}
.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
</style>
