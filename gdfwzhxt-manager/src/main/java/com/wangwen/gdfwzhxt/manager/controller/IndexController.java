package com.wangwen.gdfwzhxt.manager.controller;

import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.manager.service.SysUserService;
import com.wangwen.gdfwzhxt.manager.service.ValidateCodeService;
import com.wangwen.gdfwzhxt.model.dto.system.LoginDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysUser;
import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import com.wangwen.gdfwzhxt.model.vo.system.LoginVo;
import com.wangwen.gdfwzhxt.model.vo.system.ValidateCodeVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Tag(name = "用户接口")
@RestController
@RequestMapping(value = "/electricity/system/index")
public class IndexController {
    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private ValidateCodeService validateCodeService;

    /**
     * 查询系统是否注册了公司
     * @return
     */
    @GetMapping("/companyIsExists")
    public Result companyIsExists(){
        boolean flag = sysUserService.getCompanyExistsFlag();
        return Result.build(flag, ResultCodeEnum.SUCCESS);
    }

    /**
     * 用户退出登录
     * @param token
     * @return
     */
    @GetMapping("/logout")
    public Result logout(@RequestHeader(name = "token") String token){
        sysUserService.logout(token);
        return Result.build(null, ResultCodeEnum.SUCCESS);
    }

    /**
     * 获取当前登录用户信息
     * @param
     * @return
     */
    @GetMapping("/getUserInfo")
//    public Result getUserInfo(@RequestHeader(name = "token") String token){
//        //根据token查询redis获取用户信息
//        SysUser sysUser = sysUserService.getUserInfo(token);
//
//        //返回用户信息
//        return Result.build(sysUser, ResultCodeEnum.SUCCESS);
//    }
    public Result getUserInfo(){
        return Result.build(AuthContextUtil.get(), ResultCodeEnum.SUCCESS);
    }

    /**
     * 生成图片验证码
     * @return
     */
    @GetMapping("/generateValidateCode")
    public Result generateValidateCode(){
        ValidateCodeVo validateCodeVo = validateCodeService.generateValidateCode();
        return Result.build(validateCodeVo, ResultCodeEnum.SUCCESS);
    }

    /**
     * 用户登录
     * @param loginDto
     * @return
     */
    @Operation(summary = "登录的方法")
    @PostMapping("/login")
    public Result login(@RequestBody LoginDto loginDto){
        LoginVo loginVo = sysUserService.login(loginDto);
        return Result.build(loginVo, ResultCodeEnum.SUCCESS);
    }
}
