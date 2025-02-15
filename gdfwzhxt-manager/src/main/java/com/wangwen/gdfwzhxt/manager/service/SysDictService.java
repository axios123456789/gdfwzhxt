package com.wangwen.gdfwzhxt.manager.service;

import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.model.dto.system.SysDictDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysDict;

import java.util.List;
import java.util.Map;

public interface SysDictService {
    /**
     * 通过类型获取下拉列表等键和值
     * @param type
     * @return
     */
    List<Map<String, Object>> getKeyAndValueByType(String type);

    /**
     * 根据当前账号的权限查询对应的账号等级
     * @param type
     * @return
     */
    List<Map<String, Object>> getUserLevelByPower(String type);

    /**
     * 条件分页查询数据字典
     * @param current
     * @param limit
     * @param sysDictDto
     * @return
     */
    PageInfo<SysDict> getSysDictList(Integer current, Integer limit, SysDictDto sysDictDto);

    /**
     * 添加或修改数据字典
     * @param sysDict
     */
    void saveDict(SysDict sysDict);

    /**
     * 根据id删除数据字典
     * @param id
     */
    void deleteDictById(String id);
}
