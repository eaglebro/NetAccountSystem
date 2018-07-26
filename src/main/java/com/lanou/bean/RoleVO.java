package com.lanou.bean;

import java.util.List;

/**
 * Created by Nero on 18/7/24.
 */
public class RoleVO extends RoleInfo {
    private List<ModuleInfo> moduleInfoList;

    @Override
    public String toString() {
        return "RoleVO{" +
                "moduleInfoList=" + moduleInfoList +
                "} " + super.toString();
    }

    public List<ModuleInfo> getModuleInfoList() {
        return moduleInfoList;
    }

    public void setModuleInfoList(List<ModuleInfo> moduleInfoList) {
        this.moduleInfoList = moduleInfoList;
    }
}
