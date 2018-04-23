package com.palette.h5.port.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="port")
@Controller
public class PortController {
/*
	@Autowired
	PortDAO portDao;
	*/
	private static final Logger logger = LoggerFactory.getLogger(PortController.class);
	
	@RequestMapping(value = "my_port", method = RequestMethod.GET)
	public String myPortfolio(){
		
		logger.info("내 포트폴리오 이동 시작");
		
		logger.info("내 포트폴리오 이동 완료");
		
		return "port/my_port";
	}
}
