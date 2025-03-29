<template>
  <div class="workOrderManagementDT">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      工单管理
    </h2>

    <!--  查询条件  -->
    <div class="search-div">
      <el-form label-width="120px" size="small">
        <!--    第一行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="工单编号">
              <el-input
                v-model="workOrderQueryDto.workOrderNo"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="工单来源">
              <el-select
                v-model="workOrderQueryDto.workOrderSource"
                multiple
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderSourceItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="受理时间">
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
            <el-form-item label="工单类型">
              <el-select
                v-model="workOrderQueryDto.workOrderType"
                multiple
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="工单状态">
              <el-select
                v-model="workOrderQueryDto.workOrderStatus"
                multiple
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderStatusItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="所属事件类型">
              <el-select
                v-model="workOrderQueryDto.eventType"
                multiple
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderEventTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="接单人">
              <el-input
                v-model="workOrderQueryDto.acceptOrderBy"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工单创建时间">
              <el-date-picker
                v-model="createTime"
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
        <!--    按钮行查询条件    -->
        <el-row style="display:flex">
          <el-button type="primary" size="small" @click="searchWorkOrder">
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  新增工单  -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addShow">添 加</el-button>
      <el-button
        type="success"
        size="small"
        @click="downloadExcel"
        style="margin-left: 100px"
      >
        导出
      </el-button>
    </div>

    <!--  点击添加或修改打开该模态窗口  -->
    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="80%">
      <el-form label-width="140px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="工单编号*">
              <el-input
                v-model="workOrder.workOrderNo"
                clearable
                :disabled="isDisabled"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="工单类型*">
              <el-select
                v-model="workOrder.workOrderType"
                placeholder="请选择"
                :disabled="isDisabled"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属事件类型*">
              <el-select
                v-model="workOrder.eventType"
                placeholder="请选择"
                :disabled="isDisabled"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderEventTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属事件id">
              <el-input
                v-model="workOrder.eventId"
                clearable
                placeholder="点击文本框选择"
                @click="selectEvent"
                :disabled="isDisabled"
                readonly
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工单来源*">
              <el-select
                v-model="workOrder.workOrderSource"
                placeholder="请选择"
                :disabled="isDisabled"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderSourceItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="工单状态*">
              <el-select
                v-model="workOrder.workOrderStatus"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderStatusItem"
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
            <el-form-item label="接单地址">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="2"
                placeholder="请输入内容"
                v-model="workOrder.acceptAddress"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="工单内容">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                v-model="workOrder.workOrderContent"
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

    <!--  控制展示线路停运事件的模态窗口  -->
    <el-dialog v-model="lineDialogVisible" title="线路停运事件" width="70%">
      <!--  查询条件  -->
      <div class="search-div">
        <el-form label-width="120px" size="small">
          <!--    第一行查询条件    -->
          <el-row>
            <el-col :span="6">
              <el-form-item label="线路名称">
                <el-input
                  v-model="lineEventQueryDto.lineName"
                  style="width: 100%"
                  clearable
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="停电时间">
                <el-date-picker
                  v-model="linePowerOutageTime"
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
              <el-form-item label="停电事件类型">
                <el-select
                  v-model="lineEventQueryDto.powerOutageType"
                  placeholder="请选择"
                  style="width: 100%"
                  clearable
                >
                  <el-option
                    v-for="item in lineEventTypeItem"
                    :key="item.value"
                    :label="item.text"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="6">
              <el-form-item label="停电状态">
                <el-select
                  v-model="lineEventQueryDto.status"
                  placeholder="请选择"
                  style="width: 100%"
                  clearable
                >
                  <el-option
                    v-for="item in lineEventStatusItem"
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
            <el-button type="primary" size="small" @click="searchLineEvent">
              搜索
            </el-button>
            <el-button size="small" @click="lineEventResetData">重置</el-button>
          </el-row>
        </el-form>
      </div>

      <!-- 线路停电事件展示表格   -->
      <el-table
        :data="lineEventList"
        @cell-click="lineEventHandleCellClick"
        style="width: 100%; margin-bottom: 20px;"
      >
        <el-table-column prop="lineName" label="线路名称" width="140" />
        <el-table-column prop="powerOutageTime" label="停运时间" width="180" />
        <el-table-column
          prop="powerOutageDuration"
          label="停运时长（小时）"
          width="140"
          #default="scope"
        >
          {{
            scope.row.powerOutageDuration == 0
              ? ''
              : scope.row.powerOutageDuration
          }}
        </el-table-column>
        <el-table-column prop="powerSupplyTime" label="复电时间" width="180" />
        <el-table-column
          prop="powerOutageTypeName"
          label="停电类型"
          width="120"
        />
        <el-table-column prop="statusName" label="停电状态" width="100" />
        <el-table-column prop="reason" label="停电原因" width="220" />
        <el-table-column
          prop="effectTransformerNumber"
          label="影响配变数"
          width="100"
        />
        <el-table-column
          prop="effectConsNumber"
          label="影响用户数"
          width="100"
        />
        <el-table-column prop="createTime" label="记录创建时间" width="180" />
        <el-table-column prop="createBy" label="记录创建者" width="100" />
        <el-table-column prop="updateTime" label="记录修改时间" width="180" />
        <el-table-column prop="updateBy" label="记录修改者" width="100" />
      </el-table>

      <!--分页条-->
      <el-pagination
        style="margin-top: 30px"
        v-model:current-page="lineEventPageParams.page"
        v-model:page-size="lineEventPageParams.limit"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="lineEventFetchData"
        @current-change="lineEventFetchData"
        layout="total, sizes, prev, pager, next"
        :total="lineEventTotal"
      />
    </el-dialog>

    <!--  控制展示配变停运事件的模态窗口  -->
    <el-dialog
      v-model="transformerDialogVisible"
      title="配变停运事件"
      width="70%"
    >
      <!--  查询条件  -->
      <div class="search-div">
        <el-form label-width="120px" size="small">
          <!--    第一行查询条件    -->
          <el-row>
            <el-col :span="6">
              <el-form-item label="变压器局号">
                <el-input
                  v-model="transformerEventQueryDto.transformerCode"
                  style="width: 100%"
                  clearable
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="6">
              <el-form-item label="变压器名称">
                <el-input
                  v-model="transformerEventQueryDto.transformerName"
                  style="width: 100%"
                  clearable
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="停电时间">
                <el-date-picker
                  v-model="transformerTerminalOutageTime"
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
              <el-form-item label="停电事件类型">
                <el-select
                  v-model="transformerEventQueryDto.powerOutageType"
                  multiple
                  placeholder="请选择"
                  style="width: 100%"
                  clearable
                >
                  <el-option
                    v-for="item in transformerEventTypeItem"
                    :key="item.value"
                    :label="item.text"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="6">
              <el-form-item label="停电状态">
                <el-select
                  v-model="transformerEventQueryDto.status"
                  placeholder="请选择"
                  style="width: 100%"
                  clearable
                >
                  <el-option
                    v-for="item in transformerEventStatus"
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
              @click="searchTransformerEvent"
            >
              搜索
            </el-button>
            <el-button size="small" @click="transformerResetData">
              重置
            </el-button>
          </el-row>
        </el-form>
      </div>

      <!-- 台区（配变）停电事件展示表格   -->
      <el-table
        :data="transformerEventList"
        @cell-click="transformerEventHandleCellClick"
        style="width: 100%; margin-bottom: 20px;"
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
        <el-table-column
          prop="terminalOutageTime"
          label="终端停电时间"
          width="180"
        />
        <el-table-column
          prop="outageDuration"
          label="停电时长（小时）"
          width="140"
          #default="scope"
        >
          {{ scope.row.outageDuration == 0 ? '' : scope.row.outageDuration }}
        </el-table-column>
        <el-table-column
          prop="terminalSupplyTime"
          label="终端送电时间"
          width="180"
        />
        <el-table-column
          prop="powerOutageTypeName"
          label="停电类型"
          width="120"
        />
        <el-table-column prop="statusName" label="停电状态" width="100" />
        <el-table-column prop="reason" label="停电原因" width="220" />
        <el-table-column
          prop="effectConsNumber"
          label="影响用户数"
          width="100"
        />
        <el-table-column prop="createTime" label="记录创建时间" width="180" />
        <el-table-column prop="createBy" label="记录创建者" width="100" />
        <el-table-column prop="updateTime" label="记录修改时间" width="180" />
        <el-table-column prop="updateBy" label="记录修改者" width="100" />
      </el-table>

      <!--分页条-->
      <el-pagination
        style="margin-top: 30px"
        v-model:current-page="transformerEventPageParams.page"
        v-model:page-size="transformerEventPageParams.limit"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="transformerEventFetchData"
        @current-change="transformerEventFetchData"
        layout="total, sizes, prev, pager, next"
        :total="transformerEventTotal"
      />
    </el-dialog>

    <!--  控制展示用户停电事件的模态窗口  -->
    <el-dialog v-model="consDialogVisible" title="用户停电事件" width="70%">
      <!--  查询条件  -->
      <div class="search-div">
        <el-form label-width="120px" size="small">
          <!--    第一行查询条件    -->
          <el-row>
            <el-col :span="6">
              <el-form-item label="用户编号">
                <el-input
                  v-model="consEventQueryDto.consNo"
                  style="width: 100%"
                  clearable
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="6">
              <el-form-item label="用户名称">
                <el-input
                  v-model="consEventQueryDto.consName"
                  style="width: 100%"
                  clearable
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="停电时间">
                <el-date-picker
                  v-model="powerOutageTime"
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
              <el-form-item label="停电事件类型">
                <el-select
                  v-model="consEventQueryDto.powerOutageType"
                  multiple
                  placeholder="请选择"
                  style="width: 100%"
                  clearable
                >
                  <el-option
                    v-for="item in consEventTypeItem"
                    :key="item.value"
                    :label="item.text"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="6">
              <el-form-item label="停电状态">
                <el-select
                  v-model="consEventQueryDto.status"
                  placeholder="请选择"
                  style="width: 100%"
                  clearable
                >
                  <el-option
                    v-for="item in consEventStatusItem"
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
            <el-button type="primary" size="small" @click="searchConsEvent">
              搜索
            </el-button>
            <el-button size="small" @click="consEventResetData">重置</el-button>
          </el-row>
        </el-form>
      </div>

      <!-- 用户停电事件展示表格   -->
      <el-table
        :data="consEventList"
        @cell-click="consEventHandleCellClick"
        style="width: 100%; margin-bottom: 20px;"
      >
        <el-table-column prop="consNo" label="停电用户编号" width="120" />
        <el-table-column prop="consName" label="停电用户名称" width="140" />
        <el-table-column prop="powerOutageTime" label="停电时间" width="180" />
        <el-table-column
          prop="powerOutageDuration"
          label="停电时长（小时）"
          width="140"
          #default="scope"
        >
          {{
            scope.row.powerOutageDuration == 0
              ? ''
              : scope.row.powerOutageDuration
          }}
        </el-table-column>
        <el-table-column prop="powerSupplyTime" label="送电时间" width="180" />
        <el-table-column
          prop="powerOutageTypeName"
          label="停电类型"
          width="120"
        />
        <el-table-column prop="statusName" label="停电状态" width="100" />
        <el-table-column prop="reason" label="停电原因" width="220" />
        <el-table-column prop="createTime" label="记录创建时间" width="180" />
        <el-table-column prop="createBy" label="记录创建者" width="100" />
        <el-table-column prop="updateTime" label="记录修改时间" width="180" />
        <el-table-column prop="updateBy" label="记录修改者" width="100" />
      </el-table>

      <!--分页条-->
      <el-pagination
        style="margin-top: 30px"
        v-model:current-page="consEventPageParams.page"
        v-model:page-size="consEventPageParams.limit"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="consEventFetchData"
        @current-change="consEventFetchData"
        layout="total, sizes, prev, pager, next"
        :total="consEventTotal"
      />
    </el-dialog>

    <!--  展示工单详细信息的模态窗口  -->
    <el-dialog
      v-model="eventDetailDialogVisible"
      title="工单详细信息"
      width="90%"
    >
      <h2>工单基本信息</h2>
      <el-form label-width="140px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="工单编号*">
              <el-input
                v-model="workOrder.workOrderNo"
                clearable
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="工单类型*">
              <el-select
                v-model="workOrder.workOrderType"
                placeholder="请选择"
                disabled="true"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属事件类型*">
              <el-select
                v-model="workOrder.eventType"
                placeholder="请选择"
                disabled="true"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderEventTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属事件id">
              <el-input
                v-model="workOrder.eventId"
                clearable
                placeholder="点击文本框选择"
                @click="selectEvent"
                disabled="true"
                readonly
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工单来源*">
              <el-select
                v-model="workOrder.workOrderSource"
                placeholder="请选择"
                disabled="true"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderSourceItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="工单状态*">
              <el-select
                v-model="workOrder.workOrderStatus"
                placeholder="请选择"
                disabled="true"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in workOrderStatusItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="催受理次数">
              <el-input
                v-model="workOrder.urgeToProcessCount"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="上次催受理时间">
              <el-input
                v-model="workOrder.lastUrgeToProcessTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="催接单次数">
              <el-input
                v-model="workOrder.urgeToAcceptCount"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="上次催接单时间">
              <el-input
                v-model="workOrder.lastUrgeToAcceptTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="催办次数">
              <el-input
                v-model="workOrder.urgeToHandleCount"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="上次催办时间">
              <el-input
                v-model="workOrder.lastUrgeToHandleTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="受理时间">
              <el-input
                v-model="workOrder.handleTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="受理人">
              <el-input
                v-model="workOrder.handleBy"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="接单时间">
              <el-input
                v-model="workOrder.acceptOrderTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="接单人">
              <el-input
                v-model="workOrder.acceptOrderBy"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="完成时间">
              <el-input
                v-model="workOrder.finishTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="完成人">
              <el-input
                v-model="workOrder.finishBy"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="接单地址">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="2"
                disabled="true"
                v-model="workOrder.acceptAddress"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="工单内容">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="workOrder.workOrderContent"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <h2>工单对应事件详细信息</h2>
      <!--   线路事件详细信息   -->
      <el-form label-width="140px" v-if="workOrder.eventType == 1">
        <el-row>
          <el-col :span="12">
            <el-form-item label="停运线路名称">
              <el-input
                v-model="lineEvent.lineName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="停运时间">
              <el-input
                v-model="lineEvent.powerOutageTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="送电时间">
              <el-input
                v-model="lineEvent.powerSupplyTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="停运时长（小时）">
              <el-input
                v-model="lineEvent.powerOutageDuration"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="停运类型">
              <el-input
                v-model="lineEvent.powerOutageTypeName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="停电状态">
              <el-input
                v-model="lineEvent.statusName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="影响配变数">
              <el-input
                v-model="lineEvent.effectTransformerNumber"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="影响用户数">
              <el-input
                v-model="lineEvent.effectConsNumber"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="停运原因">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="lineEvent.reason"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <!--   配变事件详细信息   -->
      <el-form label-width="140px" v-if="workOrder.eventType == 2">
        <el-row>
          <el-col :span="12">
            <el-form-item label="停运变压器局号">
              <el-input
                v-model="transformerEvent.transformerCode"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="停运配变名称">
              <el-input
                v-model="transformerEvent.transformerName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="终端停电时间">
              <el-input
                v-model="transformerEvent.terminalOutageTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="终端送电时间">
              <el-input
                v-model="transformerEvent.terminalSupplyTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="停电时长（小时）">
              <el-input
                v-model="transformerEvent.outageDuration"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="停电类型">
              <el-input
                v-model="transformerEvent.powerOutageTypeName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="停电状态">
              <el-input
                v-model="transformerEvent.statusName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="影响用户数">
              <el-input
                v-model="transformerEvent.effectConsNumber"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="停运原因">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="transformerEvent.reason"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <!--   用户停运事件详细信息   -->
      <el-form label-width="140px" v-if="workOrder.eventType == 3">
        <el-row>
          <el-col :span="12">
            <el-form-item label="停电用户编号">
              <el-input
                v-model="consEvent.consNo"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="停电用户名称">
              <el-input
                v-model="consEvent.consName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="停电时间">
              <el-input
                v-model="consEvent.powerOutageTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="送电时间">
              <el-input
                v-model="consEvent.powerSupplyTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="停电时长（小时）">
              <el-input
                v-model="consEvent.powerOutageDuration"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="停电类型">
              <el-input
                v-model="consEvent.powerOutageTypeName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="停电状态">
              <el-input
                v-model="consEvent.statusName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="停运原因">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="consEvent.reason"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <h2>停运设备或用户基本信息</h2>
      <!--  线路设备基本信息    -->
      <el-form label-width="140px" v-if="workOrder.eventType == 1">
        <el-row>
          <el-col :span="12">
            <el-form-item label="线路名称">
              <el-input
                v-model="lineInfo.lineName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属单位id">
              <el-input
                v-model="lineInfo.unitId"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属单位名称">
              <el-input
                v-model="lineInfo.unitName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="线路长度（km）">
              <el-input
                v-model="lineInfo.lineLength"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="线路半径（cm）">
              <el-input
                v-model="lineInfo.radius"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="电压等级（kV）">
              <el-input
                v-model="lineInfo.voltageLevel"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="额定电流（A）">
              <el-input
                v-model="lineInfo.ratedCurrent"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="线路类型">
              <el-input
                v-model="lineInfo.lineTypeName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属母线">
              <el-input
                v-model="lineInfo.mainLineName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="线路接入时间">
              <el-input
                v-model="lineInfo.accessTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="线路状态">
              <el-input
                v-model="lineInfo.lineStatusName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="线路地址">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="lineInfo.address"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item>
              <el-button
                @click="eventDetailDialogVisible = false"
                type="warning"
                style="margin-left: 500px"
              >
                关闭
              </el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <!--  变压器基本信息展示    -->
      <el-form label-width="140px" v-if="workOrder.eventType == 2">
        <el-row>
          <el-col :span="12">
            <el-form-item label="变压器局号">
              <el-input
                v-model="transformerInfo.transformerCode"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="变压器名称">
              <el-input
                v-model="transformerInfo.transformerName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="变压器型号">
              <el-input
                v-model="transformerInfo.model"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="额定容量kVA">
              <el-input
                v-model="transformerInfo.ratedCapacity"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属线路">
              <el-input
                v-model="transformerInfo.lineName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="变压器类型">
              <el-input
                v-model="transformerInfo.transformerTypeName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="一次侧电压（kV）">
              <el-input
                v-model="transformerInfo.primaryVoltage"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="二次侧电压（kV）">
              <el-input
                v-model="transformerInfo.secondaryVoltage"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="制造厂家">
              <el-input
                v-model="transformerInfo.manufacturer"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="安装日期">
              <el-input
                v-model="transformerInfo.installDate"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="维护记录">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="2"
                disabled="true"
                v-model="transformerInfo.maintenanceRecords"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="地址">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="transformerInfo.address"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="transformerInfo.remark"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item>
              <el-button
                @click="eventDetailDialogVisible = false"
                type="warning"
                style="margin-left: 500px"
              >
                关闭
              </el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <!--  用户信息    -->
      <el-form label-width="140px" v-if="workOrder.eventType == 3">
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户编号">
              <el-input
                v-model="consInfo.consNo"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="用户名称">
              <el-input
                v-model="consInfo.consName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户类型">
              <el-input
                v-model="consInfo.consTypeName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="联系电话">
              <el-input
                v-model="consInfo.tel"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属配变局号">
              <el-input
                v-model="consInfo.transformerCode"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属配变名称">
              <el-input
                v-model="consInfo.transformerName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="接电日期">
              <el-input
                v-model="consInfo.connectionDate"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="账户余额（元）">
              <el-input
                v-model="consInfo.balance"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户状态">
              <el-input
                v-model="consInfo.consStatusName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="总用电量（kWh）度">
              <el-input
                v-model="consInfo.totalConsumption"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="应急配变局号">
              <el-input
                v-model="consInfo.emergencyTransformerCode"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="应急配变名称">
              <el-input
                v-model="consInfo.emergencyTransformerName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="地址">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="consInfo.address"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="consInfo.remark"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item>
              <el-button
                @click="eventDetailDialogVisible = false"
                type="warning"
                style="margin-left: 500px"
              >
                关闭
              </el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-dialog>

    <!--  点击审核按钮打开该模态窗口  -->
    <el-dialog
      v-model="reviewDialogVisible"
      title="个人提交工单材料详情"
      width="80%"
    >
      <el-form label-width="140px">
        <h2>接单人督办信息</h2>
        <el-row>
          <el-col :span="12">
            <el-form-item label="接单人名称">
              <el-input
                v-model="personAccept.name"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="接单时间">
              <el-input
                v-model="personAccept.acceptTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="处理状态">
              <el-input
                v-model="personAccept.handleStatusName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="处理开始时间">
              <el-input
                v-model="personAccept.processBeginTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="督办开始时间">
              <el-input
                v-model="personAccept.superviseBeginTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="督办结束时间">
              <el-input
                v-model="personAccept.superviseEndTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="事件类型">
              <el-input
                v-model="personAccept.eventTypeName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="工单来源">
              <el-input
                v-model="personAccept.workOrderSourceName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工单类型">
              <el-input
                v-model="personAccept.workOrderTypeName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="催办次数">
              <el-input
                v-model="personAccept.urgeToHandleCount"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工单编号">
              <el-input
                v-model="personAccept.workOrderNo"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="上次催办时间">
              <el-input
                v-model="personAccept.lastUrgeToHandleTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="督办内容">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="personAccept.workOrderContent"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <h2>个人提交工单材料信息</h2>
        <el-row>
          <el-col :span="12">
            <el-form-item label="材料编号">
              <el-input
                v-model="workSource.sourceNo"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="提交人">
              <el-input
                v-model="workSource.submitBy"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="处理对象">
              <el-input
                v-model="workSource.handleObject"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="提交时间">
              <el-input
                v-model="workSource.submitTime"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="材料通过标识">
              <el-input
                v-model="workSource.acceptFlagName"
                clearable
                style="width: 100%"
                disabled="true"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="处理原因">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="workSource.handleReason"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="现场故障真实原因">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                disabled="true"
                v-model="workSource.reallyReason"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="现场故障图片">
              <el-upload
                class="avatar-uploader"
                action="http://localhost:8501/electricity/system/fileUpload"
                :show-file-list="false"
                :on-success="handleAvatarSuccess"
                :headers="headers"
                disabled="true"
              >
                <img
                  v-if="workSource.faultRecordImage"
                  :src="workSource.faultRecordImage"
                  class="avatar"
                />
                <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
              </el-upload>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="处理结果">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                disabled="true"
                v-model="workSource.handleResult"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="处理附件图">
              <el-upload
                class="avatar-uploader"
                action="http://localhost:8501/electricity/system/fileUpload"
                :show-file-list="false"
                disabled="true"
                :on-success="handleAvatarSuccess2"
                :headers="headers"
              >
                <img
                  v-if="workSource.handleImage"
                  :src="workSource.handleImage"
                  class="avatar"
                />
                <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
              </el-upload>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="12" v-if="personAccept.handleStatus != 6">
            <el-form-item>
              <el-button type="success" @click="reviewSuccess">通过</el-button>
            </el-form-item>
          </el-col>
          <el-col :span="12" v-if="personAccept.handleStatus != 6">
            <el-form-item>
              <el-button type="danger" @click="reviewRefuse">驳回</el-button>
            </el-form-item>
          </el-col>
          <el-col :span="24" v-if="personAccept.handleStatus == 6">
            <el-form-item>
              <el-button
                @click="reviewDialogVisible = false"
                type="warning"
                style="margin-left: 400px"
              >
                关闭
              </el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-dialog>

    <!--  点击驳回按钮后打开该模态窗口  -->
    <el-dialog v-model="RefuseDialogVisible" title="驳回信息" width="30%">
      <el-form label-width="80px">
        <el-form-item label="驳回原因">
          <el-input
            type="textarea"
            :rows="3"
            placeholder="请输入内容"
            v-model="workSource.refuseReason"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitRefuseReason">提交</el-button>
          <el-button @click="RefuseDialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!-- 工单展示表格   -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column label="操作" align="center" width="300" #default="scope">
        <el-button
          type="primary"
          size="small"
          @click="editWorkOrder(scope.row)"
        >
          修改
        </el-button>
        <el-button
          type="danger"
          size="small"
          @click="deleteWorkOrder(scope.row)"
        >
          删除
        </el-button>
        <el-button
          v-if="scope.row.workOrderStatus == 1"
          type="warning"
          size="small"
          @click="pushWorkOrder(scope.row)"
        >
          推送
        </el-button>
        <el-button
          v-if="scope.row.workOrderStatus == 2"
          type="warning"
          size="small"
          @click="urgeHandle(scope.row)"
        >
          催受理
        </el-button>
        <el-button
          v-if="scope.row.workOrderStatus == 3"
          type="warning"
          size="small"
          @click="urgeAcceptOrder(scope.row)"
        >
          催接单
        </el-button>
        <el-button
          v-if="scope.row.workOrderStatus == 4"
          type="warning"
          size="small"
          @click="urgeHandleOrder(scope.row)"
        >
          催办
        </el-button>
        <el-button
          v-if="scope.row.workOrderStatus == 5"
          type="warning"
          size="small"
          @click="ReviewWorkOrder(scope.row)"
        >
          审核
        </el-button>
      </el-table-column>
      <el-table-column
        prop="workOrderNo"
        label="工单编号"
        width="120"
        #default="scope"
      >
        <a
          @click="eventDetail(scope.row)"
          style="color: green; text-decoration: underline"
        >
          {{ scope.row.workOrderNo }}
        </a>
      </el-table-column>
      <el-table-column prop="workOrderTypeName" label="工单类型" width="100" />
      <el-table-column
        prop="sourceNo"
        label="工单审核材料号"
        width="140"
        #default="scope"
      >
        <a
          @click="workSourceDetail(scope.row.sourceNo)"
          style="color: green; text-decoration: underline"
        >
          {{ scope.row.sourceNo }}
        </a>
      </el-table-column>
      <el-table-column prop="workOrderContent" label="工单内容" width="250" />
      <el-table-column
        prop="workOrderSourceName"
        label="工单来源"
        width="100"
      />
      <el-table-column
        prop="workOrderStatusName"
        label="工单状态"
        width="100"
      />
      <el-table-column prop="eventTypeName" label="所属事件类型" width="120" />
      <el-table-column prop="acceptAddress" label="接单地址" width="200" />
      <el-table-column
        prop="urgeToProcessCount"
        label="催受理次数"
        width="120"
      />
      <el-table-column
        prop="lastUrgeToProcessTime"
        label="上次催受理时间"
        width="180"
      />
      <el-table-column
        prop="urgeToAcceptCount"
        label="催接单次数"
        width="120"
      />
      <el-table-column
        prop="lastUrgeToAcceptTime"
        label="上次催接单时间"
        width="180"
      />
      <el-table-column prop="urgeToHandleCount" label="催办次数" width="120" />
      <el-table-column
        prop="lastUrgeToHandleTime"
        label="上次催办时间"
        width="180"
      />
      <el-table-column prop="handleTime" label="受理时间" width="180" />
      <el-table-column prop="handleBy" label="受理人" width="100" />
      <el-table-column prop="acceptOrderTime" label="接单时间" width="180" />
      <el-table-column prop="acceptOrderBy" label="接单人" width="100" />
      <el-table-column prop="finishTime" label="完成时间" width="180" />
      <el-table-column prop="finishBy" label="完成人" width="100" />
      <el-table-column prop="createTime" label="工单创建时间" width="180" />
      <el-table-column prop="createBy" label="工单创建者" width="100" />
      <el-table-column prop="updateTime" label="工单修改时间" width="180" />
      <el-table-column prop="updateBy" label="工单修改者" width="100" />
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
import {
  GetConsEventByConditionAndPage,
  GetConsEventById,
} from '@/api/consEvent'
import { ElMessage, ElMessageBox } from 'element-plus'
import {
  DeleteWorkOrderById,
  GetPersonAcceptAndWorkSourceByWorkSourceNo,
  GetPersonAcceptByWorkOrderNo,
  GetWorkOrderByConditionAndPage,
  GetWorkSourceByAcceptId,
  PushWorkOrder,
  RefuseWorkOrder,
  ReviewSuccess,
  SaveWorkOrder,
  UrgeToAccept,
  UrgeToHandle,
  UrgeToProcess,
} from '@/api/WorkOrder'
import {
  GetLineEventByConditionAndPage,
  GetLineEventById,
} from '@/api/lineEvent'
import {
  GetTransformerEventByConditionAndPage,
  GetTransformerEventById,
} from '@/api/transformerEvent'
import { GetLineInfoByLineId } from '@/api/lineInfo'
import { GetTransformerInfoByTransformerCode } from '@/api/transformerInfo'
import { GetConsInfoByConsNo } from '@/api/consInfo'
import axios from 'axios'
import { useApp } from '@/pinia/modules/app'

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
const workOrderQueryDto = ref({
  workOrderNo: '',
  workOrderType: [],
  workOrderSource: [],
  workOrderStatus: [],
  eventType: [],
  handleBeginTime: '',
  handleEndTime: '',
  acceptOrderBy: '',
  createBeginTime: '',
  createEndTime: '',
})
const handleTime = ref([])
const createTime = ref([])
const workOrderTypeItem = ref([]) //封装工单类型item
const workOrderStatusItem = ref([]) //封装工单状态item
const workOrderSourceItem = ref([]) //封装工单来源item
const workOrderEventTypeItem = ref([]) //封装所属事件类型item

