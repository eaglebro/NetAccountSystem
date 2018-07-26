package com.lanou.dao;

import com.lanou.bean.ModuleInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Nero on 18/7/24.
 */
@Repository
public interface ModuleMapper {
    List<ModuleInfo> findAllModule();
}
