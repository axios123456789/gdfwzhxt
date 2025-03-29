package com.wangwen.gdfwzhxt.manager.timerTask.time;

import com.wangwen.gdfwzhxt.manager.timerTask.service.ElectricityUsageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@Configuration
@EnableScheduling
public class ElectricityUsageTime {
    @Autowired
    private ElectricityUsageService electricityUsageService;

    /**
     * 每3分钟定时刷新用户的电费余额和电能使用量同时记录到电能使用情况表中
     */
    @Scheduled(cron = "0 */3 * * * ?")
    public void chargeFlush(){
        try {
            electricityUsageService.chargeFlush();
        } catch (Exception e) {
            System.out.println("定时任务每5分钟定时刷新用户的电费余额和电能使用量同时记录到电能使用情况表中调度失败！！！");
        }
    }
}
