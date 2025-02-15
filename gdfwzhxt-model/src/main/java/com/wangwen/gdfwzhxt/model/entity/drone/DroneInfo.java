package com.wangwen.gdfwzhxt.model.entity.drone;

import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "无人机信息实体类")
public class DroneInfo extends BaseEntity {
   @Schema(description = "无人机编码")
   private String droneNo;

   @Schema(description = "无人机名称")
   private String droneName;

   @Schema(description = "无人机图片")
   private String droneImage;

   @Schema(description = "生产日期")
   private String produceDate;

   @Schema(description = "运行日期")
   private String runDate;

   @Schema(description = "生产厂家")
   private String produceCompany;

   @Schema(description = "巡视范围（投运地址）")
   private String viewArea;

   @Schema(description = "备注")
   private String remark;
}
