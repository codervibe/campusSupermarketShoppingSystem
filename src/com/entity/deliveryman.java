package com.entity;

import java.io.Serializable;

/**
 * @author Administrator
 */
public class deliveryman implements Serializable {
    private String orderno;
    private User user;

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "deliveryman{" +
                "orderno='" + orderno + '\'' +
                ", user=" + user +
                '}';
    }

    public deliveryman() {
    }

    public deliveryman(String orderno, User user) {
        this.orderno = orderno;
        this.user = user;
    }
}
