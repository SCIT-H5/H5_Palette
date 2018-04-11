<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>           
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" type="text/css" href="resources/timelify/css/animate.css">
	<link rel="stylesheet" type="text/css" href="resources/timelify/css/style.css">
	<link rel="stylesheet" type="text/css" href="resources/timelify/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/timelify/css/timelify.css">
	
	<script type="text/javascript" src="resources/timelify/js/jquery.timelify.js"></script>
	<script type="text/javascript" src="resources/timelify/js/jquery.js"></script>
	<script type="text/javascript">
	
	<!-- history에 기존에 입력한 데이터가 없는경우 : Start Write 버튼 뜨기 : 화면 중앙에! 추후 CSS 적용 필요 -->
/* 	<c:if test="${param. == null}"> */
	
		<!-- historyWriteForm으로 이동 : Controller단에서 처음/추가입력 여부 판단해주기 -->
		$(document).ready(function(){
			var div = document.getElementById("divStartBtn");
			var str = '<a href="historyWriteForm"><button class="button" style="vertical-align:middle"><span>START</span></button></a>';
		})
	
/* 	</c:if>	
 */	
		
	
	</script>
	
	<title> History Read Page </title>
</head>
<body>

	<!-- historyWriteForm으로 이동 : Controller단에서 처음/추가입력 여부 판단해주기 -->
	<a href="historyWriteForm"><button class="button" style="vertical-align:middle"><span>추가하기</span></button></a>
	
	

	

</body>
</html>