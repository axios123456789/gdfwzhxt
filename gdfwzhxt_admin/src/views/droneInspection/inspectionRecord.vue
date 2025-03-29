<template>
  <div class="droneSource">
    <h2
      style="font-family: 幼圆; font-weight: bold; margin: 20px; font-size: 25px"
    >
      无人机巡视记录
    </h2>

    <!--  查询条件框  -->
    <div class="search-div">
      <el-form label-width="120px" size="small">
        <!--    第一行查询条件    -->
        <el-row>
          <el-col :span="6">
            <el-form-item label="设备名称">
              <el-input
                v-model="viewRecordDto.equipName"
                style="width: 100%"
                clearable
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="处理标识">
              <el-select
                v-model="viewRecordDto.handleFlag"
                multiple
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
          <el-col :span="12">
            <el-form-item label="巡视时间">
              <el-date-picker
                v-model="viewTime"
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
            <el-form-item label="设备类型">
              <el-select
                v-model="viewRecordDto.equipType"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in equipTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6" v-if="viewRecordDto.equipType == 1">
            <el-form-item label="工单状态">
              <el-select
                v-model="viewRecordDto.equipFaultType"
                multiple
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in lineFaultTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6" v-if="viewRecordDto.equipType == 2">
            <el-form-item label="工单状态">
              <el-select
                v-model="viewRecordDto.equipFaultType"
                multiple
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in transformerFaultTypeItem"
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
          <el-button type="primary" size="small" @click="searchViewRecord">
            搜索
          </el-button>
          <el-button size="small" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>

    <!--  新增巡视记录  -->
    <div class="tools-div">
      <el-button type="success" size="small" @click="addViewRecord">
        录 入
      </el-button>
    </div>

    <!--  点击添加或修改打开该模态窗口  -->
    <el-dialog v-model="dialogVisible" :title="dialogTitle" width="80%">
      <el-form label-width="140px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="巡视设备类型*">
              <el-select
                v-model="viewRecord.equipType"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in equipTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="巡视设备*">
              <el-input
                v-model="viewRecord.equipName"
                clearable
                placeholder="点击文本框选择"
                :disabled="isDisabled2"
                @click="selectViewEquip"
                readonly
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="设备编码">
              <el-input
                v-model="viewRecord.equipNo"
                style="width: 100%"
                clearable
                disabled="true"
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" v-if="viewRecord.equipType == 1">
            <el-form-item label="线路故障类型*">
              <el-select
                v-model="viewRecord.equipFaultType"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in lineFaultTypeItem"
                  :key="item.value"
                  :label="item.text"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12" v-if="viewRecord.equipType == 2">
            <el-form-item label="配变故障类型*">
              <el-select
                v-model="viewRecord.equipFaultType"
                placeholder="请选择"
                style="width: 100%"
                clearable
              >
                <el-option
                  v-for="item in transformerFaultTypeItem"
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
            <el-form-item label="所属无人机*">
              <el-input
                v-model="viewRecord.droneName"
                clearable
                placeholder="点击文本框选择"
                :disabled="isDisabled2"
                @click="selectDrone"
                readonly
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="处理标识*">
              <el-select
                v-model="viewRecord.handleFlag"
                placeholder="请选择"
                style="width: 100%"
                :disabled="isDisabled"
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
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="巡视时间*">
              <el-date-picker
                v-model="viewRecord.viewTime"
                type="datetime"
                style="width: 100%"
                placeholder="选择日期时间"
                :editable="false"
                :value-format="'YYYY-MM-DD HH:mm:ss'"
              ></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="设备所在地址">
              <el-input
                v-model="viewRecord.equipAddress"
                style="width: 100%"
                clearable
                disabled="true"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="巡视结果描述">
              <el-input
                type="textarea"
                style="width: 100%"
                :rows="3"
                placeholder="请输入内容"
                v-model="viewRecord.description"
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

    <!--  点击所属无人机打开该模态窗口  -->
    <el-dialog v-model="dialogVisibleDroneSelect" title="选择单位" width="80%">
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
            <el-button size="small" @click="droneResetData">重置</el-button>
          </el-row>
        </el-form>
      </div>

      <!-- 无人机资源展示表格   -->
      <el-table
        :data="droneList"
        @cell-click="droneHandle"
        style="width: 100%; margin-bottom: 20px;"
      >
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
        v-model:current-page="dronePageParams.page"
        v-model:page-size="dronePageParams.limit"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="droneFetchData"
        @current-change="droneFetchData"
        layout="total, sizes, prev, pager, next"
        :total="droneTotal"
      />
    </el-dialog>

    <!--  点击记录扭转打开该模态窗口    -->
    <el-dialog v-model="changeDialogVisible" title="记录扭转详情" width="30%">
      <el-form label-width="80px">
        <el-form-item label="扭转方向">
          <el-radio-group v-model="paramsFlag">
            <el-radio :label="1">仅生成事件</el-radio>
            <el-radio :label="2">仅生成工单</el-radio>
            <el-radio :label="3">生成事件和工单</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitHandle">提交</el-button>
          <el-button @click="changeDialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!--  巡视记录展示表格  -->
    <el-table :data="list" style="width: 100%; margin-bottom: 20px;">
      <el-table-column label="操作" align="center" width="300" #default="scope">
        <el-button
          type="primary"
          size="small"
          @click="editViewRecord(scope.row)"
        >
          修改
        </el-button>
        <el-button
          type="danger"
          size="small"
          @click="deleteViewRecord(scope.row)"
        >
          删除
        </el-button>
        <el-button
          v-if="scope.row.handleFlag == 1"
          type="warning"
          size="small"
          @click="changeViewRecord(scope.row)"
        >
          记录扭转
        </el-button>
      </el-table-column>
      <el-table-column prop="equipName" label="巡视设备名称" width="140" />
      <el-table-column prop="equipTypeName" label="巡视设备类型" width="140" />
      <el-table-column prop="equipNo" label="设备编码" width="160" />
      <el-table-column prop="handleFlagName" label="处理标识" width="120" />
      <el-table-column
        prop="equipFaultTypeName"
        label="设备故障类型"
        width="120"
      />
      <el-table-column prop="droneNo" label="无人机编号" width="120" />
      <el-table-column prop="droneName" label="无人机名称" width="120" />
      <el-table-column prop="viewTime" label="巡视时间" width="180" />
      <el-table-column prop="viewBy" label="巡视人" width="100" />
      <el-table-column prop="description" label="巡视结果描述" width="220" />
      <el-table-column
        prop="equipAddress"
        label="巡视设备所在地址"
        width="180"
      />
      <el-table-column prop="updateTime" label="巡视记录修改时间" width="180" />
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
import { GetKeyAndValueByType } from '@/api/sysDict'
import {
  DeleteViewRecordById,
  GetDroneInfoByConditionAndPage,
  GetViewRecordByConditionAndPage,
  SaveViewRecord,
  ViewRecordChange,
} from '@/api/drone'
import { GetTransformerInfoListByConditionAndPage } from '@/api/transformerInfo'
import { GetLineInfoListByConditionAndPage } from '@/api/lineInfo'
import { GetUnitListByConditionAndPage } from '@/api/unit'
import { ElMessage, ElMessageBox } from 'element-plus'
//---------------------------------------------------------列表--------------------------------------------------------
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
const viewRecordDto = ref({
  equipType: '',
  equipName: '',
  equipFaultType: [],
  viewBeginTime: '',
  viewEndTime: '',
  handleFlag: [],
})
const viewTime = ref([]) //封装巡视时间参数
const handleFlagItem = ref([]) //封装巡视记录处理标识item
const lineFaultTypeItem = ref([]) //封装线路故障类型item
const transformerFaultTypeItem = ref([]) //封装配变故障类型Item
const equipTypeItem = ref([]) //封装设备类型item
const getHandleFlagItem = async () => {
  const { data } = await GetKeyAndValueByType('t_view_record_handle_flag')
  handleFlagItem.value = data
}
const getLineFaultTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_line_event_type')
  lineFaultTypeItem.value = data
}
const getTransformerFaultTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_transformer_event_type')
  transformerFaultTypeItem.value = data
}
const getEquipTypeItem = async () => {
  const { data } = await GetKeyAndValueByType('t_view_record_equip_type')
  equipTypeItem.value = data
}
//调用接口拿到巡视记录数据
const fetchData = async () => {
  const { data } = await GetViewRecordByConditionAndPage(
    pageParams.value.page,
    pageParams.value.limit,
    viewRecordDto.value
  )
  list.value = data.list
  total.value = data.total
}
//点击搜索按钮
const searchViewRecord = () => {
  viewRecordDto.value.viewBeginTime = viewTime.value[0]
  viewRecordDto.value.viewEndTime = viewTime.value[1]
  if (
    viewRecordDto.value.equipType == null ||
    viewRecordDto.value.equipType == ''
  ) {
    viewRecordDto.value.equipFaultType = []
  }
  fetchData()
}
//点击重置按钮
const resetData = () => {
  viewTime.value = []
  viewRecordDto.value = {}
  fetchData()
}
//钩子函数
onMounted(() => {
  getEquipTypeItem()
  getHandleFlagItem()
  getLineFaultTypeItem()
  getTransformerFaultTypeItem()

  fetchData()
})

