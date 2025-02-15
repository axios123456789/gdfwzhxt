package com.wangwen.gdfwzhxt.manager.util;

import com.wangwen.gdfwzhxt.model.entity.source.Unit;

import java.util.ArrayList;
import java.util.List;

//封装树形单位数据
public class UnitHelper {
    //递归实现封装过程
    public static List<Unit> buildTree(List<Unit> units){
        //创建集合用于封装最终需要新式的数据
        List<Unit> trees = new ArrayList<>();

        //遍历所有菜单集合
        for (Unit unit : units){
            //找到递归操作的入口，第一层菜单
            if ("0".equals(unit.getParentUnitId())){
                trees.add(findChildren(unit, units));
            }
        }

        return trees;
    }

    //递归查找下层单位
    private static Unit findChildren(Unit unit, List<Unit> units) {
        //初始化children
        unit.setChildren(new ArrayList<>());

        //递归查询
        for (Unit item : units){
            if (unit.getUnitId().equals(item.getParentUnitId())){
                unit.getChildren().add(findChildren(item, units));
            }
        }

        return unit;
    }
}