//获取用户停电事件类型下拉列表键值对
const getworkOrderTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_work_order_type')
  workOrderTypeItem.value = data
}
//获取用户停电事件状态下拉列表键值对
const getworkOrderStatusItem = async () => {
  const { data } = await GetKeyAndValueByType('t_work_order_status')
  workOrderStatusItem.value = data
}
//获取工单来源下拉列表键值对
const getWorkOrderSourceItem = async () => {
  const { data } = await GetKeyAndValueByType('t_work_order_source')
  workOrderSourceItem.value = data
}
//获取所属事件类型下拉列表键值对
const getWorkOrderEventTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_work_order_event_type')
  workOrderEventTypeItem.value = data
}

//查询用户停电事件列表
const fetchData = async () => {
  const { data } = await GetWorkOrderByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    workOrderQueryDto.value
  )
  list.value = data.list
  total.value = data.total
}

//搜索按钮
const searchWorkOrder = () => {
  workOrderQueryDto.value.handleBeginTime = handleTime.value[0]
  workOrderQueryDto.value.handleEndTime = handleTime.value[1]
  workOrderQueryDto.value.createBeginTime = createTime.value[0]
  workOrderQueryDto.value.createEndTime = createTime.value[1]
  fetchData()
}

//重置按钮
const resetData = () => {
  handleTime.value = []
  createTime.value = []
  workOrderQueryDto.value = {}
  fetchData()
}

