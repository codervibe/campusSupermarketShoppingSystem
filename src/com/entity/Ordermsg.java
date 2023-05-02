package com.entity;

import java.io.Serializable;
import java.util.*;

public class Ordermsg implements Serializable {
    private int id;
    private String orderno;
    private int memberid;
    private String total;
    private String fkstatus;
    private String shstatus;
    private int addrid;
    private String savetime;
    private String company;
    private String waybillno;
    private String shfs;
    private String shsavetime;

    private Member member;
    private Address address;

    private String distributorinfo;

    public String getDistributorinfo() {
        return distributorinfo;
    }

    public void setDistributorinfo(String distributorinfo) {
        this.distributorinfo = distributorinfo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno;
    }

    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getFkstatus() {
        return fkstatus;
    }

    public void setFkstatus(String fkstatus) {
        this.fkstatus = fkstatus;
    }

    public String getShstatus() {
        return shstatus;
    }

    public void setShstatus(String shstatus) {
        this.shstatus = shstatus;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public String getSavetime() {
        return savetime;
    }

    public int getAddrid() {
        return addrid;
    }

    public void setAddrid(int addrid) {
        this.addrid = addrid;
    }

    public void setSavetime(String savetime) {
        this.savetime = savetime;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getWaybillno() {
        return waybillno;
    }

    public void setWaybillno(String waybillno) {
        this.waybillno = waybillno;
    }

    public String getShfs() {
        return shfs;
    }

    public void setShfs(String shfs) {
        this.shfs = shfs;
    }

    public String getShsavetime() {
        return shsavetime;
    }

    public void setShsavetime(String shsavetime) {
        this.shsavetime = shsavetime;
    }


}
