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
	
	
	
	</script>
	
	<title> History Read Page </title>
</head>
<body>
	<!-- 메인 내용 컨텐트 안에서 최상단 메뉴 bar -->
	<div id="upperBar">
		<ul>
			<c:choose>
			<!-- history에 기존에 입력한 데이터가 없는경우 : Start Write 버튼 뜨기 : 화면 중앙에! 추후 CSS 적용 필요 -->
				<c:when test="${param == null }">
					<a href="historyWriteForm"><button class="button" style="vertical-align:middle"><span>START</span></button></a>
				</c:when>
			<!-- history 기존 데이터가 있는 경우 : 상단메뉴로만 표시! -->
				<c:otherwise>
					<!-- historyWriteForm으로 이동 : Controller단에서 처음/추가입력 여부 판단해주기 -->
					<a href="historyWriteForm"><button class="button" style="vertical-align:middle"><span>추가하기</span></button></a>
				</c:otherwise>
			</c:choose>	
		</ul>
	</div>
	
	<!-- 해당 userId가 들고 있는 history 전체 정보 출력 & year부분 if조건문 처리 -->
	<div id="mainView" class="timeline">
	
		<!-- h2태그에서는 year이 할당되게 해야한다 -->
		
		
		<h2></h2>
			<ul class="timeline-items">
				<li class="is-hidden time-line-item">
					<h3></h3>
					<hr>
					<p></p>
					<hr>
					<time></time>				
				</li>
			</ul>	
			
				
	</div>


	
		
	

	

</body>
</html>