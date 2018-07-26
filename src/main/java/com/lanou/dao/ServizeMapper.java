package com.lanou.dao;

import com.lanou.bean.ServiceModifyVO;
import com.lanou.bean.ServicePO;
import com.lanou.bean.ServiceVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Nero on 18/7/21.
 */
@Repository
public interface ServizeMapper {
    List<ServiceVO> findAllServiceVO();
    void insertServicePO(ServicePO servicePO);
    List<ServiceVO> criteriaQuery(ServiceVO serviceVO);
    void setStatusById(@Param("service_id") int service_id, @Param("status") String status);

    ServiceVO findServiceById(String service_id);
    void updateCostById(ServiceModifyVO serviceModifyVO);
}
