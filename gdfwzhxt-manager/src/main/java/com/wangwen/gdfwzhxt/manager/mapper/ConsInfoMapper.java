package com.wangwen.gdfwzhxt.manager.mapper;

import com.wangwen.gdfwzhxt.model.dto.cons.ConsInfoDto;
import com.wangwen.gdfwzhxt.model.entity.cons.ConsInfo;
import com.wangwen.gdfwzhxt.model.entity.cons.RechargeRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface ConsInfoMapper {
    //条件查询用户信息列表
    List<ConsInfo> getConsInfoListByCondition(ConsInfoDto consInfoDto);

    //根据户号查询数量
    int getConsInfoCountByConsNo(String consNo);

    //添加用户
    void addConsInfo(ConsInfo consInfo);

    //修改用户
    void updateConsInfo(ConsInfo consInfo);

    //根据id删除用户
    @Update("update t_cons_info set is_deleted = 1 where id = #{param1}")
    void deleteConsInfoById(String id);

    //根据用户编号查询用户信息
    ConsInfo getConsInfoByConsNo(String consNo);

    //修改用户电费
    void updateRecharge(RechargeRecord rechargeRecord);

    //查询所有用户信息
    List<ConsInfo> getAllConsInfo();

    //修改用户电能使用情况和电费余额
    void updateConsChargeAndElectricity(ConsInfo consInfo);

    //根据用户编号查询用户账户余额
    @Select("select balance from t_cons_info where cons_no = #{param1}")
    double getPriChargeByConsNo(String consNo);
}
