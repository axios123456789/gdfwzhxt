package com.wangwen.gdfwzhxt.manager.service.impl;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.wangwen.gdfwzhxt.common_service.exception.ElectricityException;
import com.wangwen.gdfwzhxt.manager.mapper.SysUserMapper;
import com.wangwen.gdfwzhxt.manager.service.SysUserService;
import com.wangwen.gdfwzhxt.model.dto.system.LoginDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysUser;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import com.wangwen.gdfwzhxt.model.vo.system.LoginVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 用户登录
     * @param loginDto
     * @return
     */
    @Override
    public LoginVo login(LoginDto loginDto) {
        //校验账号密码前先进行验证码校验
        //1.获取输入的验证码和存储到redis的key的名称
        String captcha = loginDto.getCaptcha();
        String key = loginDto.getCodeKey();

        //2.根据key查询redis中的验证码值
        String redisCode = (String) redisTemplate.opsForValue().get("user:validate" + key);

        //3.比较输入的验证码和redis存储的验证码是否一致

        //4.不一致提示错误信息
        if (StrUtil.isEmpty(redisCode) || !StrUtil.equalsIgnoreCase(redisCode, captcha)){
            throw new ElectricityException(ResultCodeEnum.VALIDATECODE_ERROR);
        }

        //5.一致删除redis中的验证码
        redisTemplate.delete("user:validate" + key);

        //1.获取提交的登录账号
        String loginAccount = loginDto.getUserName();

        //2.根据账号查询用户信息
        SysUser sysUser = sysUserMapper.getSysUserByAccount(loginAccount);

        //3.如果查不到用户信息，返回错误提升
        if (sysUser == null){
            throw new ElectricityException(ResultCodeEnum.LOGIN_ERROR);
        }

        //4.如果用户存在，比较密码是否一致（输入的密码进行md5进行加密）
        String database_pwd = sysUser.getLoginPassword();
        String input_pwd = DigestUtils.md5DigestAsHex(loginDto.getPassword().getBytes());
        if (!input_pwd.equals(database_pwd)){
            throw new ElectricityException(ResultCodeEnum.LOGIN_ERROR);
        }

        //5.如果密码一致，登录成功，密码不一致则登录失败
        //6.登录成功，生成用户唯一标识token
        String token = UUID.randomUUID().toString().replaceAll("-", "");

        //7.把登录成功用户信息放到redis里面
        redisTemplate.opsForValue().set("user:login"+token,
                JSON.toJSONString(sysUser),
                3,
                TimeUnit.HOURS);

        //8.返回token对象
        LoginVo loginVo = new LoginVo();
        loginVo.setToken(token);
        return loginVo;
    }

    /**
     * 获取当前登录用户信息
     * @param token
     * @return
     */
    @Override
    public SysUser getUserInfo(String token) {
        String userJson = (String) redisTemplate.opsForValue().get("user:login" + token);
        SysUser sysUser = JSON.parseObject(userJson, SysUser.class);
        return sysUser;
    }

    /**
     * 用户退出登录
     * @param token
     */
    @Override
    public void logout(String token) {
        redisTemplate.delete("user:login"+token);
    }
}
