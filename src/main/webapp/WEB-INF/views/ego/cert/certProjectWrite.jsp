<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
	<!-- Navigation -->
	<%@include file="/WEB-INF/views/navi.jsp"%>    
	<title>Palette - 프로젝트 리스트 작성</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Table_Fixed_Header CSS -->
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css">
	<!--===============================================================================================-->
   
   	<script type="text/javascript">	
   	
		//글쓰기폼 확인
		function formCheck() {
			
			var proTerm= document.getElementById('proTerm');
			var proEdu = document.getElementById('proEdu');
			var proTitle = document.getElementById('proTitle');
			
			if (proTitle.value == "") {
				alert("프로젝트 명을 입력하세요.");
				proTitle.focus();
				proTitle.select();
				return false;
			}
			
			if (proTerm.value == "") {
				alert("학기를  입력하세요.");
				proTerm.focus();
				proTerm.select();
				return false;
			}
			if (proEdu.value == "") {
				alert("과목명을 입력하세요.");
				proEdu.focus();
				proEdu.select();
				return false;
			}
			
			return true;
		}
	</script>
	
	
</head>

<body id="page-top" style="background-color: #e6e6e6;">
	
	<header id="bg-primary" style="height:70px; background-color: black;"></header>
   	
	<section id="viewList" style="padding-bottom: 80px;">
	  
    	<p style="width: 100%; margin-bottom: 30px; text-align: center; font-size: xx-large; font-weight: bold;">프로젝트 리스트 작성</p>
	  	    	
    <form id="projectWrite_One" action="projectWrite_One"  method="POST" enctype="multipart/form-data" onsubmit="return formCheck();">   
		<!-- 세션에서 아이디 받아오기 -->
		<input type="hidden" name="proId" value="${sessionScope.loginId}">
		
		<div class="table100 ver2 m-b-110" style="width: 70%; left: 15%;">
			<div class="table100-head">
				<table>					
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">프로젝트 명</th>						
						<td class="cell100 row100 body" style="width:70%;"> 
							<input type="text" style="width:100%" name="proTitle" id="proTitle" placeholder="프로젝트 주제입력">
						</td> 						
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">과목명</th>
						<td class="cell100 row100 body" style="width:70%;"> 
							<input type="text" style="width:100%" name="proEdu" id="proEdu" placeholder="과목명 입력">
						</td>
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">제작년도</th>
						<td class="cell100 row100 body" style="width:70%;"> 
							<input type="text" style="width:100%" name="proTerm" id="proTerm" placeholder="참여 학기 입력">
						</td>
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">담당교수</th>
						<td class="cell100 row100 body" style="width:70%;"> 
							<input type="text" style="width:100%" name="proProf" id="proProf" placeholder="담당 교수 입력">
						</td>
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">상세내용</th>
						<td class="cell100 row100 body" style="width:70%;"> 
							<textarea style="width:100%; height: 300px; border-color: #e6e6e6;" 
								name="proContent" id="proContent" placeholder="상세내용 입력"></textarea>							
						</td>
					</tr>
					<tr class="row100 head" style="font-weight: bold;">
						<th class="cell100" style="padding-left: 50px; width:30%;">파일첨부</th> 
						<td class="cell100 row100 body" style="width:70%;">
							<!-- 새로 첨부할 파일 선택 -->
							<input type="file" name="upload" size="30">
						</td>
					</tr>
					
				</table>
			</div>		
		</div>	
		<div class="mx-auto" style="text-align: center;">
	    	<input type="submit" class="text-uppercase text-white btn btn-primary btn-xl" value="작성완료">
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