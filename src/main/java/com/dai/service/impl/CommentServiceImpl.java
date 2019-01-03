package com.dai.service.impl;


import com.dai.dao.CommentDao;
import com.dai.entity.Comment;
import com.dai.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private CommentDao commentDao;

    @Autowired
    public void setHotelInfo_userDao(CommentDao commentDao) {
        this.commentDao = commentDao;
    }

    @Override
    public List<Comment> queryAllComment(int hotelId) {
        return commentDao.queryAllComment(hotelId);
    }
}