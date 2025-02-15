package com.wangwen.gdfwzhxt.manager.util;

import com.wangwen.gdfwzhxt.model.entity.line.LineInfo;

import java.util.ArrayList;
import java.util.List;

//封装树形线路信息数据
public class LineInfoHelper {
    //递归实现封装过程
    public static List<LineInfo> buildTree(List<LineInfo> lineInfos){
        //创建集合用于封装最终需要新式的数据
        List<LineInfo> trees = new ArrayList<>();

        //遍历所有菜单集合
        for (LineInfo lineInfo : lineInfos){
            //找到递归操作的入口，第一层菜单
            if ("0".equals(lineInfo.getMainLine())){
                trees.add(findChildren(lineInfo, lineInfos));
            }
        }

        return trees;
    }

    //递归查找下层单位
    private static LineInfo findChildren(LineInfo lineInfo, List<LineInfo> lineInfos) {
        //初始化children
        lineInfo.setChildren(new ArrayList<>());

        //递归查询
        for (LineInfo item : lineInfos){
            if (lineInfo.getId().equals(item.getMainLine())){
                lineInfo.getChildren().add(findChildren(item, lineInfos));
            }
        }

        return lineInfo;
    }
}
