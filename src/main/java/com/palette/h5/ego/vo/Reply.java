package com.palette.h5.ego.vo;

public class Reply {

	public int replyportNum;	//포폴 번호
	public int commentNum;     //리플번호 --시퀀스로 줌
	public String commentID;	 //작성자 아이디 
	public String commentText; //작성 내용
	public String commentDate; //작성 날짜
	public Reply() {
		super();
	}
	public Reply(int replyportNum, int commentNum, String commentID, String commentText, String commentDate) {
		super();
		this.replyportNum = replyportNum;
		this.commentNum = commentNum;
		this.commentID = commentID;
		this.commentText = commentText;
		this.commentDate = commentDate;
	}
	public int getReplyportNum() {
		return replyportNum;
	}
	public void setReplyportNum(int replyportNum) {
		this.replyportNum = replyportNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getCommentID() {
		return commentID;
	}
	public void setCommentID(String commentID) {
		this.commentID = commentID;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "Reply [commentNum=" + commentNum + ", replyportNum=" + replyportNum + ", commentID=" + commentID
				+ ", commentText=" + commentText + ", commentDate=" + commentDate + "]";
	}
	
	
}
