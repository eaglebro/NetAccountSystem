package com.lanou.bean;

import java.util.List;

/**
 * Created by Nero on 18/7/24.
 */
public class AddRoleVO {
    private String name;
    private String role_id;
    private List<String> module_id;

    @Override
    public String toString() {
        return "AddRoleVO{" +
                "name='" + name + '\'' +
                ", role_id='" + role_id + '\'' +
                ", module_id=" + module_id +
                '}';
    }

    public String getRole_id() {
        return role_id;
    }

    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getModule_id() {
        return module_id;
    }

    public void setModule_id(List<String> module_id) {
        this.module_id = module_id;
    }
}
