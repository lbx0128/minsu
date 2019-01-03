package com.dai.service.impl;

import com.dai.dao.HotelInfo_userDao;
import com.dai.entity.HotelInfo;
import com.dai.service.HotelInfo_userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class HotelInfo_userServiceImpl implements HotelInfo_userService {

    private HotelInfo_userDao hotelInfo_userDao;

    @Autowired
    public void setHotelInfo_userDao(HotelInfo_userDao hotelInfo_userDao) {
        this.hotelInfo_userDao = hotelInfo_userDao;
    }
    @Override
    public List<HotelInfo> queryByCity(String hotelcity) {
        return hotelInfo_userDao.queryByCity(hotelcity);
    }

    @Override
    public HotelInfo queryById(int hotelId) {
        return hotelInfo_userDao.queryById(hotelId);
    }

}