//钩子函数
onMounted(() => {
  getworkOrderTypeItem()
  getworkOrderStatusItem()
  getWorkOrderSourceItem()
  getWorkOrderEventTypeItem()
  fetchData()
})

//-------------------------------------------添加或修改用户停电事件---------------------------------------------
const workOrder = ref({
  workOrderNo: '', //工单编号
  workOrderType: '', //工单类型
  eventId: '', //督办事件id
  workOrderContent: '', //工单内容
  workOrderSource: '', //工单来源
  workOrderStatus: '', //工单状态
  acceptAddress: '', //接单地址
  eventType: '', //事件类型(1->线路停运事件 2->配变停运事件 3->用户停电事件)
})
const dialogVisible = ref(false) //控制添加或修改用户停电事件模态窗口的关闭
const dialogTitle = ref('') //控制标题
const isDisabled = ref(true) //控制文本框是否可操作

//点击添加按钮
const addShow = () => {
  workOrder.value = {}
  isDisabled.value = false
  dialogTitle.value = '新增工单'
  dialogVisible.value = true
}

//点击修改按钮
const editWorkOrder = row => {
  workOrder.value = { ...row }
  isDisabled.value = true
  dialogTitle.value = '修改工单'
  dialogVisible.value = true
}

//点击提交按钮后触发
const saveOrUpdate = async () => {
  if (workOrder.value.workOrderNo == undefined) {
    ElMessage.warning('【工单编号】不能为空')
    return
  }
  if (workOrder.value.workOrderType == undefined) {
    ElMessage.warning('【工单类型】不能为空')
    return
  }
  if (workOrder.value.eventType == undefined) {
    ElMessage.warning('【事件类型】不能为空')
    return
  }
  if (workOrder.value.eventId == undefined) {
    ElMessage.warning('【所属事件】不能为空')
    return
  }
  if (workOrder.value.workOrderSource == undefined) {
    ElMessage.warning('【工单来源】不能为空')
    return
  }
  if (workOrder.value.workOrderStatus == undefined) {
    ElMessage.warning('【工单状态】不能为空')
    return
  }

  const { code, message } = await SaveWorkOrder(workOrder.value)
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

//-----------------------点击添加或修改窗口中所属事件id文本框后触发-------------------------------
const lineDialogVisible = ref(false) //控制打开线路停运事件模态窗口
const transformerDialogVisible = ref(false) //控制打开配变停运事件窗口
const consDialogVisible = ref(false) //控制打开用户停电事件模态窗口

//点击所属事件id按钮后触发
const selectEvent = () => {
  if (workOrder.value.eventType == undefined) {
    ElMessage.warning('需要先选中事件类型才能选择具体事件！')
    return
  }
  if (workOrder.value.eventType == '1') {
    //线路停运事件，打开对应模态窗口
    //打开窗口前的处理
    getlineEventTypeItem()
    getlineEventStatusItem()
    lineEventFetchData()
    lineDialogVisible.value = true
  } else if (workOrder.value.eventType == '2') {
    //配变停运事件，打开对应模态窗口
    //打开窗口前处理
    getTransformerEventTypeItem()
    getTransformerEventStatus()
    transformerEventFetchData()
    transformerDialogVisible.value = true
  } else if (workOrder.value.eventType == '3') {
    //用户停运事件，打开对应模态窗口
    //打开窗口前处理
    getConsEventTypeItem()
    getConsEventStatusItem()
    consEventFetchData()
    consDialogVisible.value = true
  }
}

//--------------------线路停运事件渲染----------------------
// 定义表格数据模型
const lineEventList = ref([])
//分页条数据模型
const lineEventTotal = ref(0)
//分页
const lineEventPageParamsForm = {
  page: 1,
  limit: 10,
}
const lineEventPageParams = ref(lineEventPageParamsForm)
//封装线路停运事件查询参数
const lineEventQueryDto = ref({
  lineName: '',
  powerOutageBeginTime: '',
  powerOutageEndTime: '',
  powerOutageType: '',
  status: '',
})
//封装事件
const linePowerOutageTime = ref([])
const lineEventTypeItem = ref([]) //封装配变停电事件类型item
const lineEventStatusItem = ref([]) //封装配变停电事件状态item

//获取配变停电事件类型下拉列表键值对
const getlineEventTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_line_event_type')
  lineEventTypeItem.value = data
}
//获取配变停电事件状态下拉列表键值对
const getlineEventStatusItem = async () => {
  const { data } = await GetKeyAndValueByType('t_line_event_status')
  lineEventStatusItem.value = data
}

