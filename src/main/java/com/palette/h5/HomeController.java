package com.palette.h5;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.palette.h5.ego.dao.EgoDAO;
import com.palette.h5.util.FileService;
import com.palette.h5.vo.FileManagement;

@Controller
public class HomeController {
	
	@Autowired
	EgoDAO egoDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	final String uploadPath = "/H5_Palette/src/main/webapp/resources/file_uploaded";	//파일 업로드 경로
	
	/**
	 *  Home 화면으로
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	/**
	 *  Demo 화면으로
	 */
	@RequestMapping(value = "demo", method = RequestMethod.GET)
	public String demo(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "demo";
	}
	
	/**
	 *	로그인 완료 후 메인 페이지로 
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(){
		
		return "main";
	}
		

	
}
