package com.lanou.bean;

/**
 * Created by Nero on 18/7/21.
 */
public class ServiceVO {
    private String service_id, account_id, idcard_no, real_name, os_username, status, unix_host, name, descr;

    @Override
    public String toString() {
        return "ServiceVO{" +
                "service_id='" + service_id + '\'' +
                ", account_id='" + account_id + '\'' +
                ", idcard_no='" + idcard_no + '\'' +
                ", real_name='" + real_name + '\'' +
                ", os_username='" + os_username + '\'' +
                ", status='" + status + '\'' +
                ", unix_host='" + unix_host + '\'' +
                ", name='" + name + '\'' +
                ", descr='" + descr + '\'' +
                '}';
    }

    public String getService_id() {
        return service_id;
    }

    public void setService_id(String service_id) {
        this.service_id = service_id;
    }

    public String getAccount_id() {
        return account_id;
    }

    public void setAccount_id(String account_id) {
        this.account_id = account_id;
    }

    public String getIdcard_no() {
        return idcard_no;
    }

    public void setIdcard_no(String idcard_no) {
        this.idcard_no = idcard_no;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }

    public String getOs_username() {
        return os_username;
    }

    public void setOs_username(String os_username) {
        this.os_username = os_username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUnix_host() {
        return unix_host;
    }

    public void setUnix_host(String unix_host) {
        this.unix_host = unix_host;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }
}
