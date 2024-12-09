package com.wangwen.gdfwzhxt.model.entity.system;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

@Data
@Schema(description = "状态码表")
public class SysCode {
    @Schema(description = "唯一标识")
    private String id;

    @Schema(description = "状态码")
    private Integer code;

    @Schema(description = "值")
    private String value ;

    @Schema(description = "数据类型")
    private String type;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "创建时间")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(description = "修改时间")
    private Date updateTime;

    @Schema(description = "是否删除")
    private Integer isDeleted;

    @Schema(description = "描述")
    private String description;
}
