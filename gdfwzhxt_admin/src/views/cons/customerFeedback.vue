<template>
  <div class="customerFeedbackDT">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      客户反馈
    </h2>

    <!--  查询条件框  -->
    <div class="search-div">
      <el-form label-width="120px" size="small">
        <!--    第一行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="用户编号">
              <el-input
                v-model="customerFeedbackQueryDto.consNo"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="用户名称">
              <el-input
                v-model="customerFeedbackQueryDto.consName"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="处理时间">
              <el-date-picker
                v-model="handleTime"
                type="datetimerange"
                range-separator="To"
                start-placeholder="开始时间"
                end-placeholder="结束时间"
                format="YYYY-MM-DD HH:mm:ss"
                value-format="YYYY-MM-DD HH:mm:ss"
                :editable="false"
                clearable
              />
            </el-form-item>
          </el-col>
        </el-row>
        <!--    第二行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="反馈设备类型">
              <el-select
                v-model="customerFeedbackQueryDto.feedbackEquipType"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in feedbackEquipTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="反馈设备">
              <el-input
                v-model="customerFeedbackQueryDto.feedbackEquip"
                clearable
                placeholder="点击文本框选择"
                @click="selectFeedbackEquip"
                readonly
              />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="处理标识">
              <el-select
                v-model="customerFeedbackQueryDto.handleFlag"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in handleFlagItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="反馈级别">
              <el-select
                v-model="customerFeedbackQueryDto.feedbackLevel"
                placeholder="请选择"
                style="width: 100%"
                multiple
                clearable
              >
                <el-option
                  v-for="item in feedbackLevelItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <!--    按钮行查询条件    -->
        <el-row style="display:flex">
          <el-button
            type="primary"
            size="small"
            @click="searchCustomerFeedback"
          >
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  新增客户反馈  -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addCustomerFeedback">
        录 入
      </el-button>
    </div>

    <!--  点击变压器文本框后打开该模态窗口  -->
    <el-dialog
      v-model="dialogVisibleTransformerSelect"
      title="选择变压器"
      width="70%"
    >
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
            <el-button
              type="primary"
              size="small"
              @click="searchTransformerInfo"
            >
              搜索
            </el-button>
            <el-button size="small" @click="resetDataTransformer">
              重置
            </el-button>
          </el-row>
        </el-form>
      </div>

      <!-- 变压器资源展示表格   -->
      <el-table
        :data="transformerList"
        style="width: 100%; margin-bottom: 20px;"
        @cell-click="transformerHandleCellClick"
      >
        <el-table-column
          prop="transformerCode"
          label="变压器局号"
          width="120"
        />
        <el-table-column
          prop="transformerName"
          label="变压器名称"
          width="140"
        />
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
        <el-table-column
          prop="maintenanceRecords"
          label="维护记录"
          width="200"
        />
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
        v-model:current-page="transformerPageParams.page"
        v-model:page-size="transformerPageParams.limit"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="transformerFetchData"
        @current-change="transformerFetchData"
        layout="total, sizes, prev, pager, next"
        :total="transformerTotal"
      />
    </el-dialog>

    <!--  点击线路文本框后打开该模态窗口  -->
    <el-dialog v-model="dialogVisibleLineSelect" title="选择线路" width="65%">
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

    <!--  添加或修改客户反馈记录模态窗口  -->
    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="80%">
      <el-form label-width="140px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户编号">
              <el-input
                v-model="customerFeedback.consNo"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="用户名称">
              <el-input
                v-model="customerFeedback.consName"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="反馈设备类型">
              <el-select
                v-model="customerFeedback.feedbackEquipType"
                placeholder="请选择"
                style="width: 100%"
                :disabled="isDisabled"
                clearable
              >
                <el-option
                  v-for="item in feedbackEquipTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="反馈设备">
              <el-input
                v-model="customerFeedback.feedbackEquipName"
                clearable
                placeholder="点击文本框选择"
                :disabled="isDisabled"
                @click="addAndUpdateFeedbackEquip"
                readonly
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="处理标识*">
              <el-select
                v-model="customerFeedback.handleFlag"
                placeholder="请选择"
                style="width: 100%"
                :disabled="isDisabled2"
                clearable
              >
                <el-option
                  v-for="item in handleFlagItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="反馈级别*">
              <el-select
                v-model="customerFeedback.feedbackLevel"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in feedbackLevelItem"
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
            <el-form-item label="反馈内容">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                v-model="customerFeedback.feedbackContent"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="生成工单拼接内容">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                v-model="customerFeedback.generateWorkOrderContent"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="客户意见">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                v-model="customerFeedback.customerOpinion"
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

    <!--  查询客户反馈情况列表  -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column label="操作" align="center" width="300" #default="scope">
        <el-button
          type="primary"
          size="small"
          @click="editCustomerFeedback(scope.row)"
        >
          修改
        </el-button>
        <el-button
          type="danger"
          size="small"
          @click="deleteCustomerFeedbackById(scope.row)"
        >
          删除
        </el-button>
        <el-button
          v-if="scope.row.feedbackEquip != null && scope.row.handleFlag == 2"
          type="warning"
          size="small"
          @click="generateWorkOrder(scope.row)"
        >
          工单生成
        </el-button>
      </el-table-column>
      <el-table-column prop="consNo" label="客户编号" width="120" />
      <el-table-column prop="consName" label="客户名称" width="120" />
      <el-table-column prop="feedbackContent" label="反馈内容" width="200" />
      <el-table-column prop="handleFlagName" label="处理标识" width="120" />
      <el-table-column prop="feedbackLevelName" label="反馈级别" width="120" />
      <el-table-column
        prop="feedbackEquipTypeName"
        label="反馈设备类型"
        width="120"
      />
      <el-table-column
        prop="feedbackEquipName"
        label="反馈设备名称"
        width="140"
      />
      <el-table-column
        prop="generateWorkOrderContent"
        label="生成工单内容"
        width="200"
      />
      <el-table-column prop="customerOpinion" label="客户意见" width="200" />
      <el-table-column prop="handleTime" label="处理时间" width="180" />
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
import { ElMessage, ElMessageBox } from 'element-plus'
import { GetTransformerInfoListByConditionAndPage } from '@/api/transformerInfo'
import { GetLineInfoListByConditionAndPage } from '@/api/lineInfo'
import { GetUnitListByConditionAndPage } from '@/api/unit'
import {
  DeleteCustomerFeedbackById,
  GenerateWorkOrderByFeedback,
  GetCustomerFeedbackByConditionAndPage,
  SaveCustomerFeedback,
} from '@/api/consInfo'
//-----------------------------------------------客户反馈列表----------------------------------------------
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
//封装客户反馈查询条件参数
const customerFeedbackQueryDto = ref({
  consNo: '',
  consName: '',
  handleFlag: '',
  feedbackLevel: '',
  feedbackEquip: '',
  feedbackEquipType: '',
  handleBeginTime: '',
  handleEndTime: '',
})
const handleTime = ref([]) //封装处理时间参数
const handleFlagItem = ref([]) //封装处理标识键值对
const feedbackLevelItem = ref([]) //封装反馈级别键值对
const feedbackEquipTypeItem = ref([]) //封装反馈设备键值对
const getHandleFlagItem = async () => {
  const { data } = await GetKeyAndValueByType('t_customer_feedback_handle_flag')
  handleFlagItem.value = data
}
const getFeedbackLevelItem = async () => {
  const { data } = await GetKeyAndValueByType('t_customer_feedback_level')
  feedbackLevelItem.value = data
}
const getFeedbackEquipTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_view_record_equip_type')
  feedbackEquipTypeItem.value = data
}
//查询客户反馈记录接口
const fetchData = async () => {
  const { data } = await GetCustomerFeedbackByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    customerFeedbackQueryDto.value
  )
  list.value = data.list
  total.value = data.total
}
//点击搜索按钮
const searchCustomerFeedback = () => {
  customerFeedbackQueryDto.value.handleBeginTime = handleTime.value[0]
  customerFeedbackQueryDto.value.handleEndTime = handleTime.value[1]

  //调用查询客户反馈记录的接口函数
  fetchData()
}
//点击重置按钮
const resetData = () => {
  handleTime.value = []
  customerFeedbackQueryDto.value = {}

  //调用查询客户反馈记录的接口函数
  fetchData()
}
//钩子函数
onMounted(() => {
  getHandleFlagItem()
  getFeedbackLevelItem()
  getFeedbackEquipTypeItem()

  fetchData()
})

