package com.dai.dao;

import com.dai.entity.HotelInfo;

import java.util.List;

public interface HotelInfo_userDao {
    /**
     * 查询一个地级市的民宿
     * @param hotelcity
     * @return
     */
    public List<HotelInfo> queryByCity(String hotelcity);
    /**
     * 查询一条记录
     * @param hotelId
     * @return
     */
    public HotelInfo queryById(int hotelId);

}
