package com.dai.entity;

/**
 * 评论信息
 * @author hero 2018/12/29
 */
public class Comment {
    /**
     * 评论编号
     */
    private int commentId;
    /**
     * 评论内容
     */
    private String comment;
    /**
     * 评论人
     */
    private String userAccount;
    /**
     * 评论的房间
     */
    private int hotelId;

    public Comment(int commentId, String comment, String useraccount, int hotelId) {
        this.commentId = commentId;
        this.comment = comment;
        this.userAccount = useraccount;
        this.hotelId = hotelId;
    }

    public Comment() {
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUseraccount() {
        return userAccount;
    }

    public void setUseraccount(String useraccount) {
        this.userAccount = useraccount;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }
}
