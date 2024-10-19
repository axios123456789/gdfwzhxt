package com.wangwen.gdfwzhxt.common_util;

import com.wangwen.gdfwzhxt.model.entity.system.SysUser;

public class AuthContextUtil {
    //创建SysUser的threadLocal对象
    private static final ThreadLocal<SysUser> threadLocal = new ThreadLocal<>();

    //添加方法
    public static void set(SysUser sysUser){
        threadLocal.set(sysUser);
    }

    //获取数据
    public static SysUser get(){
        return threadLocal.get();
    }

    //删除数据
    public static void remove(){
        threadLocal.remove();
    }
}
