package com.dai.entity;

/**
 * 收藏信息
 * @author hero 2018/12/29
 */
public class MyFavor {

    /**
     * 关联账号
     */
    private String userAccount;
    /**
     * 关联旅馆
     */
    private int hotelId;

    public MyFavor() {
    }

    public MyFavor(String useraccount, int hotelId) {
        this.userAccount = useraccount;
        this.hotelId = hotelId;
    }

    public String getUseraccount() {
        return userAccount;
    }

    public void setUseraccount(String useraccount) {
        this.userAccount = useraccount;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }
}
