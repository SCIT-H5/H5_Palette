package com.palette.h5.port.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.palette.h5.ego.vo.Reply;
import com.palette.h5.port.controller.PortController;
import com.palette.h5.port.dao.PortDAO;
import com.palette.h5.util.FileService;
import com.palette.h5.vo.Portfolio;

@Controller
@RequestMapping("port")
public class PortController {
	
	@Autowired
	PortDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(PortController.class);
	
	final String uploadPath = "/certProject"; 
	
	//새 포토폴리오 이동
	@RequestMapping(value = "newPort", method = RequestMethod.GET)
	public String home(Locale locale) {
		logger.info("포트폴리오 제작 페이지 이동");
		
		return "port/portfolio";
	}
	//작성 포폴 저장
		@RequestMapping(value = "portSave", method = RequestMethod.POST)
		public String jspFileTest(Portfolio portfolio) {
			logger.info("Controller | 포트폴리오 저장 시작");
			
			System.out.println("html: "+ portfolio.getPortContent());
			dao.portSave(portfolio);
			
			logger.info("Controller | 포트폴리오 저장 종료");
			return "redirect:../main";
		}
	//내 포토폴리오 이동
	@RequestMapping(value = "my_port", method = RequestMethod.GET)
	public String myPortfolio(Model model, HttpSession session){
		
		logger.info("내 포트폴리오 이동 시작");
		String portId = (String)session.getAttribute("loginId");
		ArrayList<Portfolio> portList = dao.portList(portId);
		model.addAttribute("portList", portList);
		logger.info("내 포트폴리오 이동 완료");
		
		return "port/my_port";
	}
	//ajax - 리플 출력
	@ResponseBody
	@RequestMapping(value = "portReplyList", method = RequestMethod.POST)
	public ArrayList<Reply> portReplyList(int portNum){
		ArrayList<Reply> replyList = null;
		replyList = dao.commentView(portNum);
		System.out.println("에이젝스로 넘어옴"+replyList);
		return replyList;
	}
	
	//작성한 포폴 보기
	@RequestMapping(value = "portView", method = RequestMethod.GET)
	public String jspFileTest(Model model, Portfolio portfolio, HttpSession session) {
		logger.info("Controller | 포트폴리오 보기 시작");
		Portfolio port = dao.portSelectOne(portfolio);

		String id = (String)session.getAttribute("loginId");
		if(port.getPortOpen() == 0 && !port.getPortId().equals(id)){
			logger.info("Controller | 미공개 포트폴리오");
			return "redirect:/main";
		}

		System.out.println("포폴 내용"+port);
		

		model.addAttribute("port", port);
		
	
		logger.info("Controller | 포트폴리오 보기 종료");
		return "port/portfolioView";
	}
	
	@RequestMapping(value = "portUpdateForm", method = RequestMethod.POST)
	public String portUpdateForm(Model model, Portfolio portfolio) {
		logger.info("Controller | 포트폴리오 수정 페이지 이동 시작");
		
		Portfolio port = dao.portSelectOne(portfolio);
		System.out.println("수정페이지 포폴 내용 : "+port);
		logger.info("Controller | "+ port.getPortContent());
		model.addAttribute("port", port);
		logger.info("Controller | 포트폴리오 수정 페이지 이동 종료");
		return "port/portfolio";
	}
	
	@RequestMapping(value = "portUpdate", method = RequestMethod.POST)
	public String portUpdate(Model model, Portfolio portfolio) {
		logger.info("Controller | 포트폴리오 수정 시작");
		
		dao.portUpdate(portfolio);
		
		logger.info("Controller | 포트폴리오 수정  종료");
		return "port/updateComplete";
	}
	

	@RequestMapping(value = "portDelete", method = RequestMethod.POST)
	public String portDelete(Model model, Portfolio portfolio) {
		logger.info("Controller | 포트폴리오 삭제 시작");
		
		dao.portDelete(portfolio);
		
		logger.info("Controller | 포트폴리오 삭제  종료");
		return "redirect:my_port";
	}
	

