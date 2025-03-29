<template>
  <div class="personAcceptDT">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      个人工单管理
    </h2>

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

    <!--  点击完成处理或督办打开该模态床口  -->
    <el-dialog
      v-model="processDialogVisible"
      :title="ProcessOrHandle"
      width="60%"
    >
      <el-form label-width="140px">
        <el-form-item label="材料编号" v-if="isViewOtherSourceInfo == true">
          <el-input
            v-model="workSource.sourceNo"
            clearable
            style="width: 100%"
            disabled="true"
          />
        </el-form-item>
        <el-form-item label="提交人" v-if="isViewOtherSourceInfo == true">
          <el-input
            v-model="workSource.submitBy"
            clearable
            style="width: 100%"
            disabled="true"
          />
        </el-form-item>
        <el-form-item label="提交时间" v-if="isViewOtherSourceInfo == true">
          <el-input
            v-model="workSource.submitTime"
            clearable
            style="width: 100%"
            disabled="true"
          />
        </el-form-item>
        <el-form-item label="处理对象" v-if="isViewOtherSourceInfo == true">
          <el-input
            v-model="workSource.handleObject"
            clearable
            style="width: 100%"
            disabled="true"
          />
        </el-form-item>
        <el-form-item label="处理原因" v-if="isViewOtherSourceInfo == true">
          <el-input
            type="textarea"
            style="width: 100%"
            :rows="3"
            placeholder="请输入内容"
            v-model="workSource.handleReason"
            disabled="true"
          ></el-input>
        </el-form-item>
        <el-form-item label="现场故障真实原因">
          <el-input
            type="textarea"
            style="width: 100%"
            :rows="3"
            placeholder="请输入内容"
            v-model="workSource.reallyReason"
          ></el-input>
        </el-form-item>
        <el-form-item label="现场故障图片">
          <el-upload
            class="avatar-uploader"
            action="http://localhost:8501/electricity/system/fileUpload"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :headers="headers"
          >
            <img
              v-if="workSource.faultRecordImage"
              :src="workSource.faultRecordImage"
              class="avatar"
            />
            <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
          </el-upload>
        </el-form-item>
        <el-form-item label="处理结果">
          <el-input
            type="textarea"
            style="width: 100%"
            :rows="3"
            placeholder="请输入内容"
            v-model="workSource.handleResult"
          ></el-input>
        </el-form-item>
        <el-form-item label="处理附件图">
          <el-upload
            class="avatar-uploader"
            action="http://localhost:8501/electricity/system/fileUpload"
            :show-file-list="false"
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
        <el-form-item>
          <el-button
            type="warning"
            @click="saveWorkSource"
            v-if="isViewOtherSourceInfo == true"
          >
            保存
          </el-button>
          <el-button
            type="primary"
            @click="submitProcessResult"
            v-if="isViewOtherSourceInfo == false"
          >
            提交
          </el-button>
          <el-button
            type="primary"
            @click="submitWorkSource"
            v-if="isViewOtherSourceInfo == true"
            style="margin-left: 200px"
          >
            提交
          </el-button>
          <el-button
            @click="processDialogVisible = false"
            style="margin-left: 200px"
          >
            取消
          </el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!--  查看详情模态窗口  -->
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
          <el-col :span="24">
            <el-form-item>
              <el-button
                @click="reviewDialogVisible = false"
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

    <!--  驳回原因模态窗口  -->
    <el-dialog v-model="RefuseDialogVisible" title="驳回信息" width="30%">
      <el-form label-width="80px">
        <el-form-item label="驳回人">
          <el-input
            v-model="workSource.refuseBy"
            clearable
            style="width: 100%"
            disabled="true"
          />
        </el-form-item>
        <el-form-item label="驳回时间">
          <el-input
            v-model="workSource.refuseTime"
            clearable
            style="width: 100%"
            disabled="true"
          />
        </el-form-item>
        <el-form-item label="驳回原因">
          <el-input
            type="textarea"
            :rows="3"
            disabled="true"
            v-model="workSource.refuseReason"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="warning" @click="RefuseDialogVisible = false">
            关闭
          </el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!--  tab页切换处理  -->
    <div class="tab">
      <div v-if="personAcceptQueryDto.handleStatus != 1" @click="dclHandle">
        <span>待处理</span>
      </div>
      <div
        style="border-bottom: 2px solid green; color: green"
        v-if="personAcceptQueryDto.handleStatus == 1"
      >
        <span>待处理</span>
      </div>
      <div v-if="personAcceptQueryDto.handleStatus != 2" @click="clzHandle">
        <span>处理中</span>
      </div>
      <div
        style="border-bottom: 2px solid green; color: green"
        v-if="personAcceptQueryDto.handleStatus == 2"
      >
        <span>处理中</span>
      </div>
      <div v-if="personAcceptQueryDto.handleStatus != 3" @click="dbzHandle">
        <span>督办中</span>
      </div>
      <div
        style="border-bottom: 2px solid green; color: green"
        v-if="personAcceptQueryDto.handleStatus == 3"
      >
        <span>督办中</span>
      </div>
      <div v-if="personAcceptQueryDto.handleStatus != 4" @click="ytjHandle">
        <span>已提交</span>
      </div>
      <div
        style="border-bottom: 2px solid green; color: green"
        v-if="personAcceptQueryDto.handleStatus == 4"
      >
        <span>已提交</span>
      </div>
      <div v-if="personAcceptQueryDto.handleStatus != 5" @click="bbhHandle">
        <span>被驳回</span>
      </div>
      <div
        style="border-bottom: 2px solid green; color: green"
        v-if="personAcceptQueryDto.handleStatus == 5"
      >
        <span>被驳回</span>
      </div>
      <div v-if="personAcceptQueryDto.handleStatus != 6" @click="ywcHandle">
        <span>已完成</span>
      </div>
      <div
        style="border-bottom: 2px solid green; color: green"
        v-if="personAcceptQueryDto.handleStatus == 6"
      >
        <span>已完成</span>
      </div>
    </div>

    <!--  个人工单数据展示  -->
    <div class="personList" v-for="(item, index) in list" :key="index">
      <!--   待处理工单   -->
      <dev v-if="item.handleStatus == 1">
        &nbsp;&nbsp;师父您好，您在{{ item.acceptTime }}接受了工单来源为{{
          item.workOrderSourceName
        }}， 工单编号为
        <a
          @click="eventDetail(item.workOrderNo)"
          style="color: green; text-decoration: underline"
        >
          {{ item.workOrderNo }}
        </a>
        的一条{{ item.workOrderTypeName }}。 该工单是由{{
          item.eventTypeName
        }}而产生，截至目前为止已被催办了{{
          item.urgeToHandleCount == null ? 0 : item.urgeToHandleCount
        }}次，最后一次催办时间为{{
          item.lastUrgeToHandleTime == null
            ? '空（暂无催办记录）'
            : item.lastUrgeToHandleTime
        }}。 请尽快处理该工单，需处理的工单内容为：{{
          item.workOrderContent == null
            ? '空（该工单未记录工单内容）'
            : item.workOrderContent
        }}。
        <el-button
          type="success"
          @click="beginHandleWorkOrder(item.id)"
          size="small"
          style="width: 100px; height: 30px; float: right; margin-right: 20px;margin-top: 15px"
        >
          开始处理
        </el-button>
        <br />
        &nbsp;
        <br />
        &nbsp;
      </dev>
      <!--   处理中工单   -->
      <dev v-if="item.handleStatus == 2">
        &nbsp;&nbsp;您在{{ item.processBeginTime }}将来源于{{
          item.workOrderSourceName
        }}， 工单编号为
        <a
          @click="eventDetail(item.workOrderNo)"
          style="color: green; text-decoration: underline"
        >
          {{ item.workOrderNo }}
        </a>
        的一条{{ item.workOrderTypeName }}纳入了待处理行列。 该工单是由{{
          item.eventTypeName
        }}而产生，截至目前为止已被催办了{{
          item.urgeToHandleCount == null ? 0 : item.urgeToHandleCount
        }}次，最后一次催办时间为{{
          item.lastUrgeToHandleTime == null
            ? '空（暂无催办记录）'
            : item.lastUrgeToHandleTime
        }}。 请尽快处理该工单，需处理的工单内容为：{{
          item.workOrderContent == null
            ? '空（该工单未记录工单内容）'
            : item.workOrderContent
        }}。
        <el-button
          type="success"
          @click="HandleOverWorkOrder(item.id)"
          size="small"
          style="width: 100px; height: 30px; float: right; margin-right: 20px;margin-top: 15px"
        >
          完成处理
        </el-button>
        <br />
        &nbsp;
        <br />
        &nbsp;
      </dev>
      <!--   督办中工单   -->
      <dev v-if="item.handleStatus == 3">
        &nbsp;&nbsp;您在{{ item.superviseBeginTime }}处理完了来源于{{
          item.workOrderSourceName
        }}， 工单编号为
        <a
          @click="eventDetail(item.workOrderNo)"
          style="color: green; text-decoration: underline"
        >
          {{ item.workOrderNo }}
        </a>
        的一条{{ item.workOrderTypeName }}。 该工单是由{{
          item.eventTypeName
        }}而产生，截至目前为止已被催办了{{
          item.urgeToHandleCount == null ? 0 : item.urgeToHandleCount
        }}次，最后一次催办时间为{{
          item.lastUrgeToHandleTime == null
            ? '空（暂无催办记录）'
            : item.lastUrgeToHandleTime
        }}。 请尽快确认提交该工单，完成督办！
        <el-button
          type="success"
          @click="HandleWorkOrder(item.id)"
          size="small"
          style="width: 100px; height: 30px; float: right; margin-right: 20px;margin-top: 15px"
        >
          督办
        </el-button>
        <br />
        &nbsp;
        <br />
        &nbsp;
      </dev>
      <!--   已提交工单   -->
      <dev v-if="item.handleStatus == 4">
        &nbsp;&nbsp;您在{{ item.superviseEndTime }}督办完了来源于{{
          item.workOrderSourceName
        }}， 工单编号为
        <a
          @click="eventDetail(item.workOrderNo)"
          style="color: green; text-decoration: underline"
        >
          {{ item.workOrderNo }}
        </a>
        的一条{{ item.workOrderTypeName }}。 该工单是由{{
          item.eventTypeName
        }}而产生，截至目前为止已被催办了{{
          item.urgeToHandleCount == null ? 0 : item.urgeToHandleCount
        }}次，最后一次催办时间为{{
          item.lastUrgeToHandleTime == null
            ? '空（暂无催办记录）'
            : item.lastUrgeToHandleTime
        }}。 该工单的材料你已将其提交给相关人员审核，目前工单材料正在审核中！
        <el-button
          type="success"
          @click="selectWorkSource(item.workOrderNo)"
          size="small"
          style="width: 100px; height: 30px; float: right; margin-right: 20px;margin-top: 15px"
        >
          查看工单材料
        </el-button>
        <br />
        &nbsp;
        <br />
        &nbsp;
      </dev>
      <!--   被驳回工单   -->
      <dev v-if="item.handleStatus == 5">
        &nbsp;&nbsp;您督办完了的来源于{{ item.workOrderSourceName }}，
        工单编号为
        <a
          @click="eventDetail(item.workOrderNo)"
          style="color: green; text-decoration: underline"
        >
          {{ item.workOrderNo }}
        </a>
        的一条{{ item.workOrderTypeName }}被驳回了。 该工单是由{{
          item.eventTypeName
        }}而产生，截至目前为止已被催办了{{
          item.urgeToHandleCount == null ? 0 : item.urgeToHandleCount
        }}次，最后一次催办时间为{{
          item.lastUrgeToHandleTime == null
            ? '空（暂无催办记录）'
            : item.lastUrgeToHandleTime
        }}。 该工单目前被驳回请查看驳回原因后进行相关处理！
        <a
          @click="selectRefuseReason(item.id)"
          style="color: red; text-decoration: underline"
        >
          查看驳回信息
        </a>
        <el-button
          type="success"
          @click="HandleWorkOrder(item.id)"
          size="small"
          style="width: 100px; height: 30px; float: right; margin-right: 20px;margin-top: 15px"
        >
          重新提交审核
        </el-button>
        <br />
        &nbsp;
        <br />
        &nbsp;
      </dev>
      <!--  已完成工单  -->
      <dev v-if="item.handleStatus == 6">
        &nbsp;&nbsp;您完成了来源于{{ item.workOrderSourceName }}， 工单编号为
        <a
          @click="eventDetail(item.workOrderNo)"
          style="color: green; text-decoration: underline"
        >
          {{ item.workOrderNo }}
        </a>
        的一条{{ item.workOrderTypeName }}。 该工单是由{{
          item.eventTypeName
        }}而产生，截至目前为止已被催办了{{
          item.urgeToHandleCount == null ? 0 : item.urgeToHandleCount
        }}次，最后一次催办时间为{{
          item.lastUrgeToHandleTime == null
            ? '空（暂无催办记录）'
            : item.lastUrgeToHandleTime
        }}。 目前工单已完成！！！
        <el-button
          type="success"
          @click="selectWorkSource(item.workOrderNo)"
          size="small"
          style="width: 100px; height: 30px; float: right; margin-right: 20px;margin-top: 15px"
        >
          查看完成工单信息
        </el-button>
        <br />
        &nbsp;
      </dev>
    </div>

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
  achieveWorkOrderHandle,
  BeginHandleWorkOrder,
  GetPersonAcceptByConditionAndPage,
  GetPersonAcceptByWorkOrderNo,
  GetWorkOderByWorkOrderNo,
  GetWorkSourceByAcceptId,
  ProcessWorkOrder,
  SaveWorkSource,
  SubmitWorkSource,
} from '@/api/WorkOrder'
import { GetLineEventById } from '@/api/lineEvent'
import { GetTransformerEventById } from '@/api/transformerEvent'
import { GetConsEventById } from '@/api/consEvent'
import { GetLineInfoByLineId } from '@/api/lineInfo'
import { GetTransformerInfoByTransformerCode } from '@/api/transformerInfo'
import { GetConsInfoByConsNo } from '@/api/consInfo'
import { GetKeyAndValueByType } from '@/api/sysDict'
import { ElMessage, ElMessageBox } from 'element-plus'
import { useApp } from '@/pinia/modules/app'
//----------------------------------------列表---------------------------------------------------
// 定义表格数据模型
const list = ref([])
//分页条数据模型
const total = ref(0)
//分页
const pageParamsForm = {
  page: 1,
  limit: 4,
}
const pageParams = ref(pageParamsForm)
//查询条件
const personAcceptQueryDto = ref({
  handleStatus: 1,
})

