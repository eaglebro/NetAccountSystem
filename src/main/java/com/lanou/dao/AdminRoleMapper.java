package com.lanou.dao;

import com.lanou.bean.AdminRole;

/**
 * Created by Nero on 18/7/26.
 */
public interface AdminRoleMapper {
    void insert(AdminRole adminRole);

    void deleteByAdmin_id(String admin_id);
}
