<template>
  <div class="customerInfoDT">
    <h1 style="margin-top: 10px; font-family: 方正姚体; color: black">
      &emsp;
      <el-icon>
        <User />
      </el-icon>
      客户信息管理
    </h1>

    <!--  查询条件  -->
    <div class="search-div">
      <el-form label-width="120px" size="small">
        <!--    第一行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="客户名称">
              <el-input
                v-model="customerInfoQueryDto.customerName"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="客户编号">
              <el-input
                v-model="customerInfoQueryDto.customerNo"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="性别">
              <el-select
                v-model="customerInfoQueryDto.customerGender"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in sexItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="客户年龄（大于）">
              <el-input-number
                v-model="customerInfoQueryDto.customerAgeBegin"
                :precision="0"
                :step="1"
                :min="1"
                :max="100"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
        </el-row>
        <!--   第二行查询条件     -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="客户年龄（小于）">
              <el-input-number
                v-model="customerInfoQueryDto.customerAgeEnd"
                :precision="0"
                :step="1"
                :min="1"
                :max="100"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="客户类型">
              <el-select
                v-model="customerInfoQueryDto.customerType"
                placeholder="请选择"
                multiple
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in customerTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="国家">
              <el-select
                v-model="customerInfoQueryDto.country"
                placeholder="请选择（支持搜索）"
                multiple
                filterable
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in countryItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="州">
              <el-input
                v-model="customerInfoQueryDto.state"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <!--    第三行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="城市">
              <el-input
                v-model="customerInfoQueryDto.city"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="返单次数（大于）">
              <el-input-number
                v-model="customerInfoQueryDto.repeatOrderCountBegin"
                :precision="0"
                :step="1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="返单次数（小于）">
              <el-input-number
                v-model="customerInfoQueryDto.repeatOrderCountEnd"
                :precision="0"
                :step="1"
                :max="10000"
                style="width: 100%"
              ></el-input-number>
            </el-form-item>
          </el-col>
        </el-row>
        <!--    按钮行查询条件    -->
        <el-row style="display:flex">
          <el-button type="primary" size="small" @click="searchCustomerInfo">
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  添加客户信息  -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addShow">
        录入客户信息
      </el-button>
    </div>

    <!-- 添加修改客户信息模态窗口 -->
    <el-dialog
      v-model="dialogVisible"
      :title="customerInfo.id ? '修改客户信息' : '录入客户信息'"
      width="80%"
      class="custom-dialog enhanced-dialog"
      :close-on-click-modal="false"
      :lock-scroll="false"
      align-center
      draggable
    >
      <div class="dialog-content">
        <el-form label-width="120px" class="scrollable-form">
          <el-form label-width="120px">
            <!--    第一行    -->
            <el-row>
              <el-col :span="12">
                <el-form-item label="客户名称">
                  <el-input
                    v-model="customerInfo.customerName"
                    style="width: 100%"
                    clearable
                  />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="客户编号">
                  <el-input
                    v-model="customerInfo.customerNo"
                    style="width: 100%"
                    disabled="true"
                    clearable
                  />
                </el-form-item>
              </el-col>
            </el-row>
            <!--   第二行     -->
            <el-row>
              <el-col :span="12">
                <el-form-item label="客户性别">
                  <el-radio-group v-model="customerInfo.customerGender">
                    <el-radio
                      v-for="(item, index) in sexItem"
                      :key="index"
                      :label="item.value"
                    >
                      {{ item.text }}
                    </el-radio>
                  </el-radio-group>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="客户年龄">
                  <el-input-number
                    v-model="customerInfo.customerAge"
                    :precision="0"
                    :step="1"
                    :max="100"
                    style="width: 100%"
                  ></el-input-number>
                </el-form-item>
              </el-col>
            </el-row>
            <!--   第三行    -->
            <el-row>
              <el-col :span="12">
                <el-form-item label="客户照片">
                  <el-upload
                    class="avatar-uploader"
                    action="http://localhost:8501/electricity/system/fileUpload"
                    :show-file-list="false"
                    :on-success="handleAvatarSuccess"
                    :headers="headers"
                  >
                    <img
                      v-if="customerInfo.customerPicture"
                      :src="customerInfo.customerPicture"
                      class="avatar"
                    />
                    <el-icon v-else class="avatar-uploader-icon">
                      <Plus />
                    </el-icon>
                  </el-upload>
                </el-form-item>
              </el-col>
            </el-row>
            <!--    第四行    -->
            <el-row>
              <el-col :span="12">
                <el-form-item label="客户类型">
                  <el-select
                    v-model="customerInfo.customerType"
                    placeholder="请选择"
                    style="width: 100%"
                    @change="customerInfoTypeChange"
                    clearable
                  >
                    <el-option
                      v-for="item in customerTypeItem"
                      :key="item.value"
                      :label="item.text"
                      :value="item.value"
                    ></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="客户电话">
                  <el-input
                    v-model="customerInfo.customerTel"
                    style="width: 100%"
                    clearable
                  />
                </el-form-item>
              </el-col>
            </el-row>
            <!--    第五行    -->
            <el-row>
              <el-col :span="12">
                <el-form-item label="客户邮箱">
                  <el-input
                    v-model="customerInfo.customerEmail"
                    style="width: 100%"
                    clearable
                  />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="客户邮编">
                  <el-input
                    v-model="customerInfo.postcode"
                    style="width: 100%"
                    clearable
                  />
                </el-form-item>
              </el-col>
            </el-row>
            <!--   第六行     -->
            <el-row>
              <el-col :span="12">
                <el-form-item label="国家">
                  <el-select
                    v-model="customerInfo.country"
                    placeholder="请选择（支持搜索）"
                    filterable
                    style="width: 100%"
                    clearable
                  >
                    <el-option
                      v-for="item in countryItem"
                      :key="item.value"
                      :label="item.text"
                      :value="item.value"
                    ></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="州">
                  <el-input
                    v-model="customerInfo.state"
                    style="width: 100%"
                    clearable
                  />
                </el-form-item>
              </el-col>
            </el-row>
            <!--   第七行     -->
            <el-row>
              <el-col :span="12">
                <el-form-item label="城市">
                  <el-input
                    v-model="customerInfo.city"
                    style="width: 100%"
                    clearable
                  />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="客户详细地址">
                  <el-input
                    v-model="customerInfo.customerAddress"
                    style="width: 100%"
                    clearable
                  />
                </el-form-item>
              </el-col>
            </el-row>
            <!--    第八行    -->
            <el-row>
              <el-col :span="12">
                <el-form-item label="客户交易次数">
                  <el-input-number
                    v-model="customerInfo.repeatOrderCount"
                    :precision="0"
                    :step="1"
                    :max="10000"
                    :disabled="disable1"
                    style="width: 100%"
                  ></el-input-number>
                </el-form-item>
              </el-col>
            </el-row>
            <!--   第九行     -->
            <el-row>
              <el-col :span="24">
                <el-form-item label="客户详细信息">
                  <el-input
                    type="textarea"
                    style="width: 100%"
                    :rows="5"
                    placeholder="请输入内容"
                    v-model="customerInfo.customerDetail"
                  ></el-input>
                </el-form-item>
              </el-col>
            </el-row>
            <!--     第十行       -->
            <el-row>
              <el-col :span="24">
                <el-form-item label="客户分析">
                  <el-input
                    type="textarea"
                    style="width: 100%"
                    :rows="5"
                    disabled="true"
                    placeholder="该内容由订单走完后自动生成"
                    v-model="customerInfo.analyse"
                  ></el-input>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </el-form>
      </div>

      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submit">提交</el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 客户信息展示表格   -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column label="操作" align="center" width="200" #default="scope">
        <el-button
          type="primary"
          size="small"
          @click="editCustomerInfo(scope.row)"
        >
          修改
        </el-button>
        <el-button
          type="danger"
          size="small"
          @click="deleteCustomerInfoById(scope.row)"
        >
          删除
        </el-button>
      </el-table-column>
      <el-table-column prop="customerNo" label="客户编号" width="100" />
      <el-table-column prop="customerName" label="客户名称" width="120" />
      <el-table-column
        prop="customerPicture"
        label="客户照片"
        #default="scope"
        width="100"
      >
        <img :src="scope.row.customerPicture" width="80" />
      </el-table-column>
      <el-table-column
        prop="repeatOrderCount"
        label="客户交易次数"
        width="120"
      />
      <!-- 修改性别列 -->
      <el-table-column
        prop="customerGender"
        label="客户性别"
        width="90"
        #default="scope"
      >
        {{ getDisplayText(scope.row.customerGender, sexItem) }}
      </el-table-column>
      <el-table-column prop="customerAge" label="客户年龄" width="90" />
      <!-- 修改客户类型列 -->
      <el-table-column
        prop="customerType"
        label="客户类型"
        width="120"
        #default="scope"
      >
        {{ getDisplayText(scope.row.customerType, customerTypeItem) }}
      </el-table-column>
      <el-table-column prop="customerTel" label="客户电话" width="140" />
      <el-table-column prop="customerEmail" label="客户邮箱" width="140" />
      <!-- 修改国家列 -->
      <el-table-column prop="country" label="国家" width="120" #default="scope">
        {{ getDisplayText(scope.row.country, countryItem) }}
      </el-table-column>
      <el-table-column prop="state" label="州（省）" width="120" />
      <el-table-column prop="city" label="城市" width="120" />
      <el-table-column prop="customerAddress" label="客户地址" width="180" />
      <el-table-column prop="postcode" label="邮编" width="140" />
      <el-table-column prop="customerDetail" label="客户详细信息" width="200" />
      <el-table-column prop="analyse" label="客户分析" width="200" />
      <el-table-column prop="createTime" label="记录创建时间" width="180" />
      <el-table-column prop="createBy" label="创建人" width="120" />
      <el-table-column prop="updateTime" label="记录修改时间" width="180" />
      <el-table-column prop="updateBy" label="修改人" width="120" />
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
import { useApp } from '@/pinia/modules/app'
import { dayjs, ElMessage, ElMessageBox } from 'element-plus'
import { GetKeyAndValueByType } from '@/api/sysDict'
import {
  DeleteCustomerInfoById,
  GetCustomerInfoByConditionAndPage,
  SaveCustomerInfo,
} from '@/api/saleManage'

