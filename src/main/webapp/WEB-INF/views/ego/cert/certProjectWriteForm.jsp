<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정수정</title>

<!-- Custom styles for this template -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main_page.css">
   
   
   
   <!-- Bootstrap core CSS -->
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">

    <!-- Custom fonts for this template -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.css">
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'>
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'>

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/creative.css">
   
   <!-- jQuery -->
   <script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
<script>
//글쓰기폼 확인
function formCheck() {
	var title = document.getElementById('title');
	var content = document.getElementById('content');
	
	if (title.value == null) {
		alert("제목을 입력하세요.");
		title.focus();
		title.select();
		return false;
	}
	if (content.value == null) {
		alert("내용을 입력하세요.");
		title.focus();
		title.select();
		return false;
	}
	
	return true;
}
</script>	
</head>
<body id="page-top">
   <!-- Navigation -->
   <%@include file="/WEB-INF/views/navi.jsp"%>    
   <header id="bg-primary" style="height:70px; background-color: black;"></header>
<div class="centerdiv">

<h2>[ 디테일 작성 폼 ]</h2>

	


<form id="projecDetailtWrite" action="projecDetailtWrite"  method="post" 
	enctype="multipart/form-data" onsubmit="return formCheck();">
	
	<!-- 폼 전송 시 글번호도 전달 -->
	<input type="hidden" name="proNum" value="${result.proNum }">	
	
	
	
<table border="1">
			<tr>
				<th>프로젝트 주제</th>
				<td><input type="text" name="proDetailTitle" id="proDetailTitle" style="width:400px;" value="${result.proTitle}"></td>
			</tr>
			<tr>
				<th>과목명</th>
				<td><input type="text" name="proDetailEdu" id="proDetailEdu" style="width:400px;" value="${result.proEdu}" ></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><input type="text" name="proDetailDate" id="proDetailDate" style="width:400px;" value="${resultDetail.proDetailDate}" ></td>
			</tr>
			<tr>
				<th>상세내용</th>
				<td><textarea name="proDetailContent" id="proDetailContent" style="width:400px;height:200px;resize:none;" >${resultDetail.proDetailContent}</textarea></td>
			</tr>
			<tr>
			<td>파일첨부</td> 
			<td>
				<!-- 새로 첨부할 파일 선택 -->
				<input type="file" name="upload" size="30">
				<!-- 기존에 첨부한 파일이 있는 경우 출력 -->
				${board.originalfile}
			</td>
		</tr>
		<tr>
			<td colspan="2" class="white center">
		<input type="submit" value="수정">
			</td> 
		</tr>
</table>
</form>

</div>
</body>
</html>