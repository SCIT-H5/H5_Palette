package com.palette.h5.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.palette.h5.dao.UserinfoDAO;
import com.palette.h5.vo.Userinfo;

@Controller
@RequestMapping("userinfo")
public class UserinfoController {
	
	@Autowired
	UserinfoDAO userDao;
	
	private static final Logger logger = LoggerFactory.getLogger(UserinfoController.class);

	/**
	 * 로그인 폼 보기
	 */
	@RequestMapping (value="login_register", method=RequestMethod.GET)
	public String login(HttpSession session) {
		
		if (session.getAttribute("loginId") == null) {
			
			return "userinfo/login_register";
			
		} else {
			
			return "redirect:/main";
		}
		
	}
	
	
	/**
	 * 	로그인 처리
	 * 	@param id 사용자가 입력한 아이디
	 * 	@param password 사용자가 입력한 비밀번호
	 * 	@param model Model객체
	 * 	@param session HttpSession객체
	 */
	@RequestMapping(value="loginForm", method=RequestMethod.POST)
	public String loginForm(String userId, String userPw, 
			Model model, HttpSession session){
		
		logger.info("로그인 폼 이동 완료");
		
		Userinfo user = userDao.getUserinfoById(userId);
		
		if (user != null && user.getPassword().equals(userPw)) {
			
			session.setAttribute("loginId", user.getId());
			
			logger.info("로그인 완료, 세션에 아이디 저장");
			
			return "redirect:/main";
		}
		
		else {
			
			model.addAttribute("errorMsg", "ID 또는 비밀번호가 틀립니다.");
			
			logger.info("로그인 실패");
			
			return "userinfo/login_register";
		}
	}
		
	
	/**
	 * 회원 가입 정보를 받아 데이터베이스에 저장
	 * @return 가입 성공시 성공 페이지로, 실패시 실패 페이지로.
	 */
	@RequestMapping(value="joinForm", method=RequestMethod.POST)
	public String joinForm(Userinfo userinfo){
				
		if (userDao.join(userinfo) == 1) {
			logger.info("회원가입 완료");
			return "userinfo/memberJoinComplete";
			
		} else {
			return "userinfo/memberJoinError";
		}		
		
	}
	

	/**
	 * 해당 아이디가 중복인지 아닌지 확인
	 * @param id
	 * @param response
	 */
	@RequestMapping (value = "checkId", method = RequestMethod.GET)
	@ResponseBody
	public void checkId(String id, HttpServletResponse response) {
		
		if (userDao.getUserinfoById(id) == null) {
			response.setStatus(HttpServletResponse.SC_OK);
			
		} else {
			response.setStatus(HttpServletResponse.SC_EXPECTATION_FAILED);
		}
	}
	
	
	/**
	 * 해당 이메일이 중복인지 아닌지 확인
	 * @param email
	 * @param response
	 */
	@RequestMapping (value = "checkEmail", method = RequestMethod.GET)
	@ResponseBody
	public void checkEmail(String email, HttpServletResponse response) {
		
		if (userDao.getUserinfoByEmail(email) == null) {
			response.setStatus(HttpServletResponse.SC_OK);
			
		} else {
			response.setStatus(HttpServletResponse.SC_LENGTH_REQUIRED);
		}
	}
	
	
	/**
	 * 로그아웃
	 * @param session
	 * @return
	 */
	@RequestMapping (value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginId");
		
		return "redirect:../";
	}
}