	//리플 작성
	@RequestMapping(value = "replyWrite", method = RequestMethod.POST)
	public String replyWrite(Reply reply, HttpSession session, Model model) {
			logger.info("Controller | 리플 작성 시작");
			
			
			
			//세션에서 로그인한 사용자의 아이디를 읽어서 Reply객체의 작성자 정보에 세팅
			String custId = (String) session.getAttribute("loginId");
			reply.setCommentID(custId);
			
			dao.commentwrite(reply);
			
			logger.info("Controller | 리플 작성  종료");
			return "redirect:my_port";
		}
	//리플수정
	@RequestMapping (value="replyEdit", method=RequestMethod.POST)
	public String replyEdit(Reply reply, HttpSession session) {
		logger.info("Controller | 리플 수정 시작");
		//삭제할 리플 정보와 본인 글인지 확인할 로그인아이디
		String custId = (String) session.getAttribute("loginId");
		reply.setCommentID(custId);
		
		
		//리플  수정 처리
		dao.commentUpdate(reply);
		
		logger.info("Controller | 리플 수정  종료");
		//원래의 글읽기 화면으로 이동 
		return "redirect:my_port?replyportNum=" + reply.getReplyportNum();
	}
	//리플삭제
	@RequestMapping (value="replyDelete", method=RequestMethod.GET)
	public String commentDel(Reply reply, HttpSession session) {
		logger.info("Controller | 리플 삭제 시작");
		//삭제할 리플 정보와 본인 글인지 확인할 로그인아이디
		String custId = (String) session.getAttribute("loginId");
		reply.setCommentID(custId);
		
		//리플  수정 처리
		dao.commentDel(reply);
		
		logger.info("Controller | 리플 삭제  종료");
		//원래의 글읽기 화면으로 이동 
		return "redirect:my_port?replyportNum=" + reply.getReplyportNum();
	}

	@RequestMapping(value="uploadfile", method=RequestMethod.POST)
	public String writeBoard(MultipartFile upload, Model model){
		String result = "";
		HashMap<String, Object> params = new HashMap<String, Object>();
		if(!upload.isEmpty()){
			String savedfile = FileService.saveFile(upload, uploadPath);
			String originfile = upload.getOriginalFilename();
			result = "success";
			params.put("savefile", savedfile);
			params.put("originfile", originfile);
			params.put("result", result);
			model.addAttribute("params", params);
			
		}
		return "fileIcon";
	}
	
	//위젯 이미지추가controller
	@ResponseBody
	@RequestMapping(value="fileupload", method = RequestMethod.POST)
	public String fileupload(MultipartHttpServletRequest request) {
        Iterator<String> itr =  request.getFileNames();
        String fullpath = "";
        if(itr.hasNext()) {
            MultipartFile mpf = request.getFile(itr.next());
            System.out.println(request.getServletContext().getRealPath("/resource/image/"));
            try {
                System.out.println("file length : " + mpf.getBytes().length);
                System.out.println("file name : " + mpf.getOriginalFilename());
        		if (!mpf.isEmpty()) {
        			String savedfile = FileService.saveFile(mpf, request.getServletContext().getRealPath("/resources/image/"));
        			fullpath =  "/h5/resources/image/" +savedfile;
        		}
            } catch (IOException e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
                
            }
            return fullpath;
        } else {
            return fullpath;
        }
    }
	
	@RequestMapping(value="download", method=RequestMethod.GET)
	public void fileDownload(String originfile, String savefile, HttpServletResponse response){
		//원래 파일명 response Header에 인코딩해서 등록
		if(originfile == null)
			return;
		
		try{
			//필수! 복붙해서 사용.
			response.setHeader("Content-Disposition", 
					"attachment;filename="+URLEncoder.encode(originfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//outputstream을 연결
		//저장된 파일 경로
		String fullPath = uploadPath + "/" + savefile;
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		
		try{
			fis = new FileInputStream(fullPath);
			sos = response.getOutputStream();
			
			FileCopyUtils.copy(fis, sos);
			
			fis.close();
			sos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
