package com.lanou.dao;

import com.lanou.bean.RoleModule;
import org.springframework.stereotype.Repository;

/**
 * Created by Nero on 18/7/24.
 */
@Repository
public interface RoleModuleMapper {
    void insertRoleModule(RoleModule roleModule);
    void deleteByRole_id(String role_id);
}
