package com.wangwen.gdfwzhxt.model.entity.system;

import com.wangwen.gdfwzhxt.model.entity.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "用户实体类")
public class SysUser extends BaseEntity {
    @Schema(description = "登录账号")
    private String loginAccount;

    @Schema(description = "登录密码")
    private String loginPassword;

    @Schema(description = "用户名字")
    private String name;

    @Schema(description = "账号状态")
    private Integer status;

    @Schema(description = "账号等级")
    private Integer level;

    @Schema(description = "用户地址")
    private String address ;

    @Schema(description = "用户头像")
    private String avatar;

    @Schema(description = "用户展示图片信息")
    private String showImage;

    @Schema(description = "用户所属供电公司")
    private String company;
}