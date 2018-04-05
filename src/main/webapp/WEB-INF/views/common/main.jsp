<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script> 
		$(document).ready(function(){
		    $("#selfSub").click(function(){
		        $("#selfAnalysisSubmenu").slideDown("slow");
		    });
		});
		
		$(document).ready(function(){
		    $("#qualSub").click(function(){
		        $("#qualSubmenu").slideDown("slow");
		    });
		});
		
	</script>
	<style> 
		#selfSub, #selfAnalysisSubmenu, #qualSub, #qualSubmenu {
		    padding: 5px;
		    text-align: center;
		    background-color: #e5eecc;
		    border: solid 1px #c3c3c3;
		}
		
		#selfAnalysisSubmenu, #qualSubmenu {
		    padding: 50px;
		    display: none;
		}
	</style>


	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>Palette - 메인페이지</title>
	
	<!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

    <!-- Custom fonts for this template -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css">
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'>
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'>

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/creative.min.css">
	
</head>

<body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">PALETTE!</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
	      <div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="../">Home</a>
	            </li>
	            <li class="nav-item">
<!-- 	            <a class="nav-link js-scroll-trigger" href="#ego">Self-Analysis</a> -->
					<div class="nav-link" id="selfSub">Self-Analysis</div>
	            </li>          
	            <li class="nav-item">
	              <a class="nav-link" href="#new_port">New Portfolio</a>
	            </li>         
	            <li class="nav-item">
	              <a class="nav-link" href="#view_port">My Portfolio</a>
	            </li>  
	          </ul>
	        </div>
	        
	        <!-- 자아분석_SubMenu slowDown -->
	        <div id="selfAnalysisSubmenu">
	        	<ul>
		        	<li>
		        		<a href="ego/swotReadForm">SWOT Analysis</a>
		        	</li>
		        	<li>
		        		<a href="ego/historyReadForm">My History</a>
		        	</li>
		        	<li>
		        		<a href="ego/personalityReadForm">Personality Profile</a>
		        	</li>
		        	<li>
		        		<div id="qualSub">Qualification</div>
		        	</li>
		        	<li>
		        		<a href="skillReadForm">My Skill</a>
		        	</li>
		        	<li>
		        		<a href="activityReadForm">Activity</a>
		        	</li>
	        	</ul>
	        </div>
	        
	        <!-- 자격 사항_SubMenu slowDown -->
	        <div id="qualSubmenu">
	        	<ul>
	        		<li>
	        			<a href="ego/certGradReadForm">졸업 증명</a>
	        		</li>
	        		<li>
	        			<a href="ego/certLectReadForm">이수 과목</a>
	        		</li>
	        		<li>
	        			<a href="ego/certScholarshipReadForm">장학 내역</a>
	        		</li>
	        		<li>
	        			<a href="ego/certCertificate">자격 증명</a>
	        		</li>
	        		<li>
	        			<a href="ego/certProjectReadForm">프로젝트 리스트</a>
	        		</li>
	        	</ul>
	        </div>
	        
        <div class="collapse navbar-collapse" id="navbarResponsive">
         	<ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="#mypage">My Page</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="../userinfo/logout">Log-Out</a>
	            </li>
            </ul>
        </div> 
                 
      </div>
          
    </nav>
    
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
            <p class="text-faded mb-5">${loginId } 님, 환영합니다 :)</p>
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
              <i class="fa fa-4x fa-diamond text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">Sturdy Templates</h3>
              <p class="text-muted mb-0">Our templates are updated regularly so they don't break.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-paper-plane text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">Ready to Ship</h3>
              <p class="text-muted mb-0">You can use this theme as is, or you can make changes!</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-newspaper-o text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">Up to Date</h3>
              <p class="text-muted mb-0">We update dependencies to keep things fresh.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-heart text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">Made with Love</h3>
              <p class="text-muted mb-0">You have to make your websites with love these days!</p>
            </div>
          </div>
        </div>
      </div>
    </section>

	<!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/scrollreveal/scrollreveal.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/magnific-popup/jquery.magnific-popup.min.js'/>"></script>

    <!-- Custom scripts for this template -->
    <script src="<c:url value='/resources/js/creative.min.js'/>"></script>
	
</body>
</html>