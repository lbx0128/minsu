package com.dai.dao;

import com.dai.entity.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserInfoDao {
    /**
     * 查询所有用户
     */
    public List<UserInfo> queryAll();

    /**
     * 添加用户
     */
    public void addUser(UserInfo user);

    /**
     * 根据useraccount删除用户
     */
    public void deleteUser(String useraccount);

    /**
     * 根据useraccount查找用户
     */
    public UserInfo queryUser(String useraccount);

    /**
     * 根据关键字查找用户信息
     */
    public List<UserInfo> queryByKeyWord(String type,String keyword);


    /**
     * 更新用户信息
     */
    public void updateUser(UserInfo user);

    /**
     * 返回用户总数
     */
    public int userAmount();

    /**
     * 查询一页的内容
     * @param offset
     * @param limit
     * @return
     */
    public List<UserInfo> queryByIndex(@Param("offset")int offset,@Param("limit")int limit);
}
