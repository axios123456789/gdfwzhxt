package com.wangwen.gdfwzhxt.manager.service;

import com.wangwen.gdfwzhxt.model.vo.system.ValidateCodeVo;

public interface ValidateCodeService {
    //生成验证码
    ValidateCodeVo generateValidateCode();
}
