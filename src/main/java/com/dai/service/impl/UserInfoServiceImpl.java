package com.dai.service.impl;

import com.dai.dao.UserInfoDao;
import com.dai.entity.UserInfo;
import com.dai.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserInfoServiceImpl implements UserInfoService {

    private static int PageRow=10;   //PageRow 为每一页显示的用户信息数

    public int getPageRow(){
        return PageRow;
    }

    @Autowired
    UserInfoDao userInfoDao;

    /**
     * 查询所有用户
     */
    @Override
    public List<UserInfo> queryAll(){
        return userInfoDao.queryAll();
    }

    /**
     * 添加用户
     */
    @Override
    public void addUser(UserInfo user){
        userInfoDao.addUser(user);
    }

    /**
     * 根据useraccount删除用户
     */
    @Override
    public void deleteUser(String useraccount){
        userInfoDao.deleteUser(useraccount);
    }

    /**
     * 根据useraccount查找用户
     */
    @Override
    public UserInfo queryUser(String useraccount){
        return userInfoDao.queryUser(useraccount);
    }

    /**
     * 更新用户信息
     */
    @Override
    public void updateUser(UserInfo user){
        userInfoDao.updateUser(user);
    }

    /**
     * 查询用户总数
     */
    @Override
    public int userAmount(){
        return userInfoDao.userAmount();
    }

    @Override
    public List<UserInfo> queryByIndex(int index){
        int offset = (index-1)*PageRow;
        return userInfoDao.queryByIndex(offset,PageRow);
    }

    @Override
    public List<UserInfo> queryByKeyWord(String type, String keword){
        return userInfoDao.queryByKeyWord(type, keword);
    }

}
