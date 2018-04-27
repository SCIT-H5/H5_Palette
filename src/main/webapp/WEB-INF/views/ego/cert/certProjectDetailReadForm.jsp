<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>

<title>Palette - 프로젝트 상세 내용</title>
	
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
        
	<script type="text/javascript">
		function editForm(proNum) {
			location.href = "edit?proNum="+proNum;
		}
	</script>

	<!-- Custom styles for this template -->
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main_page.css">
      
    <!-- Table_Fixed_Header CSS -->
   	<!--===============================================================================================-->
    	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/fonts/font-awesome-4.7.0/css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/select2/select2.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/perfect-scrollbar/perfect-scrollbar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css">
	<!--===============================================================================================-->
   
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

<body id="page-top" style="background-color: #e6e6e6;">

	<!-- Navigation -->
	<%@include file="/WEB-INF/views/navi.jsp"%>    
   	<header id="bg-primary" style="height:70px; background-color: black;"></header>

	<section id="viewList" style="padding-bottom: 80px;">
	  
    	<p style="width: 100%; text-align: center; font-size: xx-large; font-weight: bold;">프로젝트 상세 내용</p>
	  	    	
		<form id="projectWrite_One" action="projectWrite_One"  method="get" onsubmit="return formCheck();">	
		<input type="hidden" name="proId" value="${sessionScope.loginId}">
		
		<div class="table100 ver2 m-b-110" style="width: 70%; left: 15%;">
			<div class="table100-head">
				<table>					
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">프로젝트 주제</th>						
						<td class="cell100 row100 body" style="width:70%;"> 
							${result.proTitle}
						</td> 						
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">과목명</th>
						<td class="cell100 row100 body" style="width:70%;"> 
							${result.proEdu}
						</td>
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">제작기간</th>
						<td class="cell100 row100 body" style="width:70%;"> 
							${result.proTerm}
						</td>
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">담당교수</th>
						<td class="cell100 row100 body" style="width:70%;"> 
							${result.proProf}
						</td>
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">상세내용</th>
						<td class="cell100 row100 body" style="width:70%;"> 
							${result.proContent}
						</td>
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">첨부파일</th>
						<td class="cell100 row100 body" style="width:70%;"> 
							<c:if test="${file != null}">
								<a href="/h5/port/download?originfile=${file.originalFileName }&savefile=${file.savedFileName}">${file.originalFileName }</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>		
		</div>	
		<div class="mx-auto" style="text-align: center;">
	    	<a href="certProjectReadForm" class="text-uppercase text-white btn btn-primary btn-xl">목록보기</a>
	    	<input type="button" class="text-uppercase text-white btn btn-primary btn-xl" 
	    		value="수정하기" onclick="editForm(${result.proNum})">
		</div>
		</form>
    </section>

	<!-- Footer -->
	<%@include file="/WEB-INF/views/footer-text-black.jsp"%>  
		
	<!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.js'/>"></script>
    <script src="<c:url value='/resources/vendor/scrollreveal/scrollreveal.js'/>"></script>
    <script src="<c:url value='/resources/vendor/magnific-popup/jquery.magnific-popup.js'/>"></script>

    <!-- Custom scripts for this template -->
    <script src="<c:url value='/resources/js/creative.js'/>"></script>

	<!-- Table-Fixed-Header JS -->
	<!--===============================================================================================-->
		<script src="<c:url value='/resources/Table_Fixed_Header/vendor/bootstrap/js/popper.js'/>"></script>
		<script src="<c:url value='/resources/Table_Fixed_Header/vendor/bootstrap/js/bootstrap.js'/>"></script>
	<!--===============================================================================================-->
		<script src="<c:url value='/resources/Table_Fixed_Header/vendor/select2/select2.js'/>"></script>
	<!--===============================================================================================-->
		<script src="<c:url value='/resources/Table_Fixed_Header/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
		<script>
			$('.js-pscroll').each(function(){
				var ps = new PerfectScrollbar(this);
	
				$(window).on('resize', function(){
					ps.update();
				})
			});	
		</script>
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-23581568-13');
		</script>		
	<!--===============================================================================================-->
		<script src="<c:url value='/resources/Table_Fixed_Header/js/main.js'/>"></script>
</body>
</html>