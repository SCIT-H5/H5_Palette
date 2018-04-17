package com.palette.h5.ego.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.palette.h5.ego.dao.EgoDAO;

@Controller
@RequestMapping(value="ego")
public class EgoController {
<<<<<<< HEAD
	
	private static final Logger logger = LoggerFactory.getLogger(EgoController.class);
	
	@Autowired
	EgoDAO dao;
	
	@RequestMapping(value="certCertificateReadForm",method=RequestMethod.GET)
	public String test(){
				
		return "ego/certCertificateReadForm";
	}
	
	// history page로 이동 (userId는 session값으로 넣음)
	@RequestMapping(value="historyReadForm", method=RequestMethod.GET)
	public String historyReadForm(Model model, HttpSession session){
		
		logger.info("CON | historyReadForm로 이동 시작 ");
		
/*		String s
		
		ArrayList<History> list = dao.selectHistoryAll(id);
		
		for()*/
		
		
		logger.info("CON | historyReadForm로 이동 종료 ");
		return "";
	}
	
	// history WriteForm으로 이동
	@RequestMapping(value="historyWriteForm", method=RequestMethod.POST)
	public String historyWriteForm(){
		
		logger.info("CON | history 글쓰기 폼으로 이동 시작");
		
		logger.info("CON | history 글쓰기 폼으로 이동 종료");
		return "ego/history/historyWriteForm";
	}
	
	// history 추가
	@RequestMapping(value="historyWrite", method=RequestMethod.POST)
	public String historyWrite(){
		
		logger.info("CON | history 글쓰기 시작");
		
		
		
		
		logger.info("CON | history 글쓰기 종료");
		return "redirect:historyReadForm";
	}
	
	// history updateForm으로 이동
	@RequestMapping(value="", method=RequestMethod.POST)
	public String historyUpdateForm(){
		
		logger.info("CON | history 수정 폼으로 이동 시작");
		logger.info("CON | history 수정 폼으로 이동 종료 ");
		return ""; 
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
	
	
	
}	
/*	
	// swot 기본 글 읽기
	@RequestMapping(value="swotRead",method=RequestMethod.GET)
	public String swotRead(Model model){
		
		logger.info("CON | 글 읽기 시작");
		
		// swotRead 페이지에서 글작성버튼 생성여부 판단 
		
		logger.info("CON | 글 읽기 종료");
		return "ego/swotRead";
	}
	
	// swot 글 작성 폼 이동
	@RequestMapping(value="swotWriteForm", method=RequestMethod.GET)
	public String swotWriteForm(){
		
		logger.info("CON | 글 작성 시작");
		
		logger.info("CON | 글 작성 종료");
		return "ego/swotWriteForm";
	}
		
	// swot 글 작성 
	@RequestMapping(value="swotWrite", method=RequestMethod.POST)
	public String swotWrite(){
		
		logger.info("CON | 글 작성 시작");
		
		
		logger.info("CON | 글 작성 종료");
		return "redirect:swotRead";
	}
	
	
	
	// swot 글 수정 폼이동
	@RequestMapping(value="", method=RequestMethod.POST)
	public String swotUpdateForm(){
		
		logger.info("CON | 글 수정Form이동 시작");
		
		
		
		logger.info("CON | 글 수정Form이동 시작");
		
		
		return "ego/swotUpdateForm";
	}
	
	// swot 글 수정
	@RequestMapping(value="", method=RequestMethod.POST)
	public String swotUpdate(){
		
		logger.info("CON | 글 수정 시작");
		
		
		logger.info("CON | 글 수정 시작");
		
		
		return "redirect:swotRead";
	}
	
	
	// swot 글 리셋
	@RequestMapping(value="", method=RequestMethod.POST)
	public String swotReset(){
		
		
		return "redirect:swotRead";
	}

}
*/

	



=======
   
   private static final Logger logger = LoggerFactory.getLogger(EgoController.class);
   
   @Autowired
   EgoDAO egoDao;
   
