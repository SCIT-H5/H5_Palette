package com.palette.h5;

import java.io.IOException;
import java.util.Iterator;
import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.palette.h5.util.FileService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 *  Home 화면으로
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	/**
	 *	로그인 완료 후 메인 페이지로 
	 */
	@RequestMapping(value = "common/main", method = RequestMethod.GET)
	public String main(){
		
		return "common/main";
	}
	
	/**
	 * 	파일업로드
	 */
	@ResponseBody
	@RequestMapping(value="fileupload", method = RequestMethod.POST)
	public String fileupload(MultipartHttpServletRequest request) {
		
        Iterator<String> itr =  request.getFileNames();
        String fullpath = "";
        
        if(itr.hasNext()) {
        	
            MultipartFile mpf = request.getFile(itr.next());
            System.out.println(request.getServletContext().getRealPath("/resources/img/user_upload"));
            
            try {
                System.out.println("file length : " + mpf.getBytes().length);
                System.out.println("file name : " + mpf.getOriginalFilename());
        		if (!mpf.isEmpty()) {
        			String savedfile = FileService.saveFile(mpf, request.getServletContext().getRealPath("/resources/img/user_upload"));
        			fullpath =  "./resources/img/user_upload" +savedfile;
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
	
}
