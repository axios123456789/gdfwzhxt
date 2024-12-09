package com.wangwen.gdfwzhxt.manager.service;

import java.util.List;
import java.util.Map;

public interface SysDictService {
    /**
     * 通过类型获取下拉列表等键和值
     * @param type
     * @return
     */
    List<Map<String, Object>> getKeyAndValueByType(String type);
}
