package com.lanou.bean;

/**
 * Created by Nero on 18/7/24.
 */
public class ModuleInfo {
    private String module_id, name;

    @Override
    public String toString() {
        return "ModuleInfo{" +
                "module_id='" + module_id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModule_id() {
        return module_id;
    }

    public void setModule_id(String module_id) {
        this.module_id = module_id;
    }
}