   // swot 기본 글 읽기
   @RequestMapping(value="swotRead",method=RequestMethod.GET)
   public String swotRead(HttpSession session){
      logger.info("CON | SWOT 글읽기 시작");
      
      
      //세선에서 아이디를 받아올 변수
      String id = (String)session.getAttribute("loginId");


      //스왓분석 DB를 리턴받음
//      Swot readSWOT = egoDao.readswot(id);
      
//      if (readSWOT == null) {
//         logger.info("SWOT분석을 읽어온 데이터가 없습니다.");
//      } else {
//         logger.info("SWOT분석을 읽어온 데이터가 있습니다.");
//      }
//      
//      //읽혀온 스왓을 리턴해줌
//      session.setAttribute("swotlist", readSWOT);
      
      // swotRead 페이지에서 글작성버튼 생성여부 판단 
      
      logger.info("CON | SWOT 글읽기 종료");
      return "ego/swot/swotReadForm";
   }
   
   // swot 글 작성 폼 이동
   @RequestMapping(value="swotWriteForm", method=RequestMethod.GET)
   public String swotWriteForm(){
      
      logger.info("CON | 글 작성 이동 시작");
      
      logger.info("CON | 글 작성 이동 종료");
      return "ego/swot/swotWriteForm";
   }
      
   // swot 글 작성 
   @RequestMapping(value="swotWrite", method=RequestMethod.POST)
   public String swotWrite(HttpSession session, String swotS, String swotW, String swotO, String swotT){
      logger.info("CON | SWOT 글 작성 시작");
      
      //세선에서 아이디를 받아올 변수
      String id = (String)session.getAttribute("loginId");
      
      //데이터를 DAO에 넘겨줌
//      int result = egoDao.writeswot(id, swotS, swotW, swotO, swotT);
      
//      if (result != 0) {
//         logger.info("CON | SWOT 입력 성공");
//      }else {
//         logger.info("CON | SWOT 입력 실패");         
//      }
//      
//      
//      logger.info("CON | SWOT 글 작성 종료");
      return "redirect:swot/swotRead";
   }
   
   
   
   // swot 글 수정 폼이동
   @RequestMapping(value="swotUpdateFrom", method=RequestMethod.POST)
   public String swotUpdateForm(){
      
      logger.info("CON | SWOT 수정 이동 시작");
      
      
      
      
      logger.info("CON | SWOT 수정 이동 시작");
      
      
      return "ego/swot/swotUpdateForm";
   }
   
   // swot 글 수정
   @RequestMapping(value="swotUpdate", method=RequestMethod.POST)
   public String swotUpdate(HttpSession session,String swotS, String swotW, String swotO, String swotT){
      logger.info("CON | SWOT 수정 시작");
      
      //세선에서 아이디를 받아올 변수
      String id = (String)session.getAttribute("loginId");

//      int result = egoDao.updateswot(id, swotS, swotW, swotO, swotT);

//      if (result != 0) {
//         logger.info("CON | SWOT 입력 성공");
//      }else {
//         logger.info("CON | SWOT 입력 실패");         
//      }
      
      logger.info("CON | SWOT 수정 종료");
      return "ego/swot/swotRead";
   }
   
//   
//   // swot 글 리셋
//   public String swotReset(){
//      
//      
//      return "redirect:swotRead";
//   }




   //personality 읽기
   @RequestMapping(value="personalityRead", method=RequestMethod.GET)
   public String personalityRead(HttpSession session){
      logger.info("CON | 성격분석 읽기 시작");

      //세선에서 아이디를 받아올 변수
      String id = (String)session.getAttribute("loginId");
      
//      Personality readPersonality = egoDao.readpersonality(id);
      
//      if (readPersonality == null) {
//         logger.info("SWOT분석을 읽어온 데이터가 없습니다.");
//      } else {
//         logger.info("SWOT분석을 읽어온 데이터가 있습니다.");
//      }
//      
//      session.setAttribute("personalitylist", readPersonality);
//      
      logger.info("CON | 성격분석 읽기 종료");
      return "ego/personality/personalityReadForm";
   }
   
} //endEgoController
>>>>>>> 4-4훈모브런치
