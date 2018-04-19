package com.palette.h5;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

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

import com.palette.h5.ego.dao.EgoDAO;
import com.palette.h5.util.FileService;
import com.palette.h5.vo.FileManagement;

@Controller
public class HomeController {
	
	@Autowired
	EgoDAO egoDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	final String uploadPath = "/H5_Palette/src/main/webapp/resources/file_uploaded";	//파일 업로드 경로
	
	/**
	 *  Home 화면으로
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	/**
	 *  Demo 화면으로
	 */
	@RequestMapping(value = "demo", method = RequestMethod.GET)
	public String demo(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "demo";
	}
	
	/**
	 *	로그인 완료 후 메인 페이지로 
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(){
		
		return "main";
	}
		

	/**
	 * 	파일업로드
	 */
	@ResponseBody
	@RequestMapping(value="certificate", method = RequestMethod.POST)
	public FileManagement certificate(MultipartHttpServletRequest request, HttpServletResponse response) {
		
        Iterator<String> itr =  request.getFileNames(); //파일의 이름을 받아옴
        FileManagement fileManagement = new FileManagement(); //파일매니지먼트 자료형 생성
        if(itr.hasNext()) {
            MultipartFile mpf = request.getFile(itr.next());
            System.out.println(mpf.getOriginalFilename() +" uploaded!");
            try {
                System.out.println("file length : " + mpf.getBytes().length);
                System.out.println("file name : " + mpf.getOriginalFilename());
        		if (!mpf.isEmpty()) {
        			String savedfile = FileService.saveFile(mpf, uploadPath + "/ego_cert");
        			fileManagement.setOriginalFileName(mpf.getOriginalFilename());
        			fileManagement.setSavedFileName(savedfile);
        			egoDao.file_management(fileManagement);
        		}
            } catch (IOException e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
            System.out.println(fileManagement);
            return fileManagement;
        } else {
            return fileManagement;
        }
    }
	
	/**
	 *  파일 다운로드
	 */
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void fileDownload(HttpServletResponse response, String origin , String saved){
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(origin, "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String fullPath = uploadPath + "/" + saved;
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}		
}