//作为判断是查询条件的反馈设备文本框点击还是添加或修改，1：表示查询条件中的... 2：表示添加或修改中的....
const typeFlag = ref()
//点击擦查询反馈设备文本框后触发
const selectFeedbackEquip = () => {
  if (
    customerFeedbackQueryDto.value.feedbackEquipType == null ||
    customerFeedbackQueryDto.value.feedbackEquipType == ''
  ) {
    ElMessage.warning('请先选择设备类型！')
    return
  }

  //根据设备类型进行处理
  if (customerFeedbackQueryDto.value.feedbackEquipType == 1) {
    //线路
    //重置查询条件
    queryLineDto.value = {}
    //获取线路各下拉列表
    getLineTypeItem()
    getLineStatusItem()
    dialogVisibleLineSelect.value = true
    lineFetchData()
  } else if (customerFeedbackQueryDto.value.feedbackEquipType == 2) {
    //配变
    //配变
    //重置查询条件
    queryTransformerDto.value = {}
    getTransformerTypeItem()
    transformerFetchData()
    dialogVisibleTransformerSelect.value = true
  }

  typeFlag.value = 1
}
//点击添加或修改模态窗口中反馈设备后触发
const addAndUpdateFeedbackEquip = () => {
  if (
    customerFeedback.value.feedbackEquipType == null ||
    customerFeedback.value.feedbackEquipType == ''
  ) {
    ElMessage.warning('请先选择设备类型！')
    return
  }

  //根据设备类型进行处理
  if (customerFeedback.value.feedbackEquipType == 1) {
    //线路
    //重置查询条件
    queryLineDto.value = {}
    //获取线路各下拉列表
    getLineTypeItem()
    getLineStatusItem()
    dialogVisibleLineSelect.value = true
    lineFetchData()
  } else if (customerFeedback.value.feedbackEquipType == 2) {
    //配变
    //配变
    //重置查询条件
    queryTransformerDto.value = {}
    getTransformerTypeItem()
    transformerFetchData()
    dialogVisibleTransformerSelect.value = true
  }

  typeFlag.value = 2
}