//搜索按钮
const searchLineEvent = () => {
  lineEventQueryDto.value.powerOutageBeginTime = linePowerOutageTime.value[0]
  lineEventQueryDto.value.powerOutageEndTime = linePowerOutageTime.value[1]
  lineEventFetchData()
}

//重置按钮
const lineEventResetData = () => {
  linePowerOutageTime.value = []
  lineEventQueryDto.value = {}
  lineEventFetchData()
}

//调用接口查询配变停电事件
const lineEventFetchData = async () => {
  const { data } = await GetLineEventByConditionAndPage(
    lineEventPageParams.value.page,
    lineEventPageParams.value.limit,
    lineEventQueryDto.value
  )
  lineEventList.value = data.list
  lineEventTotal.value = data.total
}

//线路事件列表点击事件
const lineEventHandleCellClick = row => {
  workOrder.value.eventId = row.mid
  lineDialogVisible.value = false
}

//--------------------配变停运事件渲染----------------------
// 定义表格数据模型
const transformerEventList = ref([])
//分页条数据模型
const transformerEventTotal = ref(0)
//分页
const transformerEventPageParams = ref({
  page: 1,
  limit: 10,
})
//封装台区（配变）停电事件查询参数
const transformerEventQueryDto = ref({
  transformerCode: '',
  transformerName: '',
  terminalOutageBeingTime: '',
  terminalOutageEndTime: '',
  powerOutageType: [],
  status: '',
})
//封装事件
const transformerTerminalOutageTime = ref([])
const transformerEventTypeItem = ref([]) //封装配变停电事件类型item
const transformerEventStatus = ref([]) //封装配变停电事件状态item

