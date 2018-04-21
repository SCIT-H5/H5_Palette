package com.palette.h5.ego.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.palette.h5.ego.dao.EgoCertDAO;
import com.palette.h5.ego.vo.CertProject;
import com.palette.h5.ego.vo.CertProjectDetail;

@Controller
@RequestMapping(value = "ego/cert")
public class EgoCertController {
	
	private static final Logger logger = LoggerFactory.getLogger(EgoCertController.class);


	@Autowired
	EgoCertDAO dao;
	
	//자격증명 메인
	@RequestMapping(value = "certCertificateReadForm", method = RequestMethod.GET)
	public String test() {
		//이동폼 유저 아이디에 맞는 테이블 불러오기
			
		return "ego/cert/certCertificateReadForm";
	}
	
	//자격증명 데이터 쓰기
	@RequestMapping(value="certificateWrite", method = RequestMethod.POST)
	public void certificateWrite(@RequestBody String datatable, HttpSession session){
		logger.info("자격증명 데이터 쓰기");
		
		String certId = (String) session.getAttribute("loginId"); //세션의 아이디 가져오기
		
		HashMap<String, String> certficateMap = new HashMap<String, String>();
		
		certficateMap.put("certId", certId);
		certficateMap.put("cert_Json", datatable);
		
		int result = 0;
		
		result = dao.certificateWrite(certficateMap);
		
		System.out.println(datatable);
		logger.info("자격증명 데이터쓰기 종료");
	}
	
	
	
	@RequestMapping(value = "certProjectReadForm", method = RequestMethod.GET)
	public String projectRead(HttpSession session, Model model) {

		ArrayList<CertProject> list = null;

		String proId = (String) session.getAttribute("loginId");// 섹션의 아이디 가져오기

		list = dao.projectList(proId);

		model.addAttribute("list", list);
		System.out.println("받아온 리스트 " + list);
		return "ego/cert/certProjectReadForm";
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

		return "ego/cert/certProjectDetailReadForm";
	}

	// 글작성폼으로이동
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String write() {
		logger.info("글 작성 폼으로 이동");

		logger.info("글 작성 폼으로 이동 완료 ");
		// model.addAttribute("proNum");

		return "ego/cert/certProjectWrite";
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

		return "ego/cert/certProjectWriteForm";
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

}
