package com.lanou.bean;

/**
 * Created by Nero on 18/7/24.
 */
public class ServiceModifyVO extends ServiceVO {
    public String cost_id;

    @Override
    public String toString() {
        return "ServiceModifyVO{" +
                "cost_id='" + cost_id + '\'' +
                "} " + super.toString();
    }

    public String getCost_id() {
        return cost_id;
    }

    public void setCost_id(String cost_id) {
        this.cost_id = cost_id;
    }
}