//获取配变停电事件类型下拉列表键值对
const getTransformerEventTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_transformer_event_type')
  transformerEventTypeItem.value = data
}
//获取配变停电事件状态下拉列表键值对
const getTransformerEventStatus = async () => {
  const { data } = await GetKeyAndValueByType('t_transformer_event_status')
  transformerEventStatus.value = data
}

//搜索按钮
const searchTransformerEvent = () => {
  transformerEventQueryDto.value.terminalOutageBeingTime =
    transformerTerminalOutageTime.value[0]
  transformerEventQueryDto.value.terminalOutageEndTime =
    transformerTerminalOutageTime.value[1]
  transformerEventFetchData()
}

//重置按钮
const transformerResetData = () => {
  transformerTerminalOutageTime.value = []
  transformerEventQueryDto.value = {}
  transformerEventFetchData()
}

//调用接口查询配变停电事件
const transformerEventFetchData = async () => {
  const { data } = await GetTransformerEventByConditionAndPage(
    transformerEventPageParams.value.page,
    transformerEventPageParams.value.limit,
    transformerEventQueryDto.value
  )
  transformerEventList.value = data.list
  transformerEventTotal.value = data.total
}

//配变事件列表点击事件
const transformerEventHandleCellClick = row => {
  workOrder.value.eventId = row.dataId
  transformerDialogVisible.value = false
}

