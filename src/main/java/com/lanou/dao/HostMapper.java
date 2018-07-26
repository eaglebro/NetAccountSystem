package com.lanou.dao;

import com.lanou.bean.Host;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Nero on 18/7/23.
 */
@Repository
public interface HostMapper {
    List<Host> findAllHost();
}
