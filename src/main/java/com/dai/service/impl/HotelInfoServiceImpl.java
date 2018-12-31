package com.dai.service.impl;

import com.dai.dao.HotelInfoDao;
import com.dai.entity.HotelInfo;
import com.dai.service.HotelInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hero 2018/12/29
 */

@Service
public class HotelInfoServiceImpl implements HotelInfoService {

    private HotelInfoDao hotelInfoDao;

    public static int getPageRow() {
        return PAGE_ROW;
    }

    /**
     * 固定页面数据条数
     */
    private static final int PAGE_ROW = 3;

    @Autowired
    public void setHotelInfoDao(HotelInfoDao hotelInfoDao) {
        this.hotelInfoDao = hotelInfoDao;
    }

    @Override
    public List<HotelInfo> queryAll() {
        return hotelInfoDao.queryAll();
    }

    @Override
    public int queryCount() {
        return hotelInfoDao.selectCount();
    }

    @Override
    public HotelInfo queryById(int hotelId) {
        return hotelInfoDao.queryById(hotelId);
    }

    @Override
    public List<HotelInfo> queryByIndex(int index) {
        int offset = (index-1) * PAGE_ROW;
        return hotelInfoDao.queryByIndex(offset, PAGE_ROW);
    }

    @Override
    public List<HotelInfo> queryByKeyword(String type, String keyword) {
        return null;
    }

    @Override
    public int addHotelInfo(HotelInfo hotelInfo) {
        int res = hotelInfoDao.addHotelInfo(hotelInfo);
        System.out.println("res=" + res);
        return res;
    }

    @Override
    public int deleteHotelInfo(int hotelId) {
        int res = hotelInfoDao.deleteHotelInfo(hotelId);
        return res;
    }

    @Override
    public int updateHotelInfo(HotelInfo hotelInfo) {
        int res = hotelInfoDao.updateHotelInfo(hotelInfo);
        return res;
    }
    @Override
    public List<HotelInfo> querySix() {
        return hotelInfoDao.querySix();
    }
}