//-----------------------------------------------------新增或修改巡视记录---------------------------------------------
//封装巡视记录数据
const viewRecord = ref({
  equipType: '', //巡视设备类型（1.线路 2.变压器）
  equipNo: '', //设备编码
  equipName: '', //设备名称
  equipFaultType: '', //设备故障类型：线路就按线路故障类型，配变就按配变故障类型
  droneNo: '', //巡视无人机编号
  droneName: '', //巡视无人机名称
  viewTime: '', //巡视时间
  description: '', //巡视结果描述
  handleFlag: '', //处理标识（1.未处理 2.已生成停电事件 3.已生成工单 4.已生成事件和工单）
  equipAddress: '', //设备所在地址
})
const dialogVisible = ref(false) //控制添加或修改模态窗口的开闭
const dialogTitle = ref('') //控制添加或修改模态窗口的标题
const isDisabled2 = ref(false) //控制巡视设备和所属无人机文本框是否可编辑
const isDisabled = ref(true) //控制处理标识是否可编辑
//点击录入按钮触发
const addViewRecord = () => {
  viewRecord.value = {}
  viewRecord.value.handleFlag = 1 //设置默认未处理
  isDisabled.value = true
  isDisabled2.value = false
  //设置标题
  dialogTitle.value = '录入无人机巡视记录'
  dialogVisible.value = true
}
//点击修改按钮触发
const editViewRecord = row => {
  viewRecord.value = { ...row }
  isDisabled.value = true
  isDisabled2.value = true
  //设置标题
  dialogTitle.value = '修改巡视记录'
  dialogVisible.value = true
}
//点击添加或修改巡视记录中的提交按钮触发
const saveOrUpdate = async () => {
  if (viewRecord.value.equipType == undefined) {
    ElMessage.warning('【巡视设备类型】不能为空')
    return
  }
  if (viewRecord.value.equipName == undefined) {
    ElMessage.warning('【巡视设备】不能为空')
    return
  }
  if (viewRecord.value.equipFaultType == undefined) {
    ElMessage.warning('【设备故障类型】不能为空')
    return
  }
  if (viewRecord.value.droneNo == undefined) {
    ElMessage.warning('【所属无人机】不能为空')
    return
  }
  if (viewRecord.value.handleFlag == undefined) {
    ElMessage.warning('【处理标识】不能为空')
    return
  }
  if (viewRecord.value.viewTime == undefined) {
    ElMessage.warning('【巡视时间】不能为空')
    return
  }

  const { code, message } = await SaveViewRecord(viewRecord.value)
  if (code === 200) {
    dialogVisible.value = false
    ElMessage.success(message)
    fetchData()
  } else {
    ElMessage.error(message)
  }
}
//----------------巡视设备文本框点击处理-------------------------------------------------
//点击巡视设备文本框
const selectViewEquip = () => {
  if (viewRecord.value.equipType == undefined) {
    ElMessage.warning('需要先选中设备类型才能选择具体设备！')
    return
  }
  if (viewRecord.value.equipType == 1) {
    //线路
    //重置查询条件
    queryLineDto.value = {}
    //获取线路各下拉列表
    getLineTypeItem()
    getLineStatusItem()
    dialogVisibleLineSelect.value = true
    lineFetchData()
  } else if (viewRecord.value.equipType == 2) {
    //配变
    //重置查询条件
    queryTransformerDto.value = {}
    getTransformerTypeItem()
    transformerFetchData()
    dialogVisibleTransformerSelect.value = true
  }
}
//---------------所属无人机文本框点击处理-----------------------------------------------------
//点击所属无人机文本框
const selectDrone = () => {
  droneQueryDto.value = {}
  dialogVisibleDroneSelect.value = true
  droneFetchData()
}

