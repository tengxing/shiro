/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.teng.member.entity;

import java.util.Date;

/**
 *
 * @author tengxing
 */
public class Sign {
    private Integer id;
    private Date signDate;
    private Long signDay;
    private String signer;
    private String ipAddress;
    private Integer status;

    public Sign() {
    }

    public Sign(Integer id, Date signDate, Long signDay, String signer, String ipAddress, Integer status) {
        this.id = id;
        this.signDate = signDate;
        this.signDay = signDay;
        this.signer = signer;
        this.ipAddress = ipAddress;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getSignDate() {
        return signDate;
    }

    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }

    public Long getSignDay() {
        return signDay;
    }

    public void setSignDay(Long signDay) {
        this.signDay = signDay;
    }

    public String getSigner() {
        return signer;
    }

    public void setSigner(String signer) {
        this.signer = signer;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    
    
}
