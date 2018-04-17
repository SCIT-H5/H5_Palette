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
	var proTerm = document.getElementById('proTerm');
	var proEdu = document.getElementById('proEdu');
	var proTitle = document.getElementById('proTitle');
	if (proTerm.value == null) {
		alert("학기를  입력하세요.");
		title.focus();
		title.select();
		return false;
	}
	if (proEdu.value == null) {
		alert("과목명을 입력하세요.");
		title.focus();
		title.select();
		return false;
	}
	if (proTitle.value == null) {
		alert("프로젝트 명을 입력하세요.");
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
   


<h2>[ 프로젝트 리스트 작성 폼 ]</h2>

	


<form id="projectWrite_One" action="projectWrite_One"  method="get" onsubmit="return formCheck();">
	<input type="hidden" name="proId" value="${sessionScope.loginId}"><!-- 작성시 로그인 상태의 아이디도 같이 보내줌 -->	
	
<table border="1">

			<tr>
				<th>학기 </th>
				<td><input type="text" name="proTerm" id="proTerm" style="width:400px;" placeholder="프로젝트 주제입력"></td>
			</tr>
			<tr>
				<th>과목명</th>
				<td><input type="text" name="proEdu" id="proEdu" style="width:400px;" placeholder="과목명 입력"></td>
			</tr>
			<tr>
				<th>프로젝트 명</th>
				<td><input type="text" name="proTitle" id="proTitle" style="width:400px;"  value=""  placeholder="프로젝트 명 입력"></td>
			</tr>
			
		<tr>
			<td colspan="2" class="white center">
		<input type="submit" value="작성">
			</td> 
		</tr>
</table>
</form>


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