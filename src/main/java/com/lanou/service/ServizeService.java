package com.lanou.service;

import com.github.pagehelper.PageInfo;
import com.lanou.bean.ServiceModifyVO;
import com.lanou.bean.ServicePO;
import com.lanou.bean.ServiceVO;
import com.lanou.dao.ServizeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nero on 18/7/21.
 */
public interface ServizeService {
    List<ServiceVO> findAllServiceVO();
    PageInfo<ServiceVO> findAllServiceVOByPage(int pageNum);
    void insertService(ServicePO servicePO);
    PageInfo<ServiceVO> criteriaQueryByPage(ServiceVO serviceVO, int pageNum);

    void setStatusById(int service_id, String status);

    ServiceVO findServiceById(String service_id);

    void updateCostById(ServiceModifyVO serviceModifyVO);
}
