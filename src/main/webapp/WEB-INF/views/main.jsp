<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- jQuery -->
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	
	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main_page.css">
	
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>Palette - 메인페이지</title>
	
	<!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">

    <!-- Custom fonts for this template -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.css">
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'>
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'>

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/creative.css">
	
	<script type="text/javascript">
	
		var icon1 = document.getElementById('icon1');
		var icon2 = document.getElementById('icon2');
		var icon3 = document.getElementById('icon3');
		var icon4 = document.getElementById('icon4');
		
		function services1(){
			location.href = "ego/swot/swotReadForm";	// SWOT 페이지로 이동
		}
		
		function services2(){
			location.href = "port/newPort";			// 새 포트폴리오 페이지로 이동
		}
		
		function services3(){
			location.href = "port/my_port";				// 내 포트폴리오 페이지로 이동
		}
		
		function services4(){
			location.href = "ego/myInfo";					// 마이 페이지로 이동
		}
	
	</script>
	
	<style type="text/css">
		.sr-icons {
			cursor: pointer;
		}
	</style>
	
</head>

<body id="page-top">
	
    <!-- Navigation -->
    <%@include file="/WEB-INF/views/navi.jsp"%>       	
    
    <header class="masthead text-center text-white d-flex">
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h1 class="text-uppercase">
              <strong>Draw Your Dreams</strong>
              <br>
              <strong>for Yourself!</strong>
            </h1>
            <hr>
          </div>
          <div class="col-lg-8 mx-auto">
            <p class="text-faded mb-5" style="font-weight: bold; ">${loginId }　様、 ようこそ :)</p>
          </div>
          <div class="col-lg-8 mx-auto">
            <a class="btn btn-primary btn-xl js-scroll-trigger" href="#services">Services</a>
          </div>
        </div>
      </div>
    </header>
    
    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">At Your Service</h2>
            <hr class="my-4">
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-pie-chart text-primary mb-3 sr-icons" id="icon1" onclick="services1()"></i>
              <h3 class="mb-3">Self-Analysis</h3>
              <p class="text-muted mb-0">知彼知己、百戦百勝!</p>
              <p class="text-muted mb-0">自己分析を通じて私がもっている</p>
              <p class="text-muted mb-0">長短所を確認しましょう！</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-newspaper-o text-primary mb-3 sr-icons" id="icon2" onclick="services2()"></i>
              <h3 class="mb-3">New Portfolio</h3>
              <p class="text-muted mb-0">自己分析を活用し、新しい</p>
              <p class="text-muted mb-0">ポートフォリオを作りましょう！</p>              
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-file-archive-o text-primary mb-3 sr-icons" id="icon3" onclick="services3()"></i>
              <h3 class="mb-3">My Portfolio</h3>
              <p class="text-muted mb-0">完成できたポートフォリオを</p>
              <p class="text-muted mb-0">確認しましょう！</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-user-secret text-primary mb-3 sr-icons" id="icon4" onclick="services4()"></i>
              <h3 class="mb-3">My Page</h3>
              <p class="text-muted mb-0">個人情報や公開範囲設定を</p>
              <p class="text-muted mb-0">しましょう！</p>
            </div>
          </div>
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
	
</body>
</html>