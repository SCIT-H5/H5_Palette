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

import com.palette.h5.ego.dao.EgoDAO;
import com.palette.h5.ego.vo.CertProject;
import com.palette.h5.ego.vo.CertProjectDetail;
import com.palette.h5.ego.vo.Swot;

@Controller
@RequestMapping(value = "ego")
public class EgoController {

	private static final Logger logger = LoggerFactory.getLogger(EgoController.class);

	@Autowired
	EgoDAO dao;

	@RequestMapping(value = "certCertificateReadForm", method = RequestMethod.GET)
	public String test() {

		return "ego/certCertificateReadForm";
	}
	
/*
	// history page로 이동 (userId는 session값으로 넣음)
	@RequestMapping(value = "historyReadForm", method = RequestMethod.GET)
	public String historyReadForm(Model model, HttpSession session) {

		logger.info("CON | historyReadForm로 이동 시작 ");

		// ArrayList<History> list = dao.selectHistoryAll(id);

		logger.info("CON | historyReadForm로 이동 종료 ");

		return "";
	}

	// history WriteForm으로 이동
	@RequestMapping(value = "historyWriteForm", method = RequestMethod.POST)
	public String historyWriteForm() {

		logger.info("CON | history 글쓰기 폼으로 이동 시작");

		logger.info("CON | history 글쓰기 폼으로 이동 종료");
		return "ego/history/historyWriteForm";
	}

	// history 추가
	@RequestMapping(value = "historyWrite", method = RequestMethod.POST)
	public String historyWrite() {

		logger.info("CON | history 글쓰기 시작");

		logger.info("CON | history 글쓰기 종료");
		return "redirect:historyReadForm";
	}

	// history updateForm으로 이동
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String historyUpdateForm() {

		logger.info("CON | history 수정 폼으로 이동 시작");
		logger.info("CON | history 수정 폼으로 이동 종료 ");
		return "";
	}

	// history 수정
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String historyUpdate() {

		logger.info("CON | history 수정 시작");
		logger.info("CON | history 수정 종료 ");
		return "";
	}

	// history 삭제
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String historyDelete() {

		logger.info("CON | history 삭제 시작");
		logger.info("CON | history 삭제 종료 ");
		return "";
	}

*/	
	
	
	 //swot 기본 글 읽기
	 @RequestMapping(value="swotReadForm",method=RequestMethod.GET) 
	  public String swotRead(HttpSession session){
	  
	  logger.info("CON | SWOT 글읽기 시작");
	  
	  //세선에서 아이디를 받아올 변수 
	  String swotId = (String)session.getAttribute("loginId");
	  System.out.println("유저 아이디는 : "+swotId);
	  
	  //스왓분석 DB를 리턴받음 
	  Swot readSWOT = dao.readswot(swotId);
	  System.out.println(readSWOT);
	  if (readSWOT == null) { 
		  logger.info("SWOT분석을 읽어온 데이터가 없습니다."); 
		  } else {
			  logger.info("SWOT분석을 읽어온 데이터가 있습니다."); 
			  }
	  
	  //읽혀온 스왓을 리턴해줌 
	  session.setAttribute("swotlist", readSWOT);
	  
	  // swotRead 페이지에서 글작성버튼 생성여부 판단
	  
	  logger.info("CON | SWOT 글읽기 종료"); 
	  return "ego/swotReadForm"; 
	  }
	  
	  //swot 글 작성 폼 이동
	  
	 @RequestMapping(value="swotWriteForm", method=RequestMethod.GET) 
	 public String swotWriteForm(){
	  
	 logger.info("CON | 글 작성 이동 시작");
	  
	 logger.info("CON | 글 작성 이동 종료");
	  
	 return "ego/swotWriteForm"; 
	 }
	  
	 // swot 글 작성
	  
