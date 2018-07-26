package com.lanou.bean;

import java.util.List;

/**
 * Created by Nero on 18/7/26.
 */

public class AdminListVO {
    private String admin_id, real_name, username, telephone, email, create_time;
    private List<RoleInfo> roleInfo;

    @Override
    public String toString() {
        return "AdminListVO{" +
                "admin_id='" + admin_id + '\'' +
                ", real_name='" + real_name + '\'' +
                ", username='" + username + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", create_time='" + create_time + '\'' +
                ", roleInfo=" + roleInfo +
                '}';
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public List<RoleInfo> getRoleInfo() {
        return roleInfo;
    }

    public void setRoleInfo(List<RoleInfo> roleInfo) {
        this.roleInfo = roleInfo;
    }
}
