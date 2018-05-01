package com.palette.h5.port.dao;

import java.util.ArrayList;

import com.palette.h5.ego.vo.Reply;
import com.palette.h5.vo.Portfolio;

public interface PortMapper {
	public int portSave(Portfolio portfolio);
	public int portUpdate(Portfolio portfolio);
	public int portDelete(Portfolio portfolio);
	public ArrayList<Portfolio> portList(String portId);
	public Portfolio portSelectOne(Portfolio portfolio);
	public ArrayList<Portfolio> portOpenList();
	//리플 작성
	public int commentwrite(Reply reply);
	//리플 출력
	public ArrayList<Reply> commentView(int replyportNum);
	//리플 수정
	public int commentUpdate(Reply reply);
	//리플 삭제 
	public int commentDel(Reply reply);
}