//----------------------------打开对应的模态框事件-------------------------------
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
  viewRecord.value.equipNo = row.transformerCode
  viewRecord.value.equipName = row.transformerName
  viewRecord.value.equipAddress = row.address
  dialogVisibleTransformerSelect.value = false
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
  if (viewRecord.value.equipType == 2) {
    queryTransformerDto.value.lineName = row.lineName
    queryTransformerDto.value.lineId = row.id
    dialogVisibleLineSelect.value = false
  } else if (viewRecord.value.equipType == 1) {
    viewRecord.value.equipNo = row.id
    viewRecord.value.equipName = row.lineName
    viewRecord.value.equipAddress = row.address
    dialogVisibleLineSelect.value = false
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
//--------------------------------------无人机文本框选择事件-------------------
//控制无人机模态窗口
const dialogVisibleDroneSelect = ref(false)
// 定义表格数据模型
const droneList = ref([])
//分页条数据模型
const droneTotal = ref(0)
const dronePageParams = ref({
  page: 1,
  limit: 10,
})
const droneQueryDto = ref({
  droneNo: '',
  droneName: '',
})
//查询列表数据
const droneFetchData = async () => {
  const { data } = await GetDroneInfoByConditionAndPage(
    dronePageParams.value.page,
    dronePageParams.value.limit,
    droneQueryDto.value
  )
  droneList.value = data.list
  droneTotal.value = data.total
}
//搜索方法
const searchDroneInfo = () => {
  droneFetchData()
}
//重置方法
const droneResetData = () => {
  droneQueryDto.value = {}
  droneFetchData()
}
//无人机列表项点击事件
const droneHandle = row => {
  viewRecord.value.droneNo = row.droneNo
  viewRecord.value.droneName = row.droneName
  dialogVisibleDroneSelect.value = false
}

//------------------------------------------------删除无人机巡视记录-----------------------------------
const deleteViewRecord = row => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', 'Warning', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    const { code, message } = await DeleteViewRecordById(row.id)
    if (code === 200) {
      ElMessage.success(message)
      fetchData()
    } else {
      ElMessage.error(message)
    }
  })
}

//-----------------------------记录扭转------------------------------------
const paramsFlag = ref()
let changeDialogVisible = ref(false)
//点击记录扭转按钮
const changeViewRecord = row => {
  viewRecord.value = { ...row }
  paramsFlag.value = ''
  changeDialogVisible.value = true
}
//点击记录扭转模态窗口中的提交按钮
const submitHandle = async () => {
  if (paramsFlag.value == null || paramsFlag.value == '') {
    ElMessage.warning('请选择扭转方向！')
    return
  }
  const { code, message } = await ViewRecordChange(
    viewRecord.value,
    paramsFlag.value
  )
  if (code === 200) {
    changeDialogVisible.value = false
    ElMessage.success(message)
    fetchData()
  } else {
    ElMessage.error(message)
  }
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
  background-image: url('src/assets/gmzr.webp');
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
</style>
