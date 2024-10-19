package com.wangwen.gdfwzhxt.manager.service.impl;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import com.wangwen.gdfwzhxt.manager.service.ValidateCodeService;
import com.wangwen.gdfwzhxt.model.vo.system.ValidateCodeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
public class ValidateCodeServiceImpl implements ValidateCodeService {
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 生成验证码
     * @return
     */
    @Override
    public ValidateCodeVo generateValidateCode() {
        //1.通过工具生成图片验证码（hutool）
        //四个参数分别代表（验证码图片的宽和高，位数，干扰线数）
        CircleCaptcha circleCaptcha = CaptchaUtil.createCircleCaptcha(150, 48, 4, 2);
        String codeValue = circleCaptcha.getCode(); //生成的四位验证码的值
        String imageBase64 = circleCaptcha.getImageBase64();    //返回图片验证码，base64编码

        //2.把验证码存到redis里面，设置redis的key：uuid，值value：验证码值
        String key = UUID.randomUUID().toString().replaceAll("-", "");
        redisTemplate.opsForValue().set("user:validate"+key,
                                        codeValue,
                                        5,
                                        TimeUnit.MINUTES);

        //3.返回ValidateCodeVO对象
        ValidateCodeVo validateCodeVo = new ValidateCodeVo();
        validateCodeVo.setCodeKey(key);
        validateCodeVo.setCodeValue("data:image/png;base64,"+imageBase64);

        return validateCodeVo;
    }
}