	  @RequestMapping(value="swotWrite", method=RequestMethod.POST) 
	  public String swotWrite(HttpSession session, Swot swot){
	  
	  logger.info("CON | SWOT 글 작성 시작");
	  
	  //세선에서 아이디를 받아올 변수 
	  String swotId = (String)session.getAttribute("loginId");
	  swot.setSwotId(swotId);
	  //데이터를 DAO에 넘겨줌 
	 int result = dao.writeswot(swot);
	  
	  if (result != 0){ 
		  logger.info("CON | SWOT 입력 성공"); 
		  } else {
	          logger.info("CON | SWOT 입력 실패"); 
	        }
	  
	  
	  logger.info("CON | SWOT 글 작성 종료"); 
	  return "ego/swot/swotComplete"; 
	  }
	  
	  //swot분석 작성 글 임시 저장
	  @RequestMapping(value="re_swotWrite", method=RequestMethod.POST) 
	  public String re_swotWrite(Model model, String swotS, String swotW, String swotO, String swotT){
	  
	  logger.info("CON | SWOT 글 작성 임시 저장 창고 시작");
	  System.out.println("넘어온 값들 : "+ swotS + swotW);
	 
	  
	  logger.info("CON | SWOT 글 작성 저장 창고 종료"); 
	  
	  return "redirect:swotReadForm"; 
	  }
	 // swot 글 수정 폼이동
	  
	 @RequestMapping(value="swotUpdateForm", method=RequestMethod.GET) 
	 public String swotUpdateForm(){
	  
	  logger.info("CON | SWOT 수정 이동 시작");
	  
	  logger.info("CON | SWOT 수정 이동 종료");
	  
	  return "ego/swotUpdateForm"; 
	  }
	 
	 // swot 글 수정
	  
	  @RequestMapping(value="swotUpdate", method=RequestMethod.POST) 
	  public String swotUpdate(HttpSession session,Swot swot){ 
		  
		  logger.info("CON | SWOT 수정 시작");
	  
	  //세선에서 아이디를 받아올 변수 
	  String swotId = (String)session.getAttribute("loginId");
	  swot.setSwotId(swotId);
	  
	  int result = dao.updateswot(swot);
	  
	  if (result != 0) { 
		  logger.info("CON | SWOT 수정 성공"); 
		  }else {
	  logger.info("CON | SWOT 수정 실패"); 
	  }
	  
	  logger.info("CON | SWOT 수정 종료"); 
	  
	  return "ego/swot/swotComplete"; 
	  }
	  
	// swot 글 삭제
	  
	@RequestMapping(value="deleteswot", method=RequestMethod.GET) 
	public String deleteswot(HttpSession session){ 
			  
	logger.info("CON | SWOT 삭제 시작");
	//세선에서 아이디를 받아올 변수 
	  String swotId = (String)session.getAttribute("loginId");
	  
		  
	int result = dao.deleteswot(swotId);
		  
	if (result != 0) { 
		logger.info("CON | SWOT 삭제 성공"); 
	}else {
		  logger.info("CON | SWOT 삭제 실패"); 
		  }
		  
		  logger.info("CON | SWOT 삭제 종료"); 
		  
	 return "redirect:swotReadForm"; 
		  }
	 /* // swot 글 리셋 public String swotReset(){
	 * 
	 * 
	 * return "redirect:swotRead"; }
	 * 
	 * //personality 읽기
	 * 
	 * @RequestMapping(value="personalityRead", method=RequestMethod.GET) public
	 * String personalityRead(HttpSession session){
	 * logger.info("CON | 성격분석 읽기 시작");
	 * 
	 * //세선에서 아이디를 받아올 변수 String id = (String)session.getAttribute("loginId");
	 * 
	 * Personality readPersonality = EgoDAO.readpersonality(id);
	 * 
	 * if (readPersonality == null) { logger.info("SWOT분석을 읽어온 데이터가 없습니다."); }
	 * else { logger.info("SWOT분석을 읽어온 데이터가 있습니다."); }
	 * 
	 * session.setAttribute("personalitylist", readPersonality);
	 * 
	 * logger.info("CON | 성격분석 읽기 종료"); return
	 * "ego/personality/personalityReadForm"; }
	 */

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

}