//------------------------------------点击文本框处理----------------------------------------------
// 定义变压器表格数据模型
const transformerList = ref([])
//分页条数据模型
const transformerTotal = ref(0)
//分页
const transformerPageParamsForm = {
  page: 1,
  limit: 10,
}
const transformerPageParams = ref(transformerPageParamsForm)

//封装变压器查询条件
const queryTransformerDto = ref({
  transformerName: '', //变压器名称
  //model: "",            //变压器型号（TM-100）
  //ratedCapacity: "",    //额定容量kVA
  lineId: '', //所属线路
  lineName: '', //所属线路名称
  transformerType: '', //变压器类型
})
//控制点击所属变压器文本框后模态窗口的开闭
const dialogVisibleTransformerSelect = ref(false)
const transformerTypeItem = ref([])

//发送请求，获取变压器类型的下拉列表
const getTransformerTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_transformer_type')
  transformerTypeItem.value = data
}

//变压器分页列表
const transformerFetchData = async () => {
  const {
    data,
    code,
    message,
  } = await GetTransformerInfoListByConditionAndPage(
    transformerPageParams.value.page,
    transformerPageParams.value.limit,
    queryTransformerDto.value
  )
  transformerList.value = data.list
  transformerTotal.value = data.total
}

//搜索
const searchTransformerInfo = () => {
  transformerFetchData()
}

//重置
const resetDataTransformer = () => {
  queryTransformerDto.value = {}
  transformerFetchData()
}

