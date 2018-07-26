package com.lanou.service;

import com.lanou.bean.ModuleInfo;

import java.util.List;

/**
 * Created by Nero on 18/7/24.
 */
public interface IModuleService {
    List<ModuleInfo> findAllModule();
}
