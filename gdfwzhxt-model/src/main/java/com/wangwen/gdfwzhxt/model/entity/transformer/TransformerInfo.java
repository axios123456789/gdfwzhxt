package com.wangwen.gdfwzhxt.model.entity.transformer;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "变压器信息实体类")
public class TransformerInfo extends BaseEntity {
    @Schema(description = "变压器局号")
    private String transformerCode;

    @Schema(description = "变压器名称")
    private String transformerName;

    @Schema(description = "变压器型号（TM-100）")
    private String model;

    @Schema(description = "额定容量kVA")
    private double ratedCapacity;

    @Schema(description = "所属线路")
    private String lineId;

    @Schema(description = "所属线路名称")
    private String lineName;

    @Schema(description = "变压器类型")
    private Integer transformerType;

    @Schema(description = "变压器类型名称")
    private String transformerTypeName;

    @Schema(description = "一次侧电压")
    private double primaryVoltage;

    @Schema(description = "二次侧电压")
    private double secondaryVoltage;

    @Schema(description = "制造厂家")
    private String manufacturer;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "安装日期")
    private Date installDate;

    @Schema(description = "维护记录")
    private String maintenanceRecords;

    @Schema(description = "地址")
    private String address;

    @Schema(description = "备注")
    private String remark;
}
