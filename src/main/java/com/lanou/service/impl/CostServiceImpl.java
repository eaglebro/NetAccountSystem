package com.lanou.service.impl;

import com.lanou.bean.Cost;
import com.lanou.dao.CostMapper;
import com.lanou.service.CostService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Nero on 18/7/16.
 */
@Service("qq")
public class CostServiceImpl implements CostService {

    @Autowired
    @Qualifier("aa")
    private CostMapper mapper;


    @Override
    public List<Cost> findAllCost() {
        return mapper.findAllCost();
    }

    @Override
    public void insertCost(Cost cost) throws CostServiceException {
        Cost found = mapper.findByName(cost);
        if (found == null) {
            cost.setCreatime(TimeUtil.getCurrentTime());
            mapper.insertCost(cost);
        }else {
            throw new CostServiceException("资费名称已存在");
        }
    }

    @Override
    public void deleteById(String id) {
        mapper.deleteById(id);
    }

    @Override
    public Cost findById(String id) {
        return mapper.findById(id);
    }

    @Override
    public void modifyById(Cost cost) throws CostServiceException {
        Cost found = mapper.findByName(cost);
        if (found == null || found.getCost_id().equals(cost.getCost_id())) {
            mapper.modifyById(cost);
        } else {
            throw new CostServiceException("资费名称已存在");
        }
    }

    @Override
    public Cost findByName(Cost cost) {
        return mapper.findByName(cost);
    }
}
