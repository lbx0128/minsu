package com.dai.service;

import com.dai.entity.HotelInfo;

import java.util.List;

/**
 * 旅馆信息
 * 对旅馆的增删改查
 * @author hero 2018/12/29
 */
public interface HotelInfoService {

    /**
     * 查询所有的旅馆
     * @return
     */
    public List<HotelInfo> queryAll();

    /**
     * 分页查询
     * @param index 查询页码
     * @return
     */
    public List<HotelInfo> queryByIndex(int index);

    /**
     * 根据关键字查询房源信息
     * @param type      类型, 比如房主姓名、手机号、地区等
     * @param keyword   关键字
     * @return
     */
    public List<HotelInfo> queryByKeyword(String type, String keyword);

    /**
     * 查询数据条目
     * @return
     */
    public int queryCount();

    /**
     * 编辑房源信息
     * @param hotelId 房源编号
     * @return
     */
    public HotelInfo queryById(int hotelId);

    /**
     * 新增房间
     * @param hotelInfo 待插入房间
     * @return
     */
    public int addHotelInfo(HotelInfo hotelInfo);

    /**
     * 删除房间
     * @param hotelId  待删除房间id
     * @return
     */
    public int deleteHotelInfo(int hotelId);

    /**
     * 修改房源信息
     * @param hotelInfo 保存新数据
     * @return
     */
    public int updateHotelInfo(HotelInfo hotelInfo);
    /**
     * 查询前6的推荐
     * @return
     */
    public List<HotelInfo> querySix();
}