//变压器单元格点击事件
const transformerHandleCellClick = row => {
  if (typeFlag.value == 1) {
    customerFeedbackQueryDto.value.feedbackEquip = row.transformerCode
    dialogVisibleTransformerSelect.value = false
  } else {
    customerFeedback.value.feedbackEquip = row.transformerCode
    customerFeedback.value.feedbackEquipName = row.transformerName
    dialogVisibleTransformerSelect.value = false
  }
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

//点击所属线路文本框触发
const selectLine = () => {
  //重置查询条件
  queryLineDto.value = {}
  //获取线路各下拉列表
  getLineTypeItem()
  getLineStatusItem()
  dialogVisibleLineSelect.value = true
  lineFetchData()
}
//处理单元格点击事件
const lineHandleCellClick = row => {
  if (typeFlag.value == 1) {
    if (customerFeedbackQueryDto.value.feedbackEquipType == 2) {
      queryTransformerDto.value.lineName = row.lineName
      queryTransformerDto.value.lineId = row.id
      dialogVisibleLineSelect.value = false
    } else if (customerFeedbackQueryDto.value.feedbackEquipType == 1) {
      customerFeedbackQueryDto.value.feedbackEquip = row.id
      dialogVisibleLineSelect.value = false
    }
  } else {
    if (customerFeedback.value.feedbackEquipType == 2) {
      queryTransformerDto.value.lineName = row.lineName
      queryTransformerDto.value.lineId = row.id
      dialogVisibleLineSelect.value = false
    } else if (customerFeedback.value.feedbackEquipType == 1) {
      customerFeedback.value.feedbackEquip = row.id
      customerFeedback.value.feedbackEquipName = row.lineName
      dialogVisibleLineSelect.value = false
    }
  }
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

//-----------------------------------------添加修改客户反馈记录---------------------------------------
const customerFeedback = ref({
  consNo: '', //用户编号
  consName: '', //用户名称
  feedbackContent: '', //反馈内容
  handleFlag: '', //处理标识（1.已处理/2.未处理）
  feedbackLevel: '', //反馈级别（1.紧急反馈 2.个人问题反馈 3.员工问题反馈 4.无效反馈）
  feedbackEquip: '', //反馈设备
  feedbackEquipName: '', //反馈设备名称
  generateWorkOrderContent: '', //生成工单内容
  customerOpinion: '', //客户意见
  feedbackEquipType: '', //反馈设备类型
  handleTime: '', //处理时间
})
const dialogVisible = ref(false) //控制添加或修改客户反馈的模态窗口开闭
const dialogTitle = ref('') //设置添加或修改反馈记录模态窗的标题
const isDisabled = ref() //控制反馈设备类型和反馈设备是否可操作
const isDisabled2 = ref() //控制处理标识是否可操作
//点击录入按钮后触发
const addCustomerFeedback = () => {
  //清空模态窗口中的内容
  customerFeedback.value = {}
  //设置模态窗口标题
  dialogTitle.value = '录入客户反馈记录'

  //设置反馈设备类型和反馈设备可操作
  isDisabled.value = false
  //设置处理标识不可操作
  isDisabled2.value = true

  //设置模态处理标识为未处理
  customerFeedback.value.handleFlag = 2

  //打开模态窗口
  dialogVisible.value = true
}
//点击修改按钮后触发
const editCustomerFeedback = row => {
  customerFeedback.value = { ...row }
  //设置模态窗口标题
  dialogTitle.value = '修改客户反馈记录'
  //设置反馈设备类型和反馈设备不可操作
  isDisabled.value = true
  //设置处理标识可操作
  isDisabled2.value = false
  //打开模态窗口
  dialogVisible.value = true
}
//点击添加或修改模态窗口中的提交按钮后触发
const saveOrUpdate = async () => {
  if (customerFeedback.value.handleFlag == undefined) {
    ElMessage.warning('【处理标识】不能为空')
    return
  }
  if (customerFeedback.value.feedbackLevel == undefined) {
    ElMessage.warning('【反馈级别】不能为空')
    return
  }

  const { code, message } = await SaveCustomerFeedback(customerFeedback.value)
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

//---------------------删除客户反馈记录-------------------------
const deleteCustomerFeedbackById = row => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await DeleteCustomerFeedbackById(row.id)
    if (code === 200) {
      ElMessage.success(message)
      fetchData()
    } else {
      ElMessage.error(message)
    }
  })
}

//--------------工单生成-------------------------
const generateWorkOrder = row => {
  customerFeedback.value = row
  ElMessageBox.confirm(
    '此操作将生成事件和工单并不可回退, 是否继续?',
    'Warning',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  ).then(async () => {
    const { code, message } = await GenerateWorkOrderByFeedback(
      customerFeedback.value
    )
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
.customerFeedbackDT {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.customerFeedbackDT::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/xlz1.webp');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.customerFeedbackDT > * {
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
