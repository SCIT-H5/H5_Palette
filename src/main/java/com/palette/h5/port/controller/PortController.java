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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	final String uploadPath = "/upload"; 
	
	@RequestMapping(value = "my_port", method = RequestMethod.GET)
	public String myPortfolio(Model model, HttpSession session){
		
		logger.info("내 포트폴리오 이동 시작");
		String portId = (String)session.getAttribute("loginId");
		ArrayList<Portfolio> portList = dao.portList(portId);
		model.addAttribute("portList", portList);
		logger.info("내 포트폴리오 이동 완료");
		
		return "port/my_port";
	}

	@RequestMapping(value = "newPort", method = RequestMethod.GET)
	public String home(Locale locale) {
		logger.info("포트폴리오 제작 페이지 이동");
		
		return "port/portfolio";
	}

	@RequestMapping(value = "portSave", method = RequestMethod.POST)
	public String jspFileTest(Portfolio portfolio) {
		logger.info("Controller | 포트폴리오 저장 시작");
		
		System.out.println("html: "+ portfolio.getPortContent());
		dao.portSave(portfolio);
		
		logger.info("Controller | 포트폴리오 저장 종료");
		return "redirect:../main";
	}
	
	@RequestMapping(value = "portView", method = RequestMethod.GET)
	public String jspFileTest(Model model, Portfolio portfolio, HttpSession session) {
		logger.info("Controller | 포트폴리오 보기 시작");
		Portfolio port = dao.portSelectOne(portfolio);
		String id = (String)session.getAttribute("loginId");
		if(port.getPortOpen() == 0 && !port.getPortId().equals(id)){
			logger.info("Controller | 미공개 포트폴리오");
			return "redirect:/main";
		}
		model.addAttribute("port", port);
		logger.info("Controller | 포트폴리오 보기 종료");
		return "port/portfolioView";
	}
	
	@RequestMapping(value = "portUpdateForm", method = RequestMethod.POST)
	public String portUpdateForm(Model model, Portfolio portfolio) {
		logger.info("Controller | 포트폴리오 수정 페이지 이동 시작");
		
		Portfolio port = dao.portSelectOne(portfolio);
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
		return "redirect:portView?portNum="+portfolio.getPortNum()+"&portId="+portfolio.getPortId();
	}
	
	@RequestMapping(value = "portDelete", method = RequestMethod.POST)
	public String portDelete(Model model, Portfolio portfolio) {
		logger.info("Controller | 포트폴리오 삭제 시작");
		
		dao.portDelete(portfolio);
		
		logger.info("Controller | 포트폴리오 삭제  종료");
		return "redirect:my_port";
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
