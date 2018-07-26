package com.lanou.bean;

/**
 * Created by Nero on 18/7/24.
 */
public class RoleModule {
    private String role_id, module_id;

    @Override
    public String toString() {
        return "RoleModule{" +
                "role_id='" + role_id + '\'' +
                ", module_id='" + module_id + '\'' +
                '}';
    }

    public String getRole_id() {
        return role_id;
    }

    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }

    public String getModule_id() {
        return module_id;
    }

    public void setModule_id(String module_id) {
        this.module_id = module_id;
    }
}