//--------------------用户停运事件渲染----------------------
// 定义表格数据模型
const consEventList = ref([])
//分页条数据模型
const consEventTotal = ref(0)
//分页
const consEventPageParams = ref({
  page: 1,
  limit: 10,
})
const consEventQueryDto = ref({
  consNo: '',
  consName: '',
  powerOutageBeginTime: '',
  powerOutageEndTime: '',
  powerOutageType: [],
  status: '',
})
const powerOutageTime = ref([])
const consEventTypeItem = ref([]) //封装用户停电事件类型item
const consEventStatusItem = ref([]) //封装用户停电事件状态item

//获取用户停电事件类型下拉列表键值对
const getConsEventTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_cons_event_type')
  consEventTypeItem.value = data
}
//获取用户停电事件状态下拉列表键值对
const getConsEventStatusItem = async () => {
  const { data } = await GetKeyAndValueByType('t_cons_event_status')
  consEventStatusItem.value = data
}

//查询用户停电事件列表
const consEventFetchData = async () => {
  const { data } = await GetConsEventByConditionAndPage(
    consEventPageParams.value.page,
    consEventPageParams.value.limit,
    consEventQueryDto.value
  )
  consEventList.value = data.list
  consEventTotal.value = data.total
}

//搜索按钮
const searchConsEvent = () => {
  consEventQueryDto.value.powerOutageBeginTime = powerOutageTime.value[0]
  consEventQueryDto.value.powerOutageEndTime = powerOutageTime.value[1]
  consEventFetchData()
}