//---------------------------------------------客户信息查询列表---------------------------------------------------
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
const customerInfoQueryDto = ref({
  customerName: '',
  customerNo: '',
  customerGender: '',
  customerAgeBegin: null,
  customerAgeEnd: null,
  customerType: [],
  country: [],
  state: '',
  city: '',
  repeatOrderCountBegin: null,
  repeatOrderCountEnd: null,
})

const sexItem = ref([]) //性别下拉列表
const customerTypeItem = ref([]) //客户类型下拉列表
const countryItem = ref([]) //国家下拉列表项

// 通用方法：根据值和映射表获取中文文本
const getDisplayText = (value, mappingArray) => {
  if (!value) return '-'
  const foundItem = mappingArray.find(item => item.value === value)
  return foundItem ? foundItem.text : value
}

//钩子函数
onMounted(() => {
  getSexItem()
  getCustomerTypeItem()
  getCountryItem()
  fetchData()
})

//获取性别下拉列表
const getSexItem = async () => {
  const { data } = await GetKeyAndValueByType('t_user_sex')
  sexItem.value = data
}
//获取客户类型下拉列表
const getCustomerTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_customer_into_type')
  customerTypeItem.value = data
}
//获取国家下拉列表
const getCountryItem = async () => {
  const { data } = await GetKeyAndValueByType('t_customer_country')
  countryItem.value = data
}

