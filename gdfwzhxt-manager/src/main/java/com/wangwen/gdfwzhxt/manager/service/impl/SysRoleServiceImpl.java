package com.wangwen.gdfwzhxt.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangwen.gdfwzhxt.common_util.AuthContextUtil;
import com.wangwen.gdfwzhxt.common_util.UUIDUtil;
import com.wangwen.gdfwzhxt.manager.mapper.SysRoleAndMenuRelationMapper;
import com.wangwen.gdfwzhxt.manager.mapper.SysRoleMapper;
import com.wangwen.gdfwzhxt.manager.mapper.SysUserAndRoleRelationMapper;
import com.wangwen.gdfwzhxt.manager.service.SysRoleService;
import com.wangwen.gdfwzhxt.model.dto.system.DistributeMenuDto;
import com.wangwen.gdfwzhxt.model.dto.system.SysRoleDto;
import com.wangwen.gdfwzhxt.model.entity.system.SysRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SysRoleServiceImpl implements SysRoleService {
    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    SysUserAndRoleRelationMapper sysUserAndRoleRelationMapper;

    @Autowired
    private SysRoleAndMenuRelationMapper sysRoleAndMenuRelationMapper;

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
            sysRole.setCreateBy(AuthContextUtil.get().getName());

            //添加
            sysRoleMapper.addRole(sysRole);
            return;
        }
        //修改
        sysRole.setUpdateBy(AuthContextUtil.get().getName());
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

    /**
     * 获取所有角色和用户已经分配的角色
     * @param userId
     * @return
     */
    @Override
    public Map<String, Object> getAllRoles(String userId) {
        //获取所有角色
        List<SysRole> sysRoleList = sysRoleMapper.getAllRoles();

        //获取该用户已经分配的角色
        List<String> ids = sysUserAndRoleRelationMapper.getRoleIdsByUserId(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("allRoleList", sysRoleList);
        map.put("sysUserRoles", ids);

        return map;
    }

    /**
     * 保存角色分配菜单数据
     * @param distributeMenuDto
     */
    @Override
    @Transactional
    public void allocateMenus(DistributeMenuDto distributeMenuDto) {
        //删除角色分配过的菜单数据
        sysRoleAndMenuRelationMapper.deleteHaveAllocateMenuDataByRoleId(distributeMenuDto.getRoleId());

        //保存分配数据
        List<Map<String, Object>> menuIdList = distributeMenuDto.getMenuIdList();
        for (int i = 0; i < menuIdList.size(); i++){
            distributeMenuDto.getMenuIdList().get(i).put("zjId", UUIDUtil.getUUID());
        }

        distributeMenuDto.setCompany(AuthContextUtil.get().getLevel() == 1 ? AuthContextUtil.get().getId() : AuthContextUtil.get().getCompany());
        if (menuIdList != null && menuIdList.size() > 0){
            sysRoleAndMenuRelationMapper.addAllocateData(distributeMenuDto);
        }
    }
}
