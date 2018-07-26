package com.lanou.bean;

/**
 * Created by Nero on 18/7/26.
 */
public class AdminRole {
    private String admin_id, role_id;

    @Override
    public String toString() {
        return "AdminRole{" +
                "admin_id='" + admin_id + '\'' +
                ", role_id='" + role_id + '\'' +
                '}';
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getRole_id() {
        return role_id;
    }

    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }
}
