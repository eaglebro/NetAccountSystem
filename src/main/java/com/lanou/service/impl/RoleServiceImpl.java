package com.lanou.service.impl;

import com.lanou.bean.AddRoleVO;
import com.lanou.bean.RoleInfo;
import com.lanou.bean.RoleModule;
import com.lanou.bean.RoleVO;
import com.lanou.dao.RoleMapper;
import com.lanou.dao.RoleModuleMapper;
import com.lanou.service.IRoleService;
import com.lanou.service.exception.RoleException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nero on 18/7/24.
 */
@Service("roleService")
public class RoleServiceImpl implements IRoleService {

    @Resource
    RoleMapper roleMapper;

    @Resource
    RoleModuleMapper roleModuleMapper;

    @Override
    public List<RoleVO> findAllRoleVO() {
        return roleMapper.findAllRoleVO();
    }

    @Override
    public void addRole(AddRoleVO addRoleVO) throws RoleException {
        RoleInfo found = roleMapper.findByName(addRoleVO.getName());
        if (found != null) {
            throw new RoleException("角色名称已存在");
        } else {
            RoleInfo roleInfo = new RoleInfo();
            roleInfo.setName(addRoleVO.getName());
            roleMapper.insertRole(roleInfo);

            found = roleMapper.findByName(addRoleVO.getName());
            String role_id = found.getRole_id();

            for (String module_id : addRoleVO.getModule_id()) {
                RoleModule rm = new RoleModule();
                rm.setModule_id(module_id);
                rm.setRole_id(role_id);
                roleModuleMapper.insertRoleModule(rm);
            }
        }
    }

    @Override
    public RoleVO findRoleVOById(String role_id) {
        return roleMapper.findRoleVOById(role_id);
    }

    @Override
    public List<RoleInfo> findAllRoleInfo() {
        return roleMapper.findAllRoleInfo();
    }

    @Override
    public void modifyRole(AddRoleVO addRoleVO) throws RoleException {
        String role_id = addRoleVO.getRole_id();
        RoleInfo foundByName = roleMapper.findByName(addRoleVO.getName());
//        RoleInfo foundById = roleMapper.findById(addRoleVO.getRole_id());
        if (foundByName != null && !foundByName.getRole_id().equals(role_id)) {
            throw new RoleException("角色名称已存在");
        } else {
            // 改角色名称
            roleMapper.updateNameById(addRoleVO.getName(), role_id);
            // 先删再加
            roleModuleMapper.deleteByRole_id(role_id);
            // 加
            for (String module_id : addRoleVO.getModule_id()) {
                // 前台传过来的值有0 把0剔除
                if (!module_id.equals("0")) {
                    RoleModule rm = new RoleModule();
                    rm.setModule_id(module_id);
                    rm.setRole_id(role_id);
                    roleModuleMapper.insertRoleModule(rm);
                }
            }
        }
    }
}