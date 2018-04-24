package com.palette.h5.ego.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.palette.h5.dao.UserinfoDAO;
import com.palette.h5.ego.dao.EgoDAO;
import com.palette.h5.ego.vo.CertProject;
import com.palette.h5.ego.vo.CertProjectDetail;
import com.palette.h5.ego.vo.Swot;
import com.palette.h5.vo.Userinfo;

@Controller
@RequestMapping(value = "ego")
public class EgoController {

	private static final Logger logger = LoggerFactory.getLogger(EgoController.class);

	@Autowired
	EgoDAO dao;
	UserinfoDAO userdao;

	@RequestMapping(value = "certCertificateReadForm", method = RequestMethod.GET)
	public String test() {

		return "ego/certCertificateReadForm";
	}

	// swot 기본 글 읽기
	@RequestMapping(value = "swotReadForm", method = RequestMethod.GET)
	public String swotRead(HttpSession session) {

		logger.info("CON | SWOT 글읽기 시작");

		// 세선에서 아이디를 받아올 변수
		String swotId = (String) session.getAttribute("loginId");
		System.out.println("유저 아이디는 : " + swotId);

		// 스왓분석 DB를 리턴받음
		Swot readSWOT = dao.readswot(swotId);
		System.out.println(readSWOT);
		if (readSWOT == null) {
			logger.info("SWOT분석을 읽어온 데이터가 없습니다.");
		} else {
			logger.info("SWOT분석을 읽어온 데이터가 있습니다.");
		}

		// 읽혀온 스왓을 리턴해줌
		session.setAttribute("swotlist", readSWOT);

		// swotRead 페이지에서 글작성버튼 생성여부 판단

		logger.info("CON | SWOT 글읽기 종료");
		return "ego/swot/swotReadForm";
	}

	// swot 글 작성 폼 이동

	@RequestMapping(value = "swotWriteForm", method = RequestMethod.GET)
	public String swotWriteForm() {

		logger.info("CON | 글 작성 이동 시작");

		logger.info("CON | 글 작성 이동 종료");

		return "ego/swotWriteForm";
	}

	// swot 글 작성
	@RequestMapping(value = "swotWrite", method = RequestMethod.POST)
	public String swotWrite(HttpSession session, Swot swot) {

		logger.info("CON | SWOT 글 작성 시작");

		// 세선에서 아이디를 받아올 변수
		String swotId = (String) session.getAttribute("loginId");
		swot.setSwotId(swotId);
		System.out.println("컨트롤러로 넘어온 ㅅ왓" + swot);
		// 데이터를 DAO에 넘겨줌
		int result = dao.writeswot(swot);

		if (result != 0) {
			logger.info("CON | SWOT 입력 성공");
		} else {
			logger.info("CON | SWOT 입력 실패");
		}

		logger.info("CON | SWOT 글 작성 종료");
		return "ego/swot/swotComplete";
	}

	// swot 글 수정 폼이동
	@RequestMapping(value = "swotUpdateForm", method = RequestMethod.GET)
	public String swotUpdateForm() {

		logger.info("CON | SWOT 수정 이동 시작");

		logger.info("CON | SWOT 수정 이동 종료");

		return "ego/swotUpdateForm";
	}

	// swot 글 수정

	@RequestMapping(value = "swotUpdate", method = RequestMethod.POST)
	public String swotUpdate(HttpSession session, Swot swot) {

		logger.info("CON | SWOT 수정 시작");

		// 세선에서 아이디를 받아올 변수
		String swotId = (String) session.getAttribute("loginId");
		swot.setSwotId(swotId);

		int result = dao.updateswot(swot);

		if (result != 0) {
			logger.info("CON | SWOT 수정 성공");
		} else {
			logger.info("CON | SWOT 수정 실패");
		}

		logger.info("CON | SWOT 수정 종료");

		return "ego/swot/swotComplete";
	}

	// swot 글 삭제

	@RequestMapping(value = "deleteswot", method = RequestMethod.GET)
	public String deleteswot(HttpSession session) {

		logger.info("CON | SWOT 삭제 시작");
		// 세선에서 아이디를 받아올 변수
		String swotId = (String) session.getAttribute("loginId");

		int result = dao.deleteswot(swotId);

		if (result != 0) {
			logger.info("CON | SWOT 삭제 성공");
		} else {
			logger.info("CON | SWOT 삭제 실패");
		}

		logger.info("CON | SWOT 삭제 종료");

		return "redirect:swotReadForm";
	}

	@RequestMapping(value = "certProjectReadForm", method = RequestMethod.GET)
	public String projectRead(HttpSession session, Model model) {

		ArrayList<CertProject> list = null;

		String proId = (String) session.getAttribute("loginId");// 섹션의 아이디 가져오기

		list = dao.projectList(proId);

		model.addAttribute("list", list);
		System.out.println("받아온 리스트 " + list);
		return "ego/certProjectReadForm";
	}

