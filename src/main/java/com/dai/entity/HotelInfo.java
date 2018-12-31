package com.dai.entity;

/**
 *
 * 房间信息
 * @author hero 2018/12/29
 */
public class HotelInfo {

    /**
     * 房东姓名
     */
    private String ownerName;
    /**
     * 房东手机号
     */
    private String ownerPhone;
    /**
     * 房间编号
     */
    private int hotelId;
    /**
     * 房间实图
     */
    private String hotelImage;
    /**
     * 所在省份
     */
    private String hotelProvince;
    /**
     * 所在城市
     */
    private String hotelCity;
    /**
     * 被收藏数
     */
    private int favorNum;
    /**
     * 价格
     */
    private double hotelPrice;
    /**
     * 详细地址
     */
    private String hotelAddress;

    public HotelInfo() {
    }

    public HotelInfo(String ownername, String ownerphone, int hotelId, String hotelImage, String hotelProvince, String hotelCity, int favorNum, double hotelPrice, String hotelAddress) {
        this.ownerName = ownername;
        this.ownerPhone = ownerphone;
        this.hotelId = hotelId;
        this.hotelImage = hotelImage;
        this.hotelProvince = hotelProvince;
        this.hotelCity = hotelCity;
        this.favorNum = favorNum;
        this.hotelPrice = hotelPrice;
        this.hotelAddress = hotelAddress;
    }

    public HotelInfo(String ownerName, String ownerPhone, String hotelImage, String hotelProvince, String hotelCity, double hotelPrice, String hotelAddress) {
        this.ownerName = ownerName;
        this.ownerPhone = ownerPhone;
        this.hotelImage = hotelImage;
        this.hotelProvince = hotelProvince;
        this.hotelCity = hotelCity;
        this.hotelPrice = hotelPrice;
        this.hotelAddress = hotelAddress;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownername) {
        this.ownerName = ownername;
    }

    public String getOwnerPhone() {
        return ownerPhone;
    }

    public void setOwnerPhone(String ownerphone) {
        this.ownerPhone = ownerphone;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getHotelImage() {
        return hotelImage;
    }

    public void setHotelImage(String hotelImage) {
        this.hotelImage = hotelImage;
    }

    public String getHotelProvince() {
        return hotelProvince;
    }

    public void setHotelProvince(String hotelProvince) {
        this.hotelProvince = hotelProvince;
    }

    public String getHotelCity() {
        return hotelCity;
    }

    public void setHotelCity(String hotelCity) {
        this.hotelCity = hotelCity;
    }

    public int getFavorNum() {
        return favorNum;
    }

    public void setFavorNum(int favorNum) {
        this.favorNum = favorNum;
    }

    public double getHotelPrice() {
        return hotelPrice;
    }

    public void setHotelPrice(double hotelPrice) {
        this.hotelPrice = hotelPrice;
    }

    public String getHotelAddress() {
        return hotelAddress;
    }

    public void setHotelAddress(String hotelAddress) {
        this.hotelAddress = hotelAddress;
    }

    @Override
    public String toString() {
        return "HotelInfo{" +
                "ownerName='" + ownerName + '\'' +
                ", ownerPhone='" + ownerPhone + '\'' +
                ", hotelId=" + hotelId +
                ", hotelImage='" + hotelImage + '\'' +
                ", hotelProvince='" + hotelProvince + '\'' +
                ", hotelCity='" + hotelCity + '\'' +
                ", favorNum=" + favorNum +
                ", hotelPrice=" + hotelPrice +
                ", hotelAddress='" + hotelAddress + '\'' +
                '}';
    }
}
