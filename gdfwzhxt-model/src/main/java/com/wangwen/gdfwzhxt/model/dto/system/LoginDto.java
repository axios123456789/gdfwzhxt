package com.wangwen.gdfwzhxt.model.dto.system;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "用户登录请求接口")
public class LoginDto {
    @Schema(description = "登录账号")
    private String userName;

    @Schema(description = "登录密码")
    private String password;

    @Schema(description = "提交验证码")
    private String captcha;

    @Schema(description = "验证码key")
    private String codeKey;
}
