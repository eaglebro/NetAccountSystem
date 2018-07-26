package com.lanou.service;

import com.lanou.bean.AdminListVO;

import java.util.List;

/**
 * Created by Nero on 18/7/26.
 */
public interface IAdminService {
    List<AdminListVO> findAllAdminListVO();
}
