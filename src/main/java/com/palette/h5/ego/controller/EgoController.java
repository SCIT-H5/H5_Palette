package com.palette.h5.ego.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.palette.h5.dao.UserinfoDAO;
import com.palette.h5.ego.dao.EgoDAO;
import com.palette.h5.ego.vo.History;
import com.palette.h5.ego.vo.PersonalityList;
import com.palette.h5.ego.vo.Swot;
import com.palette.h5.port.dao.PortDAO;
import com.palette.h5.vo.Portfolio;
import com.palette.h5.vo.Userinfo;


@Controller
@RequestMapping(value = "ego")
public class EgoController {

	private static final Logger logger = LoggerFactory.getLogger(EgoController.class);

	@Autowired
	EgoDAO dao;	
	UserinfoDAO userdao;
	
	@Autowired
	PortDAO portdao;

	// swot 기본 글 읽기

	@RequestMapping(value = "swot/swotReadForm", method = RequestMethod.GET)
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

	@RequestMapping(value = "swot/swotWriteForm", method = RequestMethod.GET)
	public String swotWriteForm() {

		logger.info("CON | 글 작성 이동 시작");

		logger.info("CON | 글 작성 이동 종료");

		return "ego/swot/swotWriteForm";
	}

	// swot 글 작성
	@RequestMapping(value = "swot/swotWrite", method = RequestMethod.POST)
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
	@RequestMapping(value = "swot/swotUpdateForm", method = RequestMethod.GET)
	public String swotUpdateForm() {

		logger.info("CON | SWOT 수정 이동 시작");

		logger.info("CON | SWOT 수정 이동 종료");

		return "ego/swot/swotUpdateForm";
	}

	// swot 글 수정

	@RequestMapping(value = "swot/swotUpdate", method = RequestMethod.POST)
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
	@RequestMapping(value = "swot/deleteswot", method = RequestMethod.GET)
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
       ArrayList<String> classplus = new ArrayList<String>();
       classplus.add("is-hidden timeline-item");
       classplus.add("is-hidden timeline-item inverted");
       
       model.addAttribute("hisAll", hisAll);
       model.addAttribute("classname", classplus);
       
       
//       if(hisAll == null){
//          logger.info("CON | historyReadForm로 이동 실패");
//          return "redirect:/";
//       }
   
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


	@RequestMapping(value = "personalityReadForm", method = RequestMethod.GET)
	public String personalityReadForm(Model model) {
		logger.info("성격분석 폼으로 이동");
		
		ArrayList<PersonalityList> list = dao.personalityList();
		model.addAttribute("personalityList", list);
		logger.info(list.toString());
		logger.info("성격분석 폼으로 이동 완료 ");
		// model.addAttribute("proNum");

		return "ego/personalityReadForm";
	}
	
	//마이페이지 정보 이동
	@RequestMapping(value = "myInfo", method = RequestMethod.GET)
	public String MyInformation(Model model, HttpSession session) {
		logger.info("마이페이지/ 정보페이지 이동 시작");
		
		String id = (String)session.getAttribute("loginId");
		System.out.println(id);
		ArrayList<Portfolio> portList = portdao.portList(id);
		
		model.addAttribute("portList", portList);
		
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