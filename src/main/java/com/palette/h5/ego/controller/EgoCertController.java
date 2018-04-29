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
import org.springframework.web.multipart.MultipartFile;

import com.palette.h5.ego.dao.EgoCertDAO;
import com.palette.h5.ego.dao.EgoDAO;
import com.palette.h5.ego.vo.CertCertificate;
import com.palette.h5.ego.vo.CertLect;
import com.palette.h5.ego.vo.CertProject;
import com.palette.h5.util.FileService;
import com.palette.h5.vo.FileManagement;

@Controller
@RequestMapping(value = "ego/cert")
public class EgoCertController {

	private static final Logger logger = LoggerFactory.getLogger(EgoCertController.class);

	@Autowired
	EgoCertDAO dao;

	@Autowired
	EgoDAO edao;

	final String uploadPath = "/certProject"; // 프로젝트 파일 업로드 경로

	// 이수과목 메인
	@RequestMapping(value = "certLectReadForm", method = RequestMethod.GET)
	public String certLectReadForm() {
		// 이동폼 유저 아이디에 맞는 테이블 불러오기
		return "ego/cert/certLectReadForm";
	}

	// 이수과목 데이터 쓰기
	@ResponseBody
	@RequestMapping(value = "certLectWrite", method = RequestMethod.POST)
	public void certLectWrite(String tablehtml, String datatable, HttpSession session) {
		logger.info("Controller | 이수과목 데이터 쓰기");
		// logger.info(tablehtml);
		// logger.info(datatable);

		String lectId = (String) session.getAttribute("loginId"); // 세션의 아이디
																	// 가져오기
		/*
		 * HashMap<String, String> certficateMap = new HashMap<String,
		 * String>(); certficateMap.put("certId", certId);
		 * certficateMap.put("certhtml", tablehtml);
		 * certficateMap.put("certjson", datatable);
		 */

		CertLect certLect = new CertLect(lectId, datatable, tablehtml);
		CertLect certLect2 = dao.certLectRead(lectId);

		if (certLect2 == null) {
			// db에 값이 없을때 insert
			dao.certLectWrite(certLect);
		} else {
			// db에 값이 있을때 update
			dao.certLectUpdate(certLect);
		}

		// System.out.println(datatable);
		logger.info("Controller | 이수과목 데이터쓰기 종료");
	}

	// 이수과목 데이터 가져오기
	@ResponseBody
	@RequestMapping(value = "certLectRead", method = RequestMethod.POST)
	public CertLect certLectRead(HttpSession session) {
		logger.info("Controller | 이수과목 데이터 불러오기 시작");

		String lectId = (String) session.getAttribute("loginId"); // 세션의 아이디
																	// 가져오기
		CertLect lect;
		lect = dao.certLectRead(lectId);

		logger.info("반환값" + lect);
		logger.info("Controller | 이수과목 데이터 불러오기 종료");
		return lect;
	}

	// 자격증명 메인
	@RequestMapping(value = "certCertificateReadForm", method = RequestMethod.GET)
	public String certificateReadForm() {
		// 이동폼 유저 아이디에 맞는 테이블 불러오기

		return "ego/cert/certCertificateReadForm";
	}

	// 자격증명 데이터 쓰기
	@ResponseBody
	@RequestMapping(value = "certificateWrite", method = RequestMethod.POST)
	public void certificateWrite(String tablehtml, String datatable, HttpSession session) {
		logger.info("자격증명 데이터 쓰기");

		logger.info(tablehtml);
		logger.info(datatable);

		String certId = (String) session.getAttribute("loginId"); // 세션의 아이디
																	// 가져오기

		HashMap<String, String> certficateMap = new HashMap<String, String>();

		certficateMap.put("certId", certId);
		certficateMap.put("certhtml", tablehtml);
		certficateMap.put("certjson", datatable);

		CertCertificate certficatevalue = dao.certificateRead(certId);

		if (certficatevalue == null) {
			// db에 값이 없을때 insert
			dao.certificateWrite(certficateMap);
		} else {
			// db에 값이 있을때 update
			dao.certificateUpdate(certficateMap);
		}
		// System.out.println(datatable);
		logger.info("자격증명 데이터쓰기 종료");
	}

	// 자격증 데이터 가져오기
	@ResponseBody
	@RequestMapping(value = "certificateRead", method = RequestMethod.POST)
	public CertCertificate certificateRead(HttpSession session) {
		logger.info("자격증명 데이터 불러오기 시작");

		String certId = (String) session.getAttribute("loginId"); // 세션의 아이디
																	// 가져오기

		CertCertificate certficatevalue;

		certficatevalue = dao.certificateRead(certId);

		logger.info("반환값" + certficatevalue);

		logger.info("자격증명 데이터 불러오기 종료");
		return certficatevalue;
	}