//重置按钮
const consEventResetData = () => {
  powerOutageTime.value = []
  consEventQueryDto.value = {}
  consEventFetchData()
}

//用户停运事件列表点击事件
const consEventHandleCellClick = row => {
  workOrder.value.eventId = row.eventId
  consDialogVisible.value = false
}

//----------------------------------------------------删除用户停电事件---------------------------------------------
const deleteWorkOrder = row => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await DeleteWorkOrderById(row.id)
    if (code === 200) {
      ElMessage.success(message)
      fetchData()
    } else {
      ElMessage.error(message)
    }
  })
}

//-----------------------------------------工单流程------------------------------------------
//点击推送
const pushWorkOrder = async row => {
  //workOrder.value = {...row};
  const { code, message } = await PushWorkOrder(row)
  if (code === 200) {
    ElMessage.success(message + ', 该工单已推送给对应人员！')
    fetchData()
  } else {
    ElMessage.error(message)
  }
}
//点击催受理
const urgeHandle = async row => {
  const { code, message } = await UrgeToProcess(row)
  if (code === 200) {
    ElMessage.success(message + ', 已通知相关人员进行受理！')
    fetchData()
  } else {
    ElMessage.warning(message)
  }
}
//点击催接单
const urgeAcceptOrder = async row => {
  const { code, message } = await UrgeToAccept(row)
  if (code === 200) {
    ElMessage.success(message + ', 已在接单中心进行该工单的催办！')
    fetchData()
  } else {
    ElMessage.warning(message)
  }
}
//点击催办
const urgeHandleOrder = async row => {
  const { code, message } = await UrgeToHandle(row)
  if (code === 200) {
    ElMessage.success(message + ', 已通知该工单的接单人进行督办！')
    fetchData()
  } else {
    ElMessage.warning(message)
  }
}

//点击导出
const downloadExcel = async () => {
  try {
    // 后端接口URL
    const url = 'http://localhost:8501/electricity/workOrder/download'

    // 发送请求到后端接口
    const response = await axios({
      method: 'post',
      url: url,
      responseType: 'blob', // 重要：设置响应类型为blob
      data: workOrderQueryDto.value,
      headers: {
        token: useApp().authorization.token, // 在请求头中设置token
      },
    })

    // 创建一个Blob对象
    const blob = new Blob([response.data], { type: 'application/vnd.ms-excel' })

    // 创建下载链接
    const link = document.createElement('a')
    link.href = window.URL.createObjectURL(blob)

    // 设置下载属性
    link.setAttribute('download', '工单列表数据.xls') // 从Content-Disposition头中获取或自定义文件名

    // 触发下载
    document.body.appendChild(link)
    link.click()

    // 清理
    document.body.removeChild(link)
    window.URL.revokeObjectURL(link.href)
  } catch (error) {
    console.error('下载失败', error)
  }
}

