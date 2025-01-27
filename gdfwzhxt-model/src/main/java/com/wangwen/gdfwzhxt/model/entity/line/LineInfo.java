package com.wangwen.gdfwzhxt.model.entity.line;

import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
public class LineInfo extends BaseEntity {
    @Schema(description = "线路名称")
    private String lineName;

    @Schema(description = "单位id")
    private String unitId;

    @Schema(description = "线路长度")
    private double lineLength;

    @Schema(description = "线路半径")
    private double radius;

    @Schema(description = "线路地址")
    private String address;

    @Schema(description = "电压等级")
    private String voltageLevel;

    @Schema(description = "额定电流")
    private String ratedCurrent;

    @Schema(description = "线路类型")
    private String lineType;

    @Schema(description = "所属母线")
    private String mainLine;

    @Schema(description = "线路接入时间")
    private Date accessTime;
}
