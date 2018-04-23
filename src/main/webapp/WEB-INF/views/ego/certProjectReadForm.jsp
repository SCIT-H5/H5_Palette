<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<title>Palette - 프로젝트 리스트</title>
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
	
	<script type="text/javascript">
		function writeForm() {
			location.href = "writeForm";
		}
	</script>
	<style>
		.bg-image-blur {
		    -webkit-filter: blur(3px); /* Safari 6.0 - 9.0 */
		    filter: blur(3px);
		}
	</style>
</head>
<body style="background-color: #e6e6e6;">

	<!-- Navigation -->
	<%@include file="/WEB-INF/views/navi.jsp"%>    
	<header class="text-center text-black d-flex">
		<div class="my-auto" >
			<div class="mx-auto" style="text-align: center;">
				<div class="bg-image-blur" style="">
					<img src="/h5/resources/img/meeting-top-view.png" style="width: 100%;">
					
				</div>
				<div class="row" style="position: absolute; left: 26%; top: 40%; display: inline-block; width: 50%; padding: 1em;">   
					<div class="col-lg-10 mx-auto">
						<h1 class="text-uppercase text-white">
							<strong>Your Project List</strong>
						</h1>
					</div>   
					<div class="col-lg-8 mx-auto">
			            <p class="text-faded mb-5">당신이 참여한 프로젝트 리스트를 확인하세요.</p>
			            <a class="btn btn-primary btn-xl js-scroll-trigger" href="#viewList">Show List</a>
			        </div> 	
				</div>
			</div>         
		</div>      
	</header> 
       
    <section id="viewList">
    	<div class="mx-auto" style="text-align: center;">
	    	<a class="text-uppercase text-white btn btn-primary btn-xl js-scroll-trigger" 
	    		onclick="writeForm()">Write</a>
		</div>
		<p></p>			
		<div class="table100 ver2 m-b-110" style="width: 70%; left: 15%;">
			<div class="table100-head">
				<table>
					<thead>
						<tr class="row100 head" style="font-weight: bold;">
							<th class="cell100" style="width:50%; padding-left: 40px;">프로젝트 명</th>
							<th class="cell100" style="width:40%;">과목명</th>
							<th class="cell100" style="width:10%; padding-right: 40px;">제작기간</th>
						</tr>
					</thead>
				</table>
			</div>

			<div class="table100-body js-pscroll">
				<table>
					<tbody>
						<c:forEach var="list" items="${list}">
						<tr class="row100 body">
							<td class="cell100" style="width:50%; padding-left: 40px;"><a href="detail?proNum=${list.proNum}">${list.proTitle}</a></td> <!-- 프로젝트 명 -->
							<td class="cell100" style="width:40%;">${list.proEdu}</td> <!-- 과목 -->
							<td class="cell100" style="width:10%; padding-right: 40px;">${list.proTerm}</td> <!-- 제작기간 -->
						</tr>
						</c:forEach>								
					</tbody>
				</table>
			</div>
		</div>	
		
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