package com.lanou.service;

import com.lanou.bean.Cost;
import com.lanou.service.impl.CostServiceException;

import java.util.List;

/**
 * Created by Nero on 18/7/16.
 */
public interface CostService {
    List<Cost> findAllCost();
    void insertCost(Cost cost) throws CostServiceException;
    void deleteById(String id);
    Cost findById(String id);
    void modifyById(Cost cost) throws CostServiceException;
    Cost findByName(Cost cost);
}