	// swot 기본 글 읽기
	@RequestMapping(value = "/swot/swotReadForm", method = RequestMethod.GET)
	public String swotRead(Model model) {

		logger.info("CON | 글 읽기 시작");

		// swotRead 페이지에서 글작성버튼 생성여부 판단

		logger.info("CON | 글 읽기 종료");
		return "ego/swot/swotReadForm";
	}

	@RequestMapping(value = "certProjectReadForm", method = RequestMethod.GET)
	public String projectRead(HttpSession session, Model model, CertProject CertProject) {

		ArrayList<CertProject> list = null;

		String proId = (String) session.getAttribute("loginId");// 섹션의 아이디 가져오기
		CertProject.setProId(proId);

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

		System.out.println("넘어온 글 번호 " + proNum);

		result = dao.projectdetail_One(proNum);

		if (result.getProFileId() != 0) {
			int file_id = result.getProFileId();
			FileManagement file = edao.fileSelectOne(file_id);
			model.addAttribute("file", file);
		}

		model.addAttribute("result", result);

		// model.addAttribute("proNum");

		return "ego/cert/certProjectDetailReadForm";
	}

	// 글작성폼으로 이동
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String write() {
		logger.info("글 작성 폼으로 이동");

		logger.info("글 작성 폼으로 이동 완료 ");
		// model.addAttribute("proNum");

		return "ego/cert/certProjectWrite";
	}

	// 프로젝트 작성
	@RequestMapping(value = "projectWrite_One", method = RequestMethod.POST)
	public String projectWrite_One(CertProject CertProject, MultipartFile upload, HttpSession session) {
		// model.addAttribute("proNum");
		logger.info("프로젝트 리스트 작성 ");

		String proId = (String) session.getAttribute("loginId");// 섹션의 아이디 가져오기
		System.out.println(upload);
		int idx = 0;

		if (!upload.isEmpty()) {
			// Board객체에 originalFileName과 savedfileName을 저장
			logger.info("첨부파일 추가 시작");

			String savedfile = FileService.saveFile(upload, uploadPath);
			String originalfile = upload.getOriginalFilename();

			FileManagement fileManagement = new FileManagement();
			fileManagement.setFileDivision(3);
			fileManagement.setFileUserId(proId);
			fileManagement.setOriginalFileName(originalfile);
			fileManagement.setSavedFileName(savedfile);

			edao.file_management(fileManagement);
			idx = fileManagement.getIdx();
			logger.info("첨부파일 추가 종료" + idx);
		}

		CertProject.setProId(proId);
		CertProject.setProFileId(idx);

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

		System.out.println("넘어온 글 번호 " + proNum);

		result = dao.projectdetail_One(proNum);// 이동하면서 번호로 글 가져오기

		model.addAttribute("result", result);

		logger.info("프로젝트 디테일 수정폼 이동 완료 ");

		return "ego/cert/certProjectEditForm";
	}

	// 프로젝트 수정
	@RequestMapping(value = "projectEdit", method = RequestMethod.POST)
	public String projectEdit(Model model, CertProject CertProject, MultipartFile upload, HttpSession session) {

		String proId = (String) session.getAttribute("loginId");// 섹션의 아이디 가져오기
		int proNum = CertProject.getProNum();

		int proFileId = dao.projectdetail_One(proNum).getProFileId();

		// 수정한 첨부파일 있을때
		if (!upload.isEmpty()) {
			// Board객체에 originalFileName과 savedfileName을 저장
			logger.info("첨부파일 추가 시작");

			String savedfile = FileService.saveFile(upload, uploadPath);
			String originalfile = upload.getOriginalFilename();

			FileManagement fileManagement = new FileManagement();

			fileManagement.setOriginalFileName(originalfile);
			fileManagement.setSavedFileName(savedfile);

			// 원래 파일 없으면 생성
			if (proFileId == 0) {
				fileManagement.setFileDivision(3);
				fileManagement.setFileUserId(proId);
				edao.file_management(fileManagement);
				int idx = fileManagement.getIdx();
				CertProject.setProFileId(idx);
			}
			// 아니면 수정
			else {
				fileManagement.setFile_id(proFileId);
				System.out.println(fileManagement);
				edao.proFileUpdate(fileManagement);
				CertProject.setProFileId(proFileId);
			}
		}
		// 수정한 첨부파일이 없을때
		else {
			// 원래 파일 없으면
			if (proFileId == 0) {
				CertProject.setProFileId(0);
			}
			// 원래 파일 있으면
			else {
				CertProject.setProFileId(proFileId);
			}
		}

		CertProject.setProId(proId);

		dao.projectUpdate(CertProject);

		logger.info("프로젝트 수정 완료");

		return "redirect:detail?proNum=" + proNum;
	}

}
