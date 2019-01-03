package com.dai.service;
import com.dai.entity.Comment;
import java.util.List;
public interface CommentService {
    /**
     * 查询所有该旅馆评论
     * @return
     */
    public List<Comment> queryAllComment(int hotelId);
}
