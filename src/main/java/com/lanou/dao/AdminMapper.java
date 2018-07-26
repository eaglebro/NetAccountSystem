package com.lanou.dao;

import com.lanou.bean.Admin;
import com.lanou.bean.AdminListVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Nero on 18/7/26.
 */
@Repository
public interface AdminMapper {
    void insertAdmin(Admin admin);
    void deleteByAdminId(String admin_id);
    List<AdminListVO> findAllAdminListVO();
}