//调用接口进行条件分页查询个人接单列表
const fetchData = async () => {
  const { data } = await GetPersonAcceptByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    personAcceptQueryDto.value.handleStatus
  )
  list.value = data.list
  total.value = data.total
}

//钩子函数
onMounted(() => {
  fetchData()
})

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

//---------------------------------------工单编号穿透事件---------------------------------------------
const workOrder = ref({})
const eventDetailDialogVisible = ref(false) //控制查看工单详情模态窗口的开闭
const lineEvent = ref({}) //存放线路停运事件信息
const transformerEvent = ref({}) //存放配变停运事件信息
const consEvent = ref({}) //存放用户停运事件信息
const lineInfo = ref({}) //封装线路信息
const transformerInfo = ref({}) //封装变压器信息
const consInfo = ref({}) //封装用户信息
const eventDetail = async workOrderNo => {
  getworkOrderTypeItem()
  getworkOrderStatusItem()
  getWorkOrderSourceItem()
  getWorkOrderEventTypeItem()

  //根据工单编号查询工单
  const { data } = await GetWorkOderByWorkOrderNo(workOrderNo)
  workOrder.value = data

  if (workOrder.value.eventType == 1) {
    //线路事件
    await selectLineEventById(workOrder.value.eventId)
    if (lineEvent.value != null) {
      await selectLineInfoByLineId(lineEvent.value.lineId)
    }
  } else if (workOrder.value.eventType == 2) {
    //配变事件
    await selectTransformerEventById(workOrder.value.eventId)
    if (transformerEvent.value != null) {
      await selectTransformerInfoByTransformerCode(
        transformerEvent.value.transformerCode
      )
    }
  } else if (workOrder.value.eventType == 3) {
    //用户事件
    await selectConsEventById(workOrder.value.eventId)
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

//-----------------------------------------tab页切换事件-----------------------------------------
//切换到待处理
const dclHandle = () => {
  personAcceptQueryDto.value.handleStatus = 1
  fetchData()
}
//切换到处理中
const clzHandle = () => {
  personAcceptQueryDto.value.handleStatus = 2
  fetchData()
}
//切换到督办中
const dbzHandle = () => {
  personAcceptQueryDto.value.handleStatus = 3
  fetchData()
}
//切换到已提交
const ytjHandle = () => {
  personAcceptQueryDto.value.handleStatus = 4
  fetchData()
}
//切换到被驳回
const bbhHandle = () => {
  personAcceptQueryDto.value.handleStatus = 5
  fetchData()
}
//切换到已完成
const ywcHandle = () => {
  personAcceptQueryDto.value.handleStatus = 6
  fetchData()
}

//--------------------------------各个tab页处理按钮点击事件--------------------------------------------
//-----------点击开始处理按钮-----------
const beginHandleWorkOrder = id => {
  ElMessageBox.confirm(
    '该操作会将工单纳入受理行列，必须尽快完成，您确定要开始处理该工单吗?',
    'Warning',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  ).then(async () => {
    const { code, message } = await BeginHandleWorkOrder(id)
    if (code === 200) {
      ElMessage.success(message + ', 请及时受理该工单！')
      fetchData()
    } else {
      ElMessage.warning(message)
    }
  })
}

const workSource = ref({
  reallyReason: '',
  faultRecordImage: '',
  handleResult: '',
  handleImage: '',
  acceptId: '',
})
const processDialogVisible = ref(false)
//---------------点击处理完成按钮----------------
const ProcessOrHandle = ref()
const HandleOverWorkOrder = id => {
  workSource.value = {}
  ProcessOrHandle.value = '处理工单详细情况材料'
  isViewOtherSourceInfo.value = false
  workSource.value.acceptId = id
  processDialogVisible.value = true
}
//点击处理情况模态窗口中的提交按钮后触发
const submitProcessResult = async () => {
  if (workSource.value.reallyReason == undefined) {
    ElMessage.warning('【现场故障真实原因】不能为空！')
    return
  }
  if (workSource.value.faultRecordImage == undefined) {
    ElMessage.warning('【现场故障图片】不能为空！')
    return
  }
  if (workSource.value.handleResult == undefined) {
    ElMessage.warning('【处理结果】不能为空！')
    return
  }
  if (workSource.value.handleImage == undefined) {
    ElMessage.warning('【处理结果佐证图】不能为空！')
    return
  }
  const { code, message } = await achieveWorkOrderHandle(workSource.value)
  if (code === 200) {
    processDialogVisible.value = false
    ElMessage.success(message)
    fetchData()
  } else {
    ElMessage.error(message)
  }
}

//--------------------------点击督办按钮-------------
const isViewOtherSourceInfo = ref(false)
const HandleWorkOrder = id => {
  isViewOtherSourceInfo.value = true
  ProcessOrHandle.value = '个人工单材料提交详情'
  //根据接单id查询提交材料信息
  getWorkSourceByAcceptId(id)
  processDialogVisible.value = true
}
//根据接单id查询提交材料信息
const getWorkSourceByAcceptId = async id => {
  const { data } = await GetWorkSourceByAcceptId(id)
  workSource.value = data
}
//点击保存按钮
const saveWorkSource = async () => {
  const { code, message } = await SaveWorkSource(workSource.value)
  if (code === 200) {
    processDialogVisible.value = false
    ElMessage.success(message)
    fetchData()
  } else {
    ElMessage.error(message)
  }
}
//点击提交按钮
const submitWorkSource = () => {
  workSource.value.acceptFlag = 0
  ElMessageBox.confirm(
    '该操作将会将你的处理结果提交给领导审核，您确定要提交吗?',
    'Warning',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }
  ).then(async () => {
    const { code, message } = await SubmitWorkSource(workSource.value)
    if (code === 200) {
      ElMessage.success(message + ', 工单处理材料已提交给相关人审核！')
      processDialogVisible.value = false
      fetchData()
    } else {
      ElMessage.warning(message)
    }
  })
}

//-----------------点击查看工单材料按钮----------------
const personAccept = ref({}) //封装个人接单信息
const reviewDialogVisible = ref(false) //控制查看工单材料详情模态窗口
const selectWorkSource = workOrderNo => {
  //根据工单编号查询个人接单信息
  getPersonAcceptByWorkOrderNo(workOrderNo)

  //打开模态窗口
  reviewDialogVisible.value = true
}
//根据工单编号查询个人接单信息
const getPersonAcceptByWorkOrderNo = async workOrderNo => {
  const { data } = await GetPersonAcceptByWorkOrderNo(workOrderNo)
  personAccept.value = data
  //根据个人接单id查询工单材料信息（这个有写好的接口）
  getWorkSourceByAcceptId2(personAccept.value.id)
}
//根据个人接单id查询个人提交工单材料信息
const getWorkSourceByAcceptId2 = async acceptId => {
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

//--------------------------------查看驳回信息-------------------------------
const RefuseDialogVisible = ref(false)
const selectRefuseReason = async id => {
  const { data } = await GetWorkSourceByAcceptId(id)
  workSource.value = data
  RefuseDialogVisible.value = true
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
.personAcceptDT {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.personAcceptDT::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/bkm5.gif');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.personAcceptDT > * {
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

.tab {
  width: 100%;
  height: 30px;
  border-bottom: black;
}
.tab div {
  width: 16%;
  height: 25px;
  margin-top: 5px;
  float: left;
  text-align: center;
  color: black;
}
.tab div:hover {
  color: green;
}
.personList {
  width: 80%;
  margin-left: 10%;
  margin-top: 10px;
  border: 5px solid #ccc;
  font-family: 微软雅黑;
  font-style: italic;
  font-size: 20px;
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
