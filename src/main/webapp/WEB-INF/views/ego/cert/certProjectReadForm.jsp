<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 리스트</title>
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
<script type="text/javascript">
	function writeForm() {
		location.href = "writeForm";
	}
</script>
</head>
<body id="page-top">
        <!-- Navigation -->
    <%@include file="/WEB-INF/views/navi.jsp"%>    
   <header id="bg-primary" style="height:70px; background-color: black;"></header>
       
	<input type="button" id="button" value="작성하기" onclick="writeForm()">
	

	<table border="1">
		<tr>
			<th>
			학기
			</th>
			<th>
			과목명
			</th>
			<th>
			프로젝트 명
			</th>
		</tr>
		
		<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.proTerm}</td> <!-- 학기 -->
			<td>${list.proEdu}</td> <!-- 과목 -->
			<td><a href="detail?proNum=${list.proNum}">${list.proTitle}</a></td> <!-- 프로젝트 명 -->
		</tr>
		</c:forEach>		
		
	</table>
	
	
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