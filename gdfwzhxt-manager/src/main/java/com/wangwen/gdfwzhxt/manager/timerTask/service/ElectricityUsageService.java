package com.wangwen.gdfwzhxt.manager.timerTask.service;

public interface ElectricityUsageService {
    //每5分钟定时刷新用户的电费余额和电能使用量同时记录到电能使用情况表中
    void chargeFlush();
}
