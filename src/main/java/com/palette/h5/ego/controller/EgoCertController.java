package com.palette.h5.ego.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.palette.h5.ego.dao.EgoCertDAO;
import com.palette.h5.ego.vo.CertCertificate;
import com.palette.h5.ego.vo.CertProject;

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
	@ResponseBody
	@RequestMapping(value="certificateWrite", method = RequestMethod.POST)
	public void certificateWrite(String tablehtml, String datatable, HttpSession session){
		logger.info("자격증명 데이터 쓰기");
		
		logger.info(tablehtml);
		logger.info(datatable);
		
		String certId = (String) session.getAttribute("loginId"); //세션의 아이디 가져오기
		
		HashMap<String, String> certficateMap = new HashMap<String, String>();
		
		certficateMap.put("certId", certId);
		certficateMap.put("certhtml", tablehtml);
		certficateMap.put("certjson", datatable);
		
		CertCertificate certficatevalue = dao.certificateRead(certId);

		int result = 0;
		
		
		if(certficatevalue == null){
		//db에 값이 없을때 insert
			result = dao.certificateWrite(certficateMap);
		} else{
		//db에 값이 있을때 update
			result = dao.certificateUpdate(certficateMap);
		}
//		System.out.println(datatable);
		logger.info("자격증명 데이터쓰기 종료");
	}
	
	//자격증 데이터 가져오기
	@ResponseBody
	@RequestMapping(value="certificateRead", method = RequestMethod.POST)
	public CertCertificate certificateRead(HttpSession session){
		logger.info("자격증명 데이터 불러오기 시작");
		
		String certId = (String) session.getAttribute("loginId"); //세션의 아이디 가져오기
		
		CertCertificate certficatevalue;
		
		certficatevalue = dao.certificateRead(certId);
		
		logger.info("반환값" + certficatevalue);
		
		logger.info("자격증명 데이터 불러오기 종료");
		return certficatevalue;
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



}
