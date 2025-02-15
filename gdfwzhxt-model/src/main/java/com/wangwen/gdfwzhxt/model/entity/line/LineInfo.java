package com.wangwen.gdfwzhxt.model.entity.line;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class LineInfo extends BaseEntity {
    @Schema(description = "线路名称")
    private String lineName;

    @Schema(description = "单位id")
    private String unitId;

    @Schema(description = "单位名称")
    private String unitName;

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
    private Integer lineType;

    @Schema(description = "线路类型名称")
    private String lineTypeName;

    @Schema(description = "所属母线")
    private String mainLine;

    @Schema(description = "所属母校名称")
    private String mainLineName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "线路接入时间")
    private Date accessTime;

    @Schema(description = "线路状态 1:投入 0:回收")
    private Integer lineStatus;

    @Schema(description = "线路状态名称")
    private String lineStatusName;

    //下级列表
    @Schema(description = "子节点")
    private List<LineInfo> children;
}
