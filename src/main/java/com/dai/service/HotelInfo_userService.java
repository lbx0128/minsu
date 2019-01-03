package com.dai.service;
import com.dai.entity.HotelInfo;
import java.util.List;
public interface HotelInfo_userService {
    /**
     * 查看房源信息
     * @param hotelcity 房源地级市
     * @return
     */
    public List<HotelInfo> queryByCity(String hotelcity);
    /**
     * 查看房源信息
     * @param hotelId 房源编号
     * @return
     */
    public HotelInfo queryById(int hotelId);

}
