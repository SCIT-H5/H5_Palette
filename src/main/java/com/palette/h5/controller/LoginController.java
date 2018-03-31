package com.palette.h5.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.palette.h5.dao.UserinfoDAO;
import com.palette.h5.vo.Userinfo;

@RequestMapping("userinfo")
@Controller
public class LoginController {
	
	@Autowired
	UserinfoDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	/**
	 * 로그인 폼 보기
	 */
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String loginForm() {
		return "userinfo/loginForm";
	}
	
	/**
	 * 	로그인 처리
	 * 	@param id 사용자가 입력한 아이디
	 * 	@param password 사용자가 입력한 비밀번호
	 * 	@param model Model객체
	 * 	@param session HttpSession객체
	 */
	@RequestMapping(value="loginForm", method=RequestMethod.POST)
	public String LoginForm(String userId, String userPw, 
			Model model, HttpSession session){
		
		logger.info("로그인 폼 이동 완료");
		
		Userinfo user = dao.login(userId);
		
		if (user != null && user.getUserPw().equals(userPw)) {
			session.setAttribute("loginId", user.getUserId());
			session.setAttribute("loginName", user.getUserName());
			return "redirect:/";
		}
		else {
			model.addAttribute("errorMsg", "ID 또는 비밀번호가 틀립니다.");
			return "userinfo/loginForm";
		}
	}
}
