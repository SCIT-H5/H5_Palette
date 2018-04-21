<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>디테일 보기~</title>
<script type="text/javascript">
	function editForm(proNum) {
		location.href = "edit?proNum="+proNum;
	}
</script>
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
</head>
<body id="page-top">
        <!-- Navigation -->
    <%@include file="/WEB-INF/views/navi.jsp"%>    
   <header id="bg-primary" style="height:70px; background-color: black;"></header>>


		<h2>프로젝트 상세페이지이다 여기는...</h2>

		<table border="1">
			<tr>
				<th>프로젝트 주제</th>
				<td>${result.proTitle}</td>
			</tr>
			<tr>
				<th>과목명</th>
				<td>${result.proEdu}</td>
			</tr>
			<tr>
				<th>담당 교수</th>
				<td></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${resultDetail.proDetailDate}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${resultDetail.proDetailContent}</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td>
				<img alt="" src="download?boardnum=${board.boardnum}" height="300" width="300">
				<br> 
					<!-- 첨부된 파일이 있는 경우, 해당 파일을 다운로드 할 수 있는 링크 제공 --> 
					
						<a href="download?boardnum=${board.boardnum}">
							${board.originalfile} </a>
					
				</td>
			</tr>
		</table>

		<div id="line">
			<!-- 목록보기-->
			<a href="certProjectReadForm">목록보기</a>
			
			
				<!-- 현재글 삭제하기 -->
			<!--<a href="javascript:deleteCheck(${board.boardnum})">삭제</a> -->
				<!-- 현재글 수정하기-->
				<input type="button" id="button" value="수정하기" onclick="editForm(${result.proNum})">
				
			<!--<a href="edit?proNum=${board.boardnum}">수정</a>-->
			

			
		</div>
		
		<!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.js'/>"></script>
    <script src="<c:url value='/resources/vendor/scrollreveal/scrollreveal.js'/>"></script>
    <script src="<c:url value='/resources/vendor/magnific-popup/jquery.magnific-popup.js'/>"></script>

    <!-- Custom scripts for this template -->
    <script src="<c:url value='/resources/js/creative.js'/>"></script>
</body>
</html>