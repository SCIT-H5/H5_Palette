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

import com.palette.h5.ego.dao.EgoDAO;
import com.palette.h5.ego.vo.History;
import com.palette.h5.ego.vo.Personality;

@Controller
@RequestMapping(value = "ego")
public class EgoController {

   private static final Logger logger = LoggerFactory.getLogger(EgoController.class);

   @Autowired
   EgoDAO dao;

   @RequestMapping(value="certCertificateReadForm",method=RequestMethod.GET)
   public String test() {

      return "ego/certCertificateReadForm";
   }

   
    // history page로 이동 (userId는 session값으로 넣음)
    @RequestMapping(value="/history/historyReadForm", method=RequestMethod.GET)
    public String historyReadForm(Model model, HttpSession session){
   
    	logger.info("CON | historyReadForm로 이동 시작 ");
   
    	String hisId = (String) session.getAttribute("loginId");
    	
    	/*ArrayList<String> yearList = dao.historyYearList(hisId);
    	
    	ArrayList<History> dataPerYear = new ArrayList<>();
    	
        	
        	History historyDPY = new History();
        	historyDPY.setHisId(hisId);
        	//historyDPY.setHisDate(year);
        	
        	dataPerYear = dao.historyDataPerYear(historyDPY);
        	System.out.println(dataPerYear);
    
    	
    	model.addAttribute("dataPerYear", dataPerYear);
    	model.addAttribute("yearList", yearList);*/
    	
    	
    	ArrayList<History> hisAll = dao.historyDataAll(hisId);
    	
    	model.addAttribute("hisAll", hisAll);
    	
//    	if(hisAll == null){
//    		logger.info("CON | historyReadForm로 이동 실패");
//    		return "redirect:/";
//    	}
   
    	logger.info("CON | historyReadForm로 이동 종료 ");
    	return "ego/history/historyReadForm";
    }
    
   
    // history WriteForm으로 이동
    @RequestMapping(value="historyWriteForm", method=RequestMethod.POST)
    public String historyWriteForm(){
   
    	logger.info("CON | history 글쓰기 폼으로 이동 시작");
   
    	logger.info("CON | history 글쓰기 폼으로 이동 종료");
    	return "ego/history/historyWriteForm";
    }
        
    // history 데이터 등록
    @RequestMapping(value="historyWrite", method=RequestMethod.POST)
    public String historyWrite(History history, Model model){
   
    	logger.info("CON | history 글쓰기 시작");
    	
    	// form에서 hidden타입으로 id 넣어줌 session여기서 안써도 ok
    	
    	int result = dao.historyAddOne(history);
    	
    	if(result!=1){
    		logger.info("등록 실패");
    		return "ego/history/historyWriteForm";
    	}
   
    	logger.info("CON | history 글쓰기 종료");
    	return "redirect:historyReadForm";
    }
/*   
    // history updateForm으로 이동
    @RequestMapping(value="historyUpdateForm", method=RequestMethod.POST)
    public String historyUpdateForm(History history, HttpSession session, Model model){
    	// 여기서 매개변수 History history는 hisNo와 hisId를 제공
    		
    	logger.info("CON | history 수정 폼으로 이동 시작");
    	
    	String hisId = (String) session.getAttribute("userId");
    	
    	
    	
    	// 수정을 하는 경우에는 hisId랑 해당 게시글의 hisNo 둘다 일치해야한다.
    	// 해당 hisNo의 글을 들고와서 updateForm에 그 정보를 뿌려줘야함.
    	
    	
    	
    	
    	
    	logger.info("CON | history 수정 폼으로 이동 종료 ");
    	return "ego/history/historyUpdateForm";
    }
   
   
    // history 수정
    @RequestMapping(value="", method=RequestMethod.POST)
    public String historyUpdate(){
   
    	logger.info("CON | history 수정 시작");
    	logger.info("CON | history 수정 종료 ");
    	return "";
    }
   
    // history 삭제
    @RequestMapping(value="", method=RequestMethod.GET)
    public String historyDelete(){
   
    	logger.info("CON | history 삭제 시작");
    	logger.info("CON | history 삭제 종료 ");
    	return "";
    }

  */  
    
    
    
    
   // swot 기본 글 읽기
   // @RequestMapping(value="swotRead",method=RequestMethod.GET)
   // public String swotRead(HttpSession session){
   // logger1.info("CON | SWOT 글읽기 시작");
   //
   //
   // //세선에서 아이디를 받아올 변수
   // String id = (String)session.getAttribute("loginId");
   //
   //
   // //스왓분석 DB를 리턴받음
   // Swot readSWOT = egoDao.readswot(id);
   //
   // if (readSWOT == null) {
   // logger.info("SWOT분석을 읽어온 데이터가 없습니다.");
   // } else {
   // logger.info("SWOT분석을 읽어온 데이터가 있습니다.");
   // }
   //
   // //읽혀온 스왓을 리턴해줌
   // session.setAttribute("swotlist", readSWOT);
   //
   // // swotRead 페이지에서 글작성버튼 생성여부 판단
   //
   // logger1.info("CON | SWOT 글읽기 종료");
   // return "ego/swot/swotReadForm";
   // }

