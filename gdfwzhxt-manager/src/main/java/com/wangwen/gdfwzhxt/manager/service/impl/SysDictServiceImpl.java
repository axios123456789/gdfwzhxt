package com.wangwen.gdfwzhxt.manager.service.impl;

import com.wangwen.gdfwzhxt.manager.mapper.SysDictMapper;
import com.wangwen.gdfwzhxt.manager.service.SysDictService;
import com.wangwen.gdfwzhxt.model.entity.system.SysCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SysDictServiceImpl implements SysDictService {
    @Autowired
    private SysDictMapper sysDictMapper;

    /**
     * 通过类型获取下拉列表等键和值
     * @param type
     * @return
     */
    @Override
    public List<Map<String, Object>> getKeyAndValueByType(String type) {
        //根据type查询所有
        List<SysCode> list = sysDictMapper.getCodesByType(type);

        //封装返回数据
        List<Map<String, Object>> items = new ArrayList<>();

        //处理数据返回
        for (SysCode sysCode : list){
            //创建map对象，封装返回值
            Map<String, Object> map = new HashMap<>();
            map.put("value", sysCode.getCode());
            map.put("text", sysCode.getValue());
            items.add(map);
        }

        return items;
    }
}
