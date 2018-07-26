package com.lanou.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanou.bean.ServiceModifyVO;
import com.lanou.bean.ServicePO;
import com.lanou.bean.ServiceVO;
import com.lanou.dao.ServizeMapper;
import com.lanou.service.ServizeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nero on 18/7/21.
 */
@Service("service")
public class ServizeServiceImpl implements ServizeService {
    @Resource
    ServizeMapper mapper;

    @Override
    public List<ServiceVO> findAllServiceVO() {
        return mapper.findAllServiceVO();
    }

    @Override
    public PageInfo<ServiceVO> findAllServiceVOByPage(int pageNum) {
        PageHelper.startPage(pageNum, 5);
        List<ServiceVO> list = mapper.findAllServiceVO();
        PageInfo<ServiceVO> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void insertService(ServicePO servicePO) {
        servicePO.setCreate_date(TimeUtil.getCurrentTime());
        servicePO.setStatus("1");
        mapper.insertServicePO(servicePO);
    }

    @Override
    public PageInfo<ServiceVO> criteriaQueryByPage(ServiceVO serviceVO, int pageNum) {
        PageHelper.startPage(pageNum, 5);
        List<ServiceVO> list = mapper.criteriaQuery(serviceVO);
        PageInfo<ServiceVO> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void setStatusById(int service_id, String status) {
        mapper.setStatusById(service_id, status);
    }

    @Override
    public ServiceVO findServiceById(String service_id) {
        return mapper.findServiceById(service_id);
    }

    @Override
    public void updateCostById(ServiceModifyVO serviceModifyVO) {
        mapper.updateCostById(serviceModifyVO);
    }
}
