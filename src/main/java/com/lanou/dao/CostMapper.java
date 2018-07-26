package com.lanou.dao;

import com.lanou.bean.Cost;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Nero on 18/7/16.
 */
@Repository("aa")
public interface CostMapper {
    void insertCost(Cost cost);
    List<Cost> findAllCost();
    void deleteById(String id);
    Cost findById(String id);
    void modifyById(Cost cost);
    Cost findByName(Cost cost);
    void updateStatus(@Param("cost") Cost cost, @Param("status") String status);
}
