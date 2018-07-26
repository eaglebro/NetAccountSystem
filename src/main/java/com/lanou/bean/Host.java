package com.lanou.bean;

/**
 * Created by Nero on 18/7/23.
 */
public class Host {
    private String host_id, name, location;

    @Override
    public String toString() {
        return "Host{" +
                "host_id='" + host_id + '\'' +
                ", name='" + name + '\'' +
                ", location='" + location + '\'' +
                '}';
    }

    public String getHost_id() {
        return host_id;
    }

    public void setHost_id(String host_id) {
        this.host_id = host_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
