package com.palette.h5.ego.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.palette.h5.ego.dao.EgoDAO;

@Controller
@RequestMapping(value="ego")
public class EgoController {
	
	private static final Logger logger = LoggerFactory.getLogger(EgoController.class);
	
	@Autowired
	EgoDAO dao;
	
	

}
