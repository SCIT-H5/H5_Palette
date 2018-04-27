package com.palette.h5.ego.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.palette.h5.ego.dao.FileDAO;
import com.palette.h5.ego.vo.CertGrad;
import com.palette.h5.upload.vo.MediaUtils;
import com.palette.h5.upload.vo.UploadFileUtils;
import com.palette.h5.vo.FileManagement;

@Controller
public class FileController {
	
	   private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	   
	   @Autowired
	   FileDAO dao;
	   
	   //servlet-context.xml에 설정해둔 파일업로드 경로
	   //bean의 id가 uploadPath인 태그를 참조
	   @Resource(name="uploadPath")
	   String uploadPath;
	   
	   // 업로드 흐름 : 업로드 버튼클릭 => 임시디렉토리에 업로드=> 지정된 디렉토리에 저장 => 파일정보가 file에 저장
	   
	   // (# Ajax 업로드 page mapping)
	   
	   // 01. certGradeReadFrom page로 이동 
	   @RequestMapping(value="ego/cert/certGradeReadForm", method=RequestMethod.GET)
	   public String certGradeReadForm(){
	       // uploadAjax.jsp로 포워딩
		   return "ego/cert/certGradeReadForm";
	   }
	   
	   // 02. certScholarshipReadForm page로 이동
	   @RequestMapping(value="ego/cert/certScholarshipReadForm", method=RequestMethod.GET)
	   public String certScholarshipReadForm(){
	       // uploadAjax.jsp로 포워딩
		   return "ego/cert/certScholarshipReadForm";
	   }
	   
	   // (# Ajax업로드 처리 매핑) in certGrad
	   // 파일의 한글처리 : produces="text/plain;charset=utf-8"
	   @ResponseBody // view가 아닌 data리턴
	   @RequestMapping(value="uploadAjax01", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	   public ResponseEntity<String> uploadAjax(MultipartFile file, HttpSession session) throws Exception {
		   
		  logger.info(" CON | certGrad fileupload 시작");
		   
		   //logger.info("originalName : "+file.getOriginalFilename());
	       //logger.info("size : "+file.getSize());
	       //logger.info("contentType : "+file.getContentType());
	       //System.out.println(uploadPath);	// c:
	       //System.out.println(file);		// org.springframework.web.multipart.commons.CommonsMultipartFile@712206e3
	       
	      FileManagement fileData = new FileManagement();
	      
	      String fileUserId = (String) session.getAttribute("loginId");
	      
	      fileData.setFileUserId(fileUserId);
	      fileData.setFileDivision(1);	//cerGrad의 division은 1
	      fileData.setOriginalFileName(file.getOriginalFilename());
	      fileData.setSavedFileName(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()));
	      
	      int uploadFM = dao.uploadAjax(fileData);
	      if(uploadFM!=0){
	    	  logger.info("certGrad | filemanagement table에서 fileupload 실패");
	      }
	      
	      int seq = fileData.getIdx();
	      // 등록한 데이터에 따른 현재 시퀀스 값 가져오기
	      
	      CertGrad certgrad = new CertGrad();
	      certgrad.setGradId(fileUserId);
	      certgrad.setGradFileId(seq);
	      int uploadCertGrad = dao.insertCertGradOne(certgrad);
	      if(uploadCertGrad !=0){
	    	  logger.info("certGrad | certGrad table에서 fileupload 실패");
	      }
	      
	      logger.info(" CON | certGrad fileupload 종료");
	      return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	      // -> 최종적으로 return (new) uploadedFileName;
	   }
	   

	    // (# Ajax 이미지 표시 매핑)
	    @ResponseBody // view가 아닌 data리턴
	    @RequestMapping("displayFile01")
	    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
	        // 서버의 파일을 다운로드하기 위한 스트림
	    	InputStream in = null; //java.io
	        ResponseEntity<byte[]> entity = null;
	        try {
	            // 확장자를 추출하여 formatName에 저장
	            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	            // 추출한 확장자를 MediaUtils클래스에서  이미지파일여부를 검사하고 리턴받아 mType에 저장
	            MediaType mType = MediaUtils.getMediaType(formatName);
	            		
	            // 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
	            HttpHeaders headers = new HttpHeaders();
	            // InputStream 생성
	            in = new FileInputStream(uploadPath + fileName);
	            // 이미지 파일이면
	            if (mType != null) { 
	                headers.setContentType(mType);
	            // 이미지가 아니면
	            } else { 
	                fileName = fileName.substring(fileName.indexOf("_") + 1);
	                // 다운로드용 컨텐트 타입
	                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	                // 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 서유럽언어, 큰 따옴표 내부에  " \" 내용 \" "
	                // 파일의 한글 깨짐 방지
	                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
	                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
	            }
	            // 바이트배열, 헤더, HTTP상태코드
	            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // HTTP상태 코드()
	            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	        } finally {
	            in.close(); //스트림 닫기
	        }
	        return entity;
	    }

	    // 파일 삭제 매핑
	    @ResponseBody // view가 아닌 데이터 리턴
	    @RequestMapping(value = "deleteFile01", method = RequestMethod.POST)
	    public ResponseEntity<String> deleteFile(String fileName) {
	        // 파일의 확장자 추출
	        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	        // 이미지 파일 여부 검사
	        MediaType mType = MediaUtils.getMediaType(formatName);
	        // 이미지의 경우(썸네일 + 원본파일 삭제), 이미지가 아니면 원본파일만 삭제
	        // 이미지 파일이면
	        if (mType != null) {
	            // 썸네일 이미지 파일 추출
	            String front = fileName.substring(0, 12);
	            String end = fileName.substring(14);
	            // 썸네일 이미지 삭제
	            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
	        }
	        // 원본 파일 삭제
	        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

	        // 데이터와 http 상태 코드 전송
	        return new ResponseEntity<String>("deleted", HttpStatus.OK);
	    }	   

}