//----------------------------------------审核----------------------------------------------------------
//点击审核按钮
const personAccept = ref({}) //封装个人接单信息
const workSource = ref({}) //封装工单材料信息
const reviewDialogVisible = ref(false) //控制审核窗口的开闭
const ReviewWorkOrder = row => {
  //先要出来表单（根据工单编号查询个人接单信息和材料提交信息）
  //根据工单编号查询个人接单信息
  getPersonAcceptByWorkOrderNo(row.workOrderNo)

  //打开模态窗口
  reviewDialogVisible.value = true
}
//根据工单编号查询个人接单信息
const getPersonAcceptByWorkOrderNo = async workOrderNo => {
  const { data } = await GetPersonAcceptByWorkOrderNo(workOrderNo)
  personAccept.value = data
  //根据个人接单id查询工单材料信息（这个有写好的接口）
  getWorkSourceByAcceptId(personAccept.value.id)
}
//根据个人接单id查询个人提交工单材料信息
const getWorkSourceByAcceptId = async acceptId => {
  const { data } = await GetWorkSourceByAcceptId(acceptId)
  workSource.value = data
  //处理审核标识
  if (workSource.value.acceptFlag == 0) {
    workSource.value.acceptFlagName = '审核中'
  } else if (workSource.value.acceptFlag == 1) {
    workSource.value.acceptFlagName = '审核通过'
  } else if (workSource.value.acceptFlag == 2) {
    workSource.value.acceptFlagName = '被驳回'
  }
}
const RefuseDialogVisible = ref(false) //控制驳回原因模态窗口关闭
//点击审核模态窗口中的驳回按钮
const reviewRefuse = () => {
  //清空驳回原因模态窗口中的内容
  workSource.value.refuseReason = ''
  //打开驳回原因模态窗口
  RefuseDialogVisible.value = true
}
//点击驳回原因中的提交按钮后触发
const submitRefuseReason = async () => {
  if (
    workSource.value.refuseReason == undefined ||
    workSource.value.refuseReason == ''
  ) {
    ElMessage.warning('【驳回原因】不能为空！')
    return
  }
  const { code, message } = await RefuseWorkOrder(workSource.value)
  if (code === 200) {
    //关闭驳回原因模态窗口
    RefuseDialogVisible.value = false
    //关闭审核模态窗口
    reviewDialogVisible.value = false
    //提示信息
    ElMessage.success(message)
    //刷新页面
    fetchData()
  } else {
    //提示错误
    ElMessage.error(message)
  }
}
//点击审核模态窗口中的通过后触发
const reviewSuccess = () => {
  ElMessageBox.confirm(
    '该操作会让该工单完结，您是否详细阅读材料信息后选择通过?',
    'Warning',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  ).then(async () => {
    const { code, message } = await ReviewSuccess(personAccept.value)
    if (code === 200) {
      reviewDialogVisible.value = false
      ElMessage.success(message)
      fetchData()
    } else {
      ElMessage.error(message)
    }
  })
}

//------------------------------------------点击工单编号穿透展示详细信息----------------------------------
const eventDetailDialogVisible = ref(false) //控制查看工单详情模态窗口的开闭
const lineEvent = ref({}) //存放线路停运事件信息
const transformerEvent = ref({}) //存放配变停运事件信息
const consEvent = ref({}) //存放用户停运事件信息
const lineInfo = ref({}) //封装线路信息
const transformerInfo = ref({}) //封装变压器信息
const consInfo = ref({}) //封装用户信息
const eventDetail = async row => {
  workOrder.value = { ...row }
  if (row.eventType == 1) {
    //线路事件
    await selectLineEventById(row.eventId)
    if (lineEvent.value != null) {
      await selectLineInfoByLineId(lineEvent.value.lineId)
    }
  } else if (row.eventType == 2) {
    //配变事件
    await selectTransformerEventById(row.eventId)
    if (transformerEvent.value != null) {
      await selectTransformerInfoByTransformerCode(
        transformerEvent.value.transformerCode
      )
    }
  } else if (row.eventType == 3) {
    //用户事件
    await selectConsEventById(row.eventId)
    if (consEvent.value != null) {
      await selectConsInfoByConsNo(consEvent.value.consNo)
    }
  }
  eventDetailDialogVisible.value = true
}
//查询线路事件
const selectLineEventById = async id => {
  const { data } = await GetLineEventById(id)
  lineEvent.value = data
}
//查询配变事件
const selectTransformerEventById = async id => {
  const { data } = await GetTransformerEventById(id)
  transformerEvent.value = data
}
//查询用户停运事件
const selectConsEventById = async id => {
  const { data } = await GetConsEventById(id)
  consEvent.value = data
}
//查询线路信息
const selectLineInfoByLineId = async lineId => {
  const { data } = await GetLineInfoByLineId(lineId)
  lineInfo.value = data
}
//查询变压器信息
const selectTransformerInfoByTransformerCode = async transformerCode => {
  const { data } = await GetTransformerInfoByTransformerCode(transformerCode)
  transformerInfo.value = data
}
//查询用户信息
const selectConsInfoByConsNo = async consNo => {
  const { data } = await GetConsInfoByConsNo(consNo)
  consInfo.value = data
}

//-----------------------------------------查看工单材料详细信息--------------------------------
//点击材料编号穿透
const workSourceDetail = async workSourceNo => {
  const { data } = await GetPersonAcceptAndWorkSourceByWorkSourceNo(
    workSourceNo
  )
  personAccept.value = data.personAccept
  workSource.value = data.workSource

  //处理审核标识
  if (workSource.value.acceptFlag == 0) {
    workSource.value.acceptFlagName = '审核中'
  } else if (workSource.value.acceptFlag == 1) {
    workSource.value.acceptFlagName = '审核通过'
  } else if (workSource.value.acceptFlag == 2) {
    workSource.value.acceptFlagName = '被驳回'
  }

  //打开模态窗口
  reviewDialogVisible.value = true
}

//-------------------------------文件上传------------------------------------
const headers = {
  token: useApp().authorization.token, // 从pinia中获取token，在进行文件上传的时候将token设置到请求头中
}

// 图像上传成功以后的事件处理函数
const handleAvatarSuccess = (response, uploadFile) => {
  workSource.value.faultRecordImage = response.data
}
const handleAvatarSuccess2 = (response, uploadFile) => {
  workSource.value.handleImage = response.data
}
</script>

<style scoped>
.workOrderManagementDT {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.workOrderManagementDT::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/qwdt2.gif');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.workOrderManagementDT > * {
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
