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
    
	<!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">

    <!-- Custom fonts for this template -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css">
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'>
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'>

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/creative.css">
	
</head>

<body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath}/">PALETTE!</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse dropdown" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
	      <div class="collapse navbar-collapse drop_down" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto drop_down_menu">
	            <li class="nav-item">
	              <a tabindex="-1" class="nav-link" href="${pageContext.request.contextPath}/main">Main Page</a>
	            </li>
	            <li class="nav-item" class="drop_down_submenu">
 				  <a tabindex="-1" class="nav-link" class="drop_down_multi" href="${pageContext.request.contextPath}/ego/swotReadForm">Self-Analysis</a>
 				  
 				  <!-- 자아 분석 SubMenu dropDown -->
 				  <ul class="drop_down_menu">
		        	<li>
		        		<a tabindex="-1" href="${pageContext.request.contextPath}/ego/swotReadForm">SWOT Analysis</a>

		        	</li>
		        	<li>
		        		<a tabindex="-1" href="${pageContext.request.contextPath}/ego/historyReadForm">My History</a>
		        	</li>
		        	<li>
		        		<a tabindex="-1" href="${pageContext.request.contextPath}/ego/personalityReadForm">Personality Profile</a>
		        	</li>
		        	<li class="drop_down_submenu">
		        		<a tabindex="-1" href="${pageContext.request.contextPath}/ego/qualification" class="drop_down_multi_p">Qualification</a>
		        		
		        		<!-- 자격 사항 SubMenu dropDown -->		        		
		        		<ul class="drop_down_menu">
			        		<li>
			        			<a tabindex="-1" href="${pageContext.request.contextPath}/ego/cert/certGradReadForm">졸업 증명</a>
			        		</li>
			        		<li>
			        			<a tabindex="-1" href="${pageContext.request.contextPath}/ego/cert/certLectReadForm">이수 과목</a>
			        		</li>
			        		<li>
			        			<a tabindex="-1" href="${pageContext.request.contextPath}/ego/cert/certScholarshipReadForm">장학 내역</a>
			        		</li>
			        		<li>
			        			<a tabindex="-1" href="${pageContext.request.contextPath}/ego/cert/certCertificateReadForm">자격 증명</a>
			        		</li>
			        		<li>
			        			<a tabindex="-1" href="${pageContext.request.contextPath}/ego/cert/certProjectReadForm">프로젝트 리스트</a>
			        		</li>
			        	</ul>		        		
		        		
		        	</li>
		        	<li>
		        		<a tabindex="-1" href="${pageContext.request.contextPath}/ego/skillReadForm">My Skill</a>    
		        	</li>
		        	<li>
		        		<a tabindex="-1" href="${pageContext.request.contextPath}/ego/activityReadForm">Activity</a>
		        	</li>
	        	</ul>
	            </li>          
	            <li class="nav-item">
	              <a tabindex="-1" class="nav-link" href="${pageContext.request.contextPath}/port/newPort">New Portfolio</a>
	            </li>         
	            <li class="nav-item">
	              <a tabindex="-1" class="nav-link" href="${pageContext.request.contextPath}/port/my_port">My Portfolio</a>
	            </li>  
	          </ul>
	        </div>        
	        
        <div class="collapse navbar-collapse" id="navbarResponsive">
         	<ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/ego/myInfo">My Page</a>	               	              	 
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/userinfo/logout">Log-Out</a>
	            </li>
            </ul>
        </div> 
                 
      </div>
          
    </nav>
    	
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