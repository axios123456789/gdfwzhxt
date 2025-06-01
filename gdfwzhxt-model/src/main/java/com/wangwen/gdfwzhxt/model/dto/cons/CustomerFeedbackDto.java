package com.wangwen.gdfwzhxt.model.dto.cons;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "客户反馈条件查询封装参数")
public class CustomerFeedbackDto {
    private String consNo;

    private String consName;

    @Schema(description = "处理标识")
    private Integer handleFlag;

    @Schema(description = "反馈级别")
    private List<Integer> feedbackLevel;

    @Schema(description = "反馈设备编码")
    private String feedbackEquip;

    @Schema(description = "反馈设备类型")
    private Integer feedbackEquipType;

    private String handleBeginTime;

    private String handleEndTime;
}