   // swot 글 작성 폼 이동
   // @RequestMapping(value="swotWriteForm", method=RequestMethod.GET)
   // public String swotWriteForm(){
   //
   // logger1.info("CON | 글 작성 이동 시작");
   //
   // logger1.info("CON | 글 작성 이동 종료");
   // return "ego/swot/swotWriteForm";
   // }

   // // swot 글 작성
   // @RequestMapping(value="swotWrite", method=RequestMethod.POST)
   // public String swotWrite(HttpSession session, String swotS, String swotW,
   // String swotO, String swotT){
   // logger1.info("CON | SWOT 글 작성 시작");
   //
   // //세선에서 아이디를 받아올 변수
   // String id = (String)session.getAttribute("loginId");
   //
   // //데이터를 DAO에 넘겨줌
   // int result = egoDao.writeswot(id, swotS, swotW, swotO, swotT);
   //
   // if (result != 0) {
   // logger.info("CON | SWOT 입력 성공");
   // }else {
   // logger.info("CON | SWOT 입력 실패");
   // }
   //
   //
   // logger.info("CON | SWOT 글 작성 종료");
   // return "redirect:swot/swotRead";
   // }

   // // swot 글 수정 폼이동
   // @RequestMapping(value="swotUpdateFrom", method=RequestMethod.POST)
   // public String swotUpdateForm(){
   //
   // logger1.info("CON | SWOT 수정 이동 시작");
   //
   //
   //
   //
   // logger1.info("CON | SWOT 수정 이동 시작");
   //
   //
   // return "ego/swot/swotUpdateForm";
   // }

   // // swot 글 수정
   // @RequestMapping(value="swotUpdate", method=RequestMethod.POST)
   // public String swotUpdate(HttpSession session,String swotS, String swotW,
   // String swotO, String swotT){
   // logger1.info("CON | SWOT 수정 시작");
   //
   // //세선에서 아이디를 받아올 변수
   // String id = (String)session.getAttribute("loginId");
   //
   // int result = egoDao.updateswot(id, swotS, swotW, swotO, swotT);
   //
   // if (result != 0) {
   // logger.info("CON | SWOT 입력 성공");
   // }else {
   // logger.info("CON | SWOT 입력 실패");
   // }
   //
   // logger1.info("CON | SWOT 수정 종료");
   // return "ego/swot/swotRead";
   // }
   //
   //
   // // swot 글 리셋
   // public String swotReset(){
   //
   //
   // return "redirect:swotRead";
   // }

    //personality 읽기
    @RequestMapping(value="personalityRead", method=RequestMethod.GET)
    public String personalityRead(HttpSession session){
    	logger.info("CON | 성격분석 읽기 시작");
   
    	//세선에서 아이디를 받아올 변수
    	String id = (String)session.getAttribute("loginId");
   
    	//Personality readPersonality = dao.readpersonality(id);
   
	    /*if (readPersonality == null) {
	    	logger.info("SWOT분석을 읽어온 데이터가 없습니다.");
	    } else {
	    	logger.info("SWOT분석을 읽어온 데이터가 있습니다.");
	    }*/
   
    	//session.setAttribute("personalitylist", readPersonality);
   
    	logger.info("CON | 성격분석 읽기 종료");
    	return "ego/personality/personalityReadForm";
    }

}