<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Palette - 졸업증명</title>
	<!-- jQuery -->
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
        var size = ${fn:length(fileList)};
        
        <c:forEach items="${fileList}" var="file">
    	alert('${file.savedFileName}');
    	
    	    var data = '${file.savedFileName}';
        	var str = "";
            // 이미지 파일이면 썸네일 이미지 출력
            if(checkImageType(data)){ 
                str = "<div><a href='${path}/h5/displayFile01?fileName="+getImageLink(data)+"'>";
                str += "<img src='${path}/h5/displayFile01?fileName="+data+"'></a>";
            // 일반파일이면 다운로드링크
            } else { 
                str = "<div><a href='${path}/h5/displayFile01?fileName="+data+"'>"+getOriginalName(data)+"</a>";
            }
            // 삭제 버튼
            str += "<span data-src="+data+">[삭제]</span></div>";
            $(".uploadedList01").append(str);
        </c:forEach>
        
        
        // event : jQuery의 이벤트
        // originalEvent : javascript의 이벤트
        $("#upload").on("change", function(event){
            //event.preventDefault(); // 기본효과를 막음
            // 드래그된 파일의 정보
            //var files = event.originalEvent.dataTransfer.files;
            // 첫번째 파일
            var file = $("#upload")[0].files[0];
            // 콘솔에서 파일정보 확인
            console.log(file);

            // ajax로 전달할 폼 객체
            var formData = new FormData();
            // 폼 객체에 파일추가, append("변수명", 값)
            formData.append("file", file);

            $.ajax({
                type: "post",
                url: "/h5/uploadAjax01",
                data: formData,
                // processData: true=> get방식, false => post방식
                dataType: "text",
                // contentType: true => application/x-www-form-urlencoded, 
                //                false => multipart/form-data
                processData: false,
                contentType: false,
                success: function(data){
                	//alert(data);
                	var str = "";
                    // 이미지 파일이면 썸네일 이미지 출력
                    if(checkImageType(data)){ 
                        str = "<div><a href='${path}/h5/displayFile01?fileName="+getImageLink(data)+"'>";
                        str += "<img src='${path}/h5/displayFile01?fileName="+data+"'></a>";
                    // 일반파일이면 다운로드링크
                    } else { 
                        str = "<div><a href='${path}/h5/displayFile01?fileName="+data+"'>"+getOriginalName(data)+"</a>";
                    }
                    // 삭제 버튼
                    str += "<span data-src="+data+">[삭제]</span></div>";
                    $(".uploadedList01").append(str);
                }, error : function(e) {
					alert(JSON.stringify(e));
				}
            });
        });
        
      //업로드한 파일을 목록에서 삭제하기 위해 <span>태그를 클릭 이벤트로 설정
    	$(".uploadedList01").on("click", "span", function(event){
    	    alert("이미지 삭제");
    	    var that = $(this); // 여기서 this는 클릭한 span태그
    	    $.ajax({
    	        url: "../../deleteFile01",
    	        type: "post",
    	        // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
    	        // 태그.attr("속성")
    	        data: {fileName:$(this).attr("data-src")}, // json방식
    	        dataType: "text",
    	        success: function(result){
    	            if( result == "deleted" ){
    	                // 클릭한 span태그가 속한 div를 제거
    	                that.parent("div").remove();
    	            }
    	        }
    	    });
    	});//endtouploadedlist
    	
    });
	
	// 업로드된 파일이 이미지가 아닐 경우 업로드파일 목록에 파일명을 출력해주기 위한 함수
	function getOriginalName(fileName) {
	    // 이미지 파일이면
	    if(checkImageType(fileName)) {
	        return; // 함수종료
	    }
	    // uuid를 제외한 원래 파일 이름을 리턴
	    var idx = fileName.indexOf("_")+1;
	    return fileName.substr(idx);
	}
	
	// 썸네일 이미지를 클릭하면 원본 이미지가 출력될 수 있도록 원본이미지 파일명을 추출하기 위한 함수
	function getImageLink(fileName) {
	    // 이미지파일이 아니면
	    if(!checkImageType(fileName)) { 
	        return; // 함수 종료 
	    }
	    // 이미지 파일이면(썸네일이 아닌 원본이미지를 가져오기 위해)
	    // 썸네일 이미지 파일명 - 파일경로+파일명 /2017/03/09/s_43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    var front = fileName.substr(0, 12); // 년원일 경로 추출
	    var end = fileName.substr(14); // 년원일 경로와 s_를 제거한 원본 파일명을 추출
	    console.log(front); // /2017/03/09/
	    console.log(end); // 43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    // 원본 파일명 - /2017/03/09/43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
	    return front+end; // 디렉토리를 포함한 원본파일명을 리턴
	}
	
	
	// 이미지파일 형식을 체크 ~ 이미지 파일은 썸네일을, 일반 파일이면 원본파일명을 출력해야하니까!
	function checkImageType(fileName) {
	    // i : ignore case(대소문자 무관)
	    var pattern = /jpg|gif|png|jpeg/i; // 정규표현식
	    return fileName.match(pattern); // 규칙이 맞으면 true
	}
	
	</script>
</head>
<body>
	
	<h2> 졸업 증명서 파일 업로드  </h2>
	<!-- 파일을 업로드할 영역 -->
	<form id="uploadAjax01" enctype="multipart/form-data">
		<input type="file" id="upload" name="file-data">
			<!-- <input type="button" id="imgBtn" value="전송"> -->
	</form>
	<!-- 업로드된 파일 목록 -->
	<div class="uploadedList01" style="border: 1px solid black;"></div>
		
<%-- 	<div>
		<form id="${path}/upload/uploadForm" enctype="multipart/form-data">
			<input type="file" id="upload" name="file-data">	<!-- 파일명 뜨는 곳 -->
			<input type="button" id="imgBtn" value="전송">	<!-- 파일 전송 버튼  -->
		</form>
	</div>
	<div id="imgDiv"></div>	<!-- 이미지가 출력되는 div -->
 --%>
</body>
