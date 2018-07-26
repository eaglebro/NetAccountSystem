package com.lanou.bean;

/**
 * Created by Nero on 18/7/24.
 */
public class RoleInfo {
    private String role_id, name;

    @Override
    public String toString() {
        return "RoleInfo{" +
                "role_id='" + role_id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole_id() {
        return role_id;
    }

    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }
}
