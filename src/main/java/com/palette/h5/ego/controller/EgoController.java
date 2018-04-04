package com.palette.h5.ego.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.palette.h5.ego.dao.EgoDAO;

@Controller
@RequestMapping(value="ego")
public class EgoController {
	
	private static final Logger logger = LoggerFactory.getLogger(EgoController.class);
	
	@Autowired
	EgoDAO dao;
	
	// swot 기본 글 읽기
	@RequestMapping(value="swotRead",method=RequestMethod.GET)
	public String swotRead(Model model){
		
		logger.info("CON | 글 읽기 시작");
		
		// swotRead 페이지에서 글작성버튼 생성여부 판단 
		
		logger.info("CON | 글 읽기 종료");
		return "ego/swotRead";
	}
	
	// swot 글 작성 폼 이동
	@RequestMapping(value="swotWriteForm", method=RequestMethod.GET)
	public String swotWriteForm(){
		
		logger.info("CON | 글 작성 시작");
		
		logger.info("CON | 글 작성 종료");
		return "ego/swotWriteForm";
	}
		
	// swot 글 작성 
	@RequestMapping(value="swotWrite", method=RequestMethod.POST)
	public String swotWrite(){
		
		logger.info("CON | 글 작성 시작");
		
		
		logger.info("CON | 글 작성 종료");
		return "redirect:swotRead";
	}
	
	
	
	// swot 글 수정 폼이동
	@RequestMapping(value="", method=RequestMethod.POST)
	public String swotUpdateForm(){
		
		logger.info("CON | 글 수정Form이동 시작");
		
		
		
		logger.info("CON | 글 수정Form이동 시작");
		
		
		return "ego/swotUpdateForm";
	}
	
	// swot 글 수정
	@RequestMapping(value="", method=RequestMethod.POST)
	public String swotUpdate(){
		
		logger.info("CON | 글 수정 시작");
		
		
		logger.info("CON | 글 수정 시작");
		
		
		return "redirect:swotRead";
	}
	
	
	// swot 글 리셋
	public String swotReset(){
		
		
		return "redirect:swotRead";
	}

}