//查询列表数据
const fetchData = async () => {
  const { data } = await GetCustomerInfoByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    customerInfoQueryDto.value
  )
  list.value = data.list
  total.value = data.total
}

//搜索方法
const searchCustomerInfo = () => {
  fetchData()
}

//重置方法
const resetData = () => {
  customerInfoQueryDto.value = {}
  fetchData()
}

//---------------------------------------------------------添加或修改客户信息----------------------------------------
const customerInfo = ref({
  customerName: '', //客户名称
  customerNo: '', //客户编号
  customerGender: '', //客户性别
  customerAge: '', //客户年龄
  customerPicture: '', //客户照片
  customerType: '', //客户类型（1：新客户 2：二次交易客户 3：忠实客户 4：重要客户）
  customerTel: '', //客户电话
  customerEmail: '', //客户邮箱
  customerAddress: '', //客户地址
  customerDetail: '', //客户详细信息
  country: '', //国家
  state: '', //州
  city: '', //城市
  postcode: '', //邮编
  repeatOrderCount: '', //客户返单次数
})
//控制添加或修改模态窗口开闭
const dialogVisible = ref(false)
const disable1 = ref(false) //设置文本框不可操作1

//将时间作为编号的通用函数
const getNoByCurrentTime = () => {
  return dayjs()
    .format('YYYY/MM/DD HH:mm:ss')
    .replaceAll('/', '')
    .replaceAll(' ', '')
    .replaceAll(':', '')
}

//客户类型值改变事件
const customerInfoTypeChange = () => {
  if (customerInfo.value.customerType == 1) {
    customerInfo.value.repeatOrderCount = 1
    disable1.value = true
  } else {
    customerInfo.value.repeatOrderCount = null
    disable1.value = false
  }
}

//点击添加按钮
const addShow = () => {
  customerInfo.value = {}
  customerInfo.value.customerNo = getNoByCurrentTime()
  dialogVisible.value = true
}

//点击修改按钮
const editCustomerInfo = row => {
  customerInfo.value = { ...row }
  dialogVisible.value = true
}

//点击添加或修改窗口中的提交按钮
const submit = async () => {
  if (
    customerInfo.value.customerType == undefined ||
    customerInfo.value.customerType == ''
  ) {
    ElMessage.warning('【客户类型】不能为空')
    return
  }
  const { code, message } = await SaveCustomerInfo(customerInfo.value)
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
  customerInfo.value.customerPicture = response.data
}

