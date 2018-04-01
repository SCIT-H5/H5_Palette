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

@RequestMapping("userinfo")
@Controller
public class UserinfoController {
	
	@Autowired
	UserinfoDAO userDao;
	
	private static final Logger logger = LoggerFactory.getLogger(UserinfoController.class);

	/**
	 * 로그인 폼 보기
	 */
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String login() {
		return "userinfo/memberLogin";
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
		
		if (user != null && user.getUserPw().equals(userPw)) {
			
			session.setAttribute("loginId", user.getUserId());
			
			logger.info("로그인 완료, 세션에 아이디 저장");
			
			return "redirect:common/main";
		}
		
		else {
			
			model.addAttribute("errorMsg", "ID 또는 비밀번호가 틀립니다.");
			
			logger.info("로그인 실패");
			
			return "userinfo/memberLogin";
		}
	}
	
	/**
	 * 회원가입 폼 보기
	 */
	@RequestMapping (value="join", method=RequestMethod.GET)
	public String join() {
		return "userinfo/memberJoin";
	}
	
	/**
	 * 회원 가입 정보를 받아 데이터베이스에 저장
	 * @return 가입 성공시 성공 페이지로, 실패시 실패 페이지로.
	 */
	@RequestMapping(value="joinForm", method=RequestMethod.POST)
	public String joinForm(Userinfo userinfo){
		
		logger.info("회원가입 폼 이동 완료");
		
		if (userDao.join(userinfo) == 1) {
			return "userinfo/memberJoinComplete";
			
		} else {
			return "userinfo/memberJoinError";
		}		
		
	}
	

	/**
	 * 해당 아이디가 중복인지 아닌지 확인
	 * @param userId
	 * @param response
	 */
	@RequestMapping (value = "checkIdDuplicate", method = RequestMethod.GET)
	@ResponseBody
	public void checkIdDuplicate(String userId, HttpServletResponse response) {
		
		if (userDao.getUserinfoById(userId) == null) {
			response.setStatus(HttpServletResponse.SC_OK);
			
		} else {
			response.setStatus(HttpServletResponse.SC_EXPECTATION_FAILED);
		}
	}
	
	
	/**
	 * 해당 이메일이 중복인지 아닌지 확인
	 * @param userId
	 * @param response
	 */
	@RequestMapping (value = "checkEmailDuplicate", method = RequestMethod.GET)
	@ResponseBody
	public void checkEmailDuplicate(String userEmail, HttpServletResponse response) {
		
		if (userDao.getUserinfoByEmail(userEmail) == null) {
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
