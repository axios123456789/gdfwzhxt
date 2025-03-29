<template>
  <div class="workOrderHandleCenterDT">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      工单受理中心
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

    <!--  导出工单  -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="downloadExcel">
        导出
      </el-button>
    </div>

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

    <!-- 工单展示表格   -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column label="操作" align="center" width="150" #default="scope">
        <el-button
          v-if="scope.row.workOrderStatus == 2"
          type="warning"
          size="small"
          @click="handleWorkOrder(scope.row)"
        >
          受理
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
      <el-table-column prop="sourceNo" label="工单审核材料号" width="140" />
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
import { GetConsEventById } from '@/api/consEvent'
import { ElMessage, ElMessageBox } from 'element-plus'
import {
  GetWorkOrderByConditionAndPage,
  ProcessWorkOrder,
} from '@/api/WorkOrder'
import { GetLineEventById } from '@/api/lineEvent'
import { GetTransformerEventById } from '@/api/transformerEvent'
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
workOrderQueryDto.value.workOrderStatus[0] = 2 //默认查询工单状态为待受理
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

//-----------------------------------------工单流程------------------------------------------
//点击受理
const handleWorkOrder = row => {
  ElMessageBox.confirm(
    '此操作将对该工单进行派单，是否仔细查看工单详情后进行该操作?',
    'Warning',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  ).then(async () => {
    const { code, message } = await ProcessWorkOrder(row)
    if (code === 200) {
      ElMessage.success(message + ', 工单受理完成并成功派单！')
      fetchData()
    } else {
      ElMessage.warning(message)
    }
  })
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

//------------------------------------------点击工单编号穿透展示详细信息----------------------------------
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
</script>

<style scoped>
.workOrderHandleCenterDT {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.workOrderHandleCenterDT::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/bkm4.gif');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.workOrderHandleCenterDT > * {
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
