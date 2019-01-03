package com.dai.service;


import com.dai.entity.UserInfo;

import java.util.List;

/**
 * 对用户信息进行增删改查
 */

public interface  UserInfoService {
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
     * 更新用户信息
     */
    public void updateUser(UserInfo user);

    /**
     * 查询用户总数
     */
    public int userAmount();

    /**
     * 查询对应页的用户信息
     * @param index
     * @return
     */
    public List<UserInfo> queryByIndex(int index);

    /**
     * 更具关键字查询用户
     * @param type
     * @param keyword
     * @return
     */
    public List<UserInfo> queryByKeyWord(String type, String keyword);
}