	// 디테일 페이지로 이동
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(int proNum, HttpSession session, Model model) {
		// 글 번호를 가지고 디테일 페이지로 이동
		CertProject result = null;
		CertProjectDetail resultDetail = null;
		System.out.println("넘어온 글 번호 " + proNum);

		result = dao.projectdetail_One(proNum);
		resultDetail = dao.projecDetail_one_one(proNum);

		model.addAttribute("result", result);
		model.addAttribute("resultDetail", resultDetail);

		// model.addAttribute("proNum");

		return "ego/certProjectDetailReadForm";
	}

	// 글작성폼으로이동
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String write() {
		logger.info("글 작성 폼으로 이동");

		logger.info("글 작성 폼으로 이동 완료 ");
		// model.addAttribute("proNum");

		return "ego/certProjectWrite";
	}

	// 프로젝트 리스트 작성
	@RequestMapping(value = "projectWrite_One", method = RequestMethod.GET)
	public String projectWrite_One(CertProject CertProject) {
		// model.addAttribute("proNum");
		logger.info("프로젝트 리스트 작성 ");
		System.out.println("넘어온 작성된 디테일 값 : " + CertProject);

		dao.projectWrite_One(CertProject);

		logger.info("프로젝트 리스트 작성 완료 ");
		return "redirect:certProjectReadForm";
	}

	// 프로젝트 디테일 수정폼으로이동
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(int proNum, Model model) {
		logger.info("프로젝트 디테일 수정폼 이동 ");
		System.out.println("가지고온 넘버 : " + proNum);

		CertProject result = null;
		CertProjectDetail resultDetail = null;

		System.out.println("넘어온 글 번호 " + proNum);

		result = dao.projectdetail_One(proNum);// 이동하면서 번호로 글 가져오기
		resultDetail = dao.projecDetail_one_one(proNum);

		model.addAttribute("result", result);
		model.addAttribute("resultDetail", resultDetail);

		logger.info("프로젝트 디테일 수정폼 이동 완료 ");

		return "ego/certProjectWriteForm";
	}

	// 프로젝트 디테일 작성
	@RequestMapping(value = "projecDetailtWrite", method = RequestMethod.POST)
	public String projecDetailtWrite(int proNum, CertProjectDetail CertProjectDetail, MultipartFile upload) {
		// model.addAttribute("proNum");

		logger.info("프로젝트 디테일 작성 시작");
		System.out.println("디테일 부분인데 가지고온 넘버 : " + proNum);
		CertProjectDetail.setProDetailNum(proNum);

		System.out.println("넘어온 작성된 디테일 값 : " + CertProjectDetail);

		dao.projecDetailtWrite(CertProjectDetail);

		logger.info("프로젝트 디테일 작성 완료");

		return "redirect:certProjectReadForm";
	}
	
	//마이페이지 정보 이동
	@RequestMapping(value = "myInfo", method = RequestMethod.GET)
	public String MyInformation() {
		logger.info("마이페이지/ 정보페이지 이동 시작");
		
		
		
		logger.info("마이페이지/ 정보페이지 이동 종료");
		
		return "ego/mypage/myInformation";
	}
	//마이페이지 -회원 수정하기
		@RequestMapping(value = "editForm", method = RequestMethod.POST)
		public String editForm(Userinfo userinfo, HttpSession session, Model model) {
			logger.info("마이페이지/ 회원정보 수정 시작");
			
			//섹션의 아이디 및 이름 가져옴
			String userId = (String) session.getAttribute("loginId");
			String userName = (String) session.getAttribute("loginName");
			
			//아이디 이름을 vo에 저장
			userinfo.setId(userId);
			userinfo.setName(userName);
			System.out.println("정보 수정 가자~!!"+userinfo);
			
			int result = dao.userEdit(userinfo);
	
			if (result == 1) {
				
				logger.info("마이페이지/ 회원정보 수정 종료");
				
				return "redirect:/main";
			}
			
			else {
				
				model.addAttribute("errorMsg", "수정되지 않았습니다");
				
				logger.info("로그인 실패");
				
				return "ego/mypage/myInformation";
			}
			
			
		}
		
		
		
		//마이포토폴리오 페이지 이동
		@RequestMapping(value = "myportfolio", method = RequestMethod.GET)
		public String myportfolio() {
			logger.info("마이페이지/ 마이포토폴리오 이동 시작");
			
			
			
			logger.info("마이페이지/ 마이포토폴리오 이동 종료");
			
			return "ego/mypage/myportfolio";
		}
}