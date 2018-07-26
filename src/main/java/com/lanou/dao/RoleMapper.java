package com.lanou.dao;

import com.lanou.bean.RoleInfo;
import com.lanou.bean.RoleVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Nero on 18/7/24.
 */
@Repository
public interface RoleMapper {
    List<RoleVO> findAllRoleVO();
    void insertRole(RoleInfo roleInfo);
    RoleInfo findById(String role_id);
    RoleInfo findByName(String name);

    RoleVO findRoleVOById(String role_id);
    List<RoleInfo> findAllRoleInfo();

    void updateNameById(@Param("name") String name, @Param("role_id") String role_id);
}
