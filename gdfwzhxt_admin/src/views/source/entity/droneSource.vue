<template>
  <div class="droneSource">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      无人机信息资源管理
    </h2>

    <!--  查询条件  -->
    <div class="search-div">
      <el-form label-width="100px" size="small">
        <!--    第一行查询条件    -->
        <el-row>
          <el-col :span="12">
            <el-form-item label="无人机编码">
              <el-input
                v-model="droneQueryDto.droneNo"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="无人机名称">
              <el-input
                v-model="droneQueryDto.droneName"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <!--    按钮行查询条件    -->
        <el-row style="display:flex">
          <el-button type="primary" size="small" @click="searchDroneInfo">
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  添加无人机  -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addShow">添 加</el-button>
    </div>

    <!-- 添加修改无人机模态窗口 -->
    <el-dialog v-model="dialogVisible" title="添加或修改无人机" width="40%">
      <el-form label-width="120px">
        <el-form-item label="无人机编码">
          <el-input v-model="droneInfo.droneNo" style="width: 100%" clearable />
        </el-form-item>
        <el-form-item label="无人机名称">
          <el-input
            v-model="droneInfo.droneName"
            style="width: 100%"
            clearable
          />
        </el-form-item>
        <el-form-item label="无人机展示图">
          <el-upload
            class="avatar-uploader"
            action="http://localhost:8501/electricity/system/fileUpload"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :headers="headers"
          >
            <img
              v-if="droneInfo.droneImage"
              :src="droneInfo.droneImage"
              class="avatar"
            />
            <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
          </el-upload>
        </el-form-item>
        <el-form-item label="生产日期">
          <el-date-picker
            v-model="droneInfo.produceDate"
            type="date"
            style="width: 100%"
            placeholder="选择日期时间"
            :editable="false"
            :value-format="'YYYY-MM-DD'"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="运行日期">
          <el-date-picker
            v-model="droneInfo.runDate"
            type="date"
            style="width: 100%"
            placeholder="选择日期时间"
            :editable="false"
            :value-format="'YYYY-MM-DD'"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="生产厂家">
          <el-input
            v-model="droneInfo.produceCompany"
            style="width: 100%"
            clearable
          />
        </el-form-item>
        <el-form-item label="巡视范围">
          <el-input
            type="textarea"
            style="width: 100%"
            :rows="3"
            placeholder="请输入内容"
            v-model="droneInfo.viewArea"
          ></el-input>
        </el-form-item>
        <el-form-item label="备注">
          <el-input
            type="textarea"
            style="width: 100%"
            :rows="3"
            placeholder="请输入内容"
            v-model="droneInfo.remark"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submit">提交</el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!-- 无人机资源展示表格   -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column label="操作" align="center" width="200" #default="scope">
        <el-button
          type="primary"
          size="small"
          @click="editDroneInfo(scope.row)"
        >
          修改
        </el-button>
        <el-button
          type="danger"
          size="small"
          @click="deleteDroneInfoById(scope.row)"
        >
          删除
        </el-button>
      </el-table-column>
      <el-table-column prop="droneNo" label="无人机编号" width="100" />
      <el-table-column prop="droneName" label="无人机名称" width="120" />
      <el-table-column
        prop="droneImage"
        label="头像"
        #default="scope"
        width="100"
      >
        <img :src="scope.row.droneImage" width="80" />
      </el-table-column>
      <el-table-column prop="produceDate" label="生产日期" width="120" />
      <el-table-column prop="runDate" label="运行日期" width="120" />
      <el-table-column prop="produceCompany" label="生产厂家" width="120" />
      <el-table-column prop="viewArea" label="巡视范围" width="180" />
      <el-table-column prop="remark" label="备注" width="200" />
      <el-table-column prop="createTime" label="记录创建时间" width="180" />
      <el-table-column prop="createBy" label="记录创建者" width="100" />
      <el-table-column prop="updateTime" label="记录修改时间" width="180" />
      <el-table-column prop="updateBy" label="记录修改者" width="100" />
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
import {
  DeleteDroneInfoById,
  GetDroneInfoByConditionAndPage,
  SaveDroneInfo,
} from '@/api/drone'
import { useApp } from '@/pinia/modules/app'
import { ElMessage, ElMessageBox } from 'element-plus'

//---------------------------------------------列表---------------------------------------------------
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
const droneQueryDto = ref({
  droneNo: '',
  droneName: '',
})

//钩子函数
onMounted(() => {
  fetchData()
})

//查询列表数据
const fetchData = async () => {
  const { data } = await GetDroneInfoByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    droneQueryDto.value
  )
  list.value = data.list
  total.value = data.total
}

//搜索方法
const searchDroneInfo = () => {
  fetchData()
}

//重置方法
const resetData = () => {
  droneQueryDto.value = {}
  fetchData()
}

//---------------------------------------------------------添加或修改无人机----------------------------------------
const droneInfo = ref({
  droneNo: '', //无人机编码
  droneName: '', //无人机名称
  droneImage: '', //无人机图片
  produceDate: '', //生产日期
  runDate: '', //运行日期
  produceCompany: '', //生产厂家
  viewArea: '', //巡视范围（投运地址）
  remark: '',
})
//控制添加或修改模态窗口开闭
const dialogVisible = ref(false)

//点击添加按钮
const addShow = () => {
  droneInfo.value = {}
  dialogVisible.value = true
}

//点击修改按钮
const editDroneInfo = row => {
  droneInfo.value = { ...row }
  dialogVisible.value = true
}

//点击添加或修改窗口中的提交按钮
const submit = async () => {
  if (droneInfo.value.droneNo == undefined) {
    ElMessage.warning('【无人机编码】不能为空')
    return
  }
  if (droneInfo.value.droneName == undefined) {
    ElMessage.warning('【无人机名称】不能为空')
    return
  }
  const { code, message } = await SaveDroneInfo(droneInfo.value)
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
  droneInfo.value.droneImage = response.data
}

//--------------------------------------------------删除无人机-------------------------------------
const deleteDroneInfoById = row => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await DeleteDroneInfoById(row.id)
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
.droneSource {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.droneSource::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/drons.gif');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.droneSource > * {
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
