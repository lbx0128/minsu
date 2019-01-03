package com.dai.dao;
import java.util.List;
import com.dai.entity.Comment;
public interface CommentDao {

    /**
     * 查询所有该旅馆的评论
     * @return
     */
    public List<Comment> queryAllComment(int hotelId);
}
