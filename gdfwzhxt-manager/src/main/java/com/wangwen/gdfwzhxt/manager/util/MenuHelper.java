package com.wangwen.gdfwzhxt.manager.util;

import com.wangwen.gdfwzhxt.model.entity.system.SysMenu;

import java.util.ArrayList;
import java.util.List;

//封装树形菜单数据
public class MenuHelper {
    //递归实现封装过程
    public static List<SysMenu> buildTree(List<SysMenu> sysMenus){
        //创建集合用于封装最终需要新式的数据
        List<SysMenu> trees = new ArrayList<>();

        //遍历所有菜单集合
        for (SysMenu sysMenu : sysMenus){
            //找到递归操作的入口，第一层菜单
            if ("0".equals(sysMenu.getParentId())){
                trees.add(findChildren(sysMenu, sysMenus));
            }
        }

        return trees;
    }

    //递归查找下层菜单
    private static SysMenu findChildren(SysMenu sysMenu, List<SysMenu> sysMenus) {
        //初始化children
        sysMenu.setChildren(new ArrayList<>());

        //递归查询
        for (SysMenu item : sysMenus){
            if (sysMenu.getId().equals(item.getParentId())){
                sysMenu.getChildren().add(findChildren(item, sysMenus));
            }
        }

        return sysMenu;
    }
}