//--------------------------------------------------删除客户信息-------------------------------------
const deleteCustomerInfoById = row => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await DeleteCustomerInfoById(row.id)
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
.customerInfoDT {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.customerInfoDT::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/lsdq.png');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.customerInfoDT > * {
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

/* 添加或修改模态窗口样式优化 */
:deep(.enhanced-dialog) {
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 16px 40px rgba(0, 0, 0, 0.2);
  max-height: 80vh !important;
}

:deep(.enhanced-dialog .el-dialog) {
  display: flex;
  flex-direction: column;
  max-height: 80vh !important;
  min-height: 600px;
}

/* 重点调整：标题栏高度优化 */
:deep(.enhanced-dialog .el-dialog__header) {
  background: linear-gradient(135deg, #409eff 0%, #337ecc 100%);
  margin: 0;
  padding: 12px 20px; /* 减少上下内边距 */
  display: flex;
  align-items: center;
  min-height: 40px; /* 显著减少头部高度 */
  position: relative;
}

:deep(.enhanced-dialog .el-dialog__title) {
  color: white;
  font-weight: 600;
  font-size: 16px; /* 适当减小标题字体 */
  line-height: 1.2;
  flex: 1;
}

:deep(.enhanced-dialog .el-dialog__headerbtn) {
  position: absolute;
  top: 50% !important;
  right: 16px;
  transform: translateY(-50%);
  margin-top: 0;
  height: 24px; /* 减小关闭按钮尺寸 */
  width: 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: all 0.3s ease;
}

:deep(.enhanced-dialog .el-dialog__headerbtn .el-dialog__close) {
  color: white;
  font-size: 20px; /* 减小关闭图标大小 */
  font-weight: bold;
}

:deep(.enhanced-dialog .el-dialog__body) {
  padding: 0;
  max-height: calc(80vh - 100px) !important; /* 相应调整内容区域高度 */
  overflow: hidden;
  display: flex;
  flex: 1;
}

.dialog-content {
  width: 100%;
  padding: 20px;
}

.scrollable-form {
  max-height: calc(80vh - 160px); /* 相应调整可滚动区域高度 */
  overflow-y: auto;
  padding-right: 12px;
}

/* 底部按钮区域优化 */
.dialog-footer {
  display: flex;
  justify-content: center;
  gap: 20px;
  padding: 16px 20px;
  border-top: 1px solid #e8e8e8;
  background: #fafafa;
}

:deep(.enhanced-dialog .el-dialog__footer) {
  padding: 0;
}

/* 底部按钮样式优化 */
.dialog-footer .el-button {
  min-width: 100px;
  padding: 10px 24px;
}

/* 上传区域样式优化 */
:deep(.avatar-uploader) {
  border: 2px dashed #dcdfe6;
  border-radius: 8px;
  transition: all 0.3s ease;
  height: 178px;
  width: 178px;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  position: relative;
}

:deep(.avatar-uploader .avatar) {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

:deep(.avatar-uploader .el-upload) {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

:deep(.avatar-uploader-icon) {
  font-size: 28px;
  color: #8c939d;
}

:deep(.avatar-uploader:hover) {
  border-color: #409eff;
  box-shadow: 0 0 8px rgba(64, 158, 255, 0.3);
}

/* 表单布局优化 */
:deep(.scrollable-form .el-form-item) {
  margin-bottom: 18px;
}

:deep(.scrollable-form .el-row) {
  margin-bottom: 10px;
}

/* 单选框组样式调整 */
:deep(.scrollable-form .el-radio-group) {
  display: flex;
  gap: 15px;
  align-items: center;
  height: 32px;
}

:deep(.scrollable-form .el-radio) {
  margin-right: 0;
}

/* 文本域样式调整 */
:deep(.scrollable-form .el-textarea .el-textarea__inner) {
  min-height: 100px;
  resize: vertical;
}

/* 响应式调整 */
@media (max-height: 700px) {
  :deep(.enhanced-dialog) {
    max-height: 90vh !important;
  }

  :deep(.enhanced-dialog .el-dialog__body) {
    max-height: calc(90vh - 100px) !important;
  }

  .scrollable-form {
    max-height: calc(90vh - 160px);
  }

  :deep(.avatar-uploader) {
    height: 150px;
    width: 150px;
  }
}

/* 动画效果优化 */
:deep(.enhanced-dialog .el-dialog) {
  animation: dialog-fade-in 0.3s ease;
}

@keyframes dialog-fade-in {
  0% {
    opacity: 0;
    transform: translateY(-20px) scale(0.95);
  }
  100% {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

/* 滚动条优化 */
.scrollable-form::-webkit-scrollbar {
  width: 6px;
}

.scrollable-form::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 3px;
}

.scrollable-form::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 3px;
}

.scrollable-form::-webkit-scrollbar-thumb:hover {
  background: #a8a8a8;
}
</style>
