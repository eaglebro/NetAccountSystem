package com.lanou.service;

import com.lanou.bean.AddRoleVO;
import com.lanou.bean.RoleInfo;
import com.lanou.bean.RoleVO;
import com.lanou.service.exception.RoleException;

import java.util.List;

/**
 * Created by Nero on 18/7/24.
 */
public interface IRoleService {
    List<RoleVO> findAllRoleVO();
    void addRole(AddRoleVO addRoleVO) throws RoleException;

    RoleVO findRoleVOById(String role_id);

    List<RoleInfo> findAllRoleInfo();

    void modifyRole(AddRoleVO addRoleVO) throws RoleException;
}
