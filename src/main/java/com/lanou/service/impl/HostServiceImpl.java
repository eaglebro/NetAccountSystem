package com.lanou.service.impl;

import com.lanou.bean.Host;
import com.lanou.dao.HostMapper;
import com.lanou.service.HostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nero on 18/7/23.
 */
@Service
public class HostServiceImpl implements HostService {
    @Resource
    HostMapper mapper;

    @Override
    public List<Host> findAllHost() {
        return mapper.findAllHost();
    }
}
