package com.dai.dao;

import com.dai.entity.HotelInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HotelInfoDao {

    /**
     * 查询所有的旅馆
     * @return
     */
    public List<HotelInfo> queryAll();

    /**
     * 查询数据条数
     * @return
     */
    public int selectCount();

    /**
     * 查询一页内容
     * @param offset 开始位置
     * @param limit 结束位置
     * @return
     */
    public List<HotelInfo> queryByIndex(@Param(value = "offset") int offset,
                                       @Param(value = "limit") int limit);

    /**
     * 根据地址查询房间
     * @param prov 省份
     * @param city 城市
     * @return
     */
    public List<HotelInfo> queryByAddress(@Param("prov") String prov,
                                         @Param("city") String city);

    /**
     * 关键字查询
     * @param lowest
     * @param highest
     * @return
     */
    public List<HotelInfo> queryByPrice(int lowest, int highest);

    /**
     * 根据类型关键字查询
     * @param type
     * @param keyword
     * @return
     */
    public List<HotelInfo> queryByKeyword(String type, String keyword);


    /**
     * 查询一条记录
     * @param hotelId
     * @return
     */
    public HotelInfo queryById(int hotelId);

    /**
     * 新增一条房间记录
     * @param hotelInfo 待插入房间
     * @return
     */
    public int addHotelInfo(HotelInfo hotelInfo);

    /**
     * 根据hotelId删除一条房间记录
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
     * 查询推荐信息
     * @return
     */
    public List<HotelInfo> querySix();
}
