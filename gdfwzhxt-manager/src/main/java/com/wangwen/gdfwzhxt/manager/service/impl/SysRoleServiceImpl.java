package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.SysRoleMapper;
import com.wangwen.gdfwzhxt.manager.service.SysRoleService;
import com.wangwen.gdfwzhxt.model.dto.system.SysRoleDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysRoleServiceImpl implements SysRoleService {
    @Autowired
    private SysRoleMapper sysRoleMapper;

    /**
     * 角色列表的方法
     * @param sysRoleDto
     * @param current
     * @param limit
     * @return
     */
    @Override
    public PageInfo<SysRole> findByPage(SysRoleDto sysRoleDto, Integer current, Integer limit) {
        //设置分页参数
        PageHelper.startPage(current, limit);

        //根据条件查询所有数据
        List<SysRole> list = sysRoleMapper.findByPage(sysRoleDto);

        //封装pageInfo对象
        PageInfo<SysRole> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }

    /**
     * 添加或修改角色
     * @param sysRole
     */
    @Override
    public void saveRole(SysRole sysRole) {
        //拿到company
        String company = AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany();

        if (sysRole.getId() == null || sysRole.getId() == ""){//添加
            sysRole.setId(UUIDUtil.getUUID());
            sysRole.setCompany(company);

            //添加
            sysRoleMapper.addRole(sysRole);
            return;
        }
        //修改
        sysRoleMapper.updateRole(sysRole);
    }

    /**
     * 通过ID删除角色
     * @param id
     */
    @Override
    public void deleteRoleById(String id) {
        sysRoleMapper.deleteRoleById(id);
    }
}
