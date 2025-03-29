package com.wangwen.gdfwzhxt.model.dto.cons;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "用户停电时间请求参数")
public class ConsEventDto {
    @Schema(description = "用户编号")
    private String consNo;

    @Schema(description = "用户名称")
    private String consName;

    @Schema(description = "停电开始时间")
    private String powerOutageBeginTime;

    @Schema(description = "停电结束时间")
    private String powerOutageEndTime;

    @Schema(description = "用户停电类型")
    private List<Integer> powerOutageType;

    @Schema(description = "用户停电状态")
    private Integer status;
}
