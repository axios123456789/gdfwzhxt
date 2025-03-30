package com.wangwen.gdfwzhxt.manager.timerTask.service.impl;

import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.ConsEventMapper;
import com.wangwen.gdfwzhxt.manager.mapper.ConsInfoMapper;
import com.wangwen.gdfwzhxt.manager.mapper.ElectricityUsageMapper;
import com.wangwen.gdfwzhxt.manager.timerTask.service.ElectricityUsageService;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsEvent;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsInfo;
import com.wangwen.gdfwzhxt.model.entity.cons.ElectricityUsage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@Service
public class ElectricityUsageServiceImpl implements ElectricityUsageService {
    @Autowired
    private ElectricityUsageMapper electricityUsageMapper;

    @Autowired
    private ConsInfoMapper consInfoMapper;

    @Autowired
    private ConsEventMapper consEventMapper;

    /**
     * 每5分钟定时刷新用户的电费余额和电能使用量同时记录到电能使用情况表中
     */
    @Override
    public void chargeFlush() {
        //查询到所有用户
        List<ConsInfo> allConsInfo = consInfoMapper.getAllConsInfo();

        // 创建 ThreadPoolExecutor
        ThreadPoolExecutor executor = new ThreadPoolExecutor(
                4,
                8,
                60L,
                TimeUnit.SECONDS,
                new LinkedBlockingQueue<>(512),
                Executors.defaultThreadFactory(),
                new ThreadPoolExecutor.AbortPolicy()
        );

        for (ConsInfo consInfo : allConsInfo) {
            executor.execute(() ->
                    //模拟每个用户电能消耗
                    CommonTranslations(consInfo)
            ) ;
        }
        // 关闭线程池
        executor.shutdown();
        try {
            if (!executor.awaitTermination(60, TimeUnit.SECONDS)) {
                executor.shutdownNow();
            }
        } catch (InterruptedException e) {
            executor.shutdownNow();
            Thread.currentThread().interrupt();
        }
    }

    //模拟每个用户电能消耗
    @Transactional
    public void CommonTranslations(ConsInfo consInfo) {
        //1.虚拟生成0.1~0.5的电能损耗及计算使用电费
        Random random = new Random();
        double value = 0.1 + (0.5 - 0.1) * random.nextDouble();
        double value2 = value * 0.6; //默认0.6元/度电
        BigDecimal bd = new BigDecimal(value).setScale(2, RoundingMode.HALF_UP);
        BigDecimal bd2 = new BigDecimal(value2).setScale(2, RoundingMode.HALF_UP);
        double electricityUsed = bd.doubleValue(); //损耗电能
        double chargeUsed = bd2.doubleValue(); //使用电费

        //设置使用电能和电费
        consInfo.setTotalConsumption(consInfo.getTotalConsumption() + electricityUsed);
        consInfo.setBalance(consInfo.getBalance() - chargeUsed);

        //2.修改用户电能使用情况和电费余额
        consInfoMapper.updateConsChargeAndElectricity(consInfo);

        // 获取当前日期
        Date currentDate = new Date();

        //3.电费如果小于-10元生成用户停电事件
        if (consInfo.getBalance() <= -10){
            ConsEvent consEvent = new ConsEvent();
            consEvent.setEventId(UUIDUtil.getUUID());
            consEvent.setConsNo(consInfo.getConsNo());
            consEvent.setConsName(consInfo.getConsName());
            consEvent.setPowerOutageTime(currentDate);
            consEvent.setPowerOutageType(4);
            consEvent.setStatus(1);
            consEvent.setReason("用户"+consInfo.getConsName()+"目前已欠费超过10元，系统自动给予该用户断电处理！！！");
            consEvent.setCompany(consInfo.getCompany());
            consEvent.setCreateTime(currentDate);
            consEvent.setCreateBy("系统创建");
            //生成事件
            consEventMapper.addConsEvent(consEvent);
        }

        //4.生成电能使用情况记录
        ElectricityUsage electricityUsage = new ElectricityUsage();
        electricityUsage.setId(UUIDUtil.getUUID());
        electricityUsage.setConsNo(consInfo.getConsNo());
        electricityUsage.setConsName(consInfo.getConsName());
        electricityUsage.setRecordTime(currentDate);
        electricityUsage.setUsedEnergy(consInfo.getTotalConsumption());
        electricityUsage.setRemainingBalance(consInfo.getBalance());
        electricityUsage.setCompany(consInfo.getCompany());
        //生成记录
        electricityUsageMapper.addElectricityUsage(electricityUsage);
    }
}
