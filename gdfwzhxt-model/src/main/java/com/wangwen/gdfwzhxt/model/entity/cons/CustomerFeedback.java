package com.wangwen.gdfwzhxt.model.entity.cons;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "客户反馈实体类")
public class CustomerFeedback extends BaseEntity {
    @Schema(description = "用户编号")
    private String consNo;

    @Schema(description = "用户名称")
    private String consName;

    @Schema(description = "反馈内容")
    private String feedbackContent;

    @Schema(description = "处理标识（1.已处理/2.未处理）")
    private Integer handleFlag;

    private String handleFlagName;

    @Schema(description = "反馈级别（1.紧急反馈 2.个人问题反馈 3.员工问题反馈 4.无效反馈）")
    private Integer feedbackLevel;

    private String feedbackLevelName;

    @Schema(description = "反馈设备")
    private String feedbackEquip;

    @Schema(description = "反馈设备名称")
    private String feedbackEquipName;

    @Schema(description = "生成工单内容")
    private String generateWorkOrderContent;

    @Schema(description = "客户意见")
    private String customerOpinion;

    @Schema(description = "反馈设备类型")
    private Integer feedbackEquipType;

    private String feedbackEquipTypeName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "处理时间")
    private Date handleTime;
}
