package com.lanou.service.impl;

import com.lanou.bean.ModuleInfo;
import com.lanou.dao.ModuleMapper;
import com.lanou.service.IModuleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nero on 18/7/24.
 */
@Service
public class ModuleServiceImpl implements IModuleService {
    @Resource
    ModuleMapper mapper;

    @Override
    public List<ModuleInfo> findAllModule() {
        return mapper.findAllModule();
    }
}
