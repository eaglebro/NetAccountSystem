package com.lanou.service.impl;

import com.lanou.bean.AdminListVO;
import com.lanou.dao.AdminMapper;
import com.lanou.service.IAdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nero on 18/7/26.
 */
@Service
public class AdminServiceImpl implements IAdminService {
    @Resource
    AdminMapper adminMapper;

    @Override
    public List<AdminListVO> findAllAdminListVO() {
        return adminMapper.findAllAdminListVO();
    }
}
