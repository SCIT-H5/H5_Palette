<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>    
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
	
	<script>
		$(function() {
			$('.timeline').timelify({
			    animRight: "fadeInRight",
			    animCenter: "zoomIn"
			});
			
		});

	</script>
	
	<!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">	
	
	<!-- Timelify animation 적용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/timelify.css">
	
	<!-- Plugin CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/creative.css">
	
	<title>history Read Form</title>
	
	<style type="text/css">
	
	.box{
		width:500px;
		height:500px;
	  	left:-webkit-calc( 50% - 250px );
	  	top:20%;
		position:absolute;
		border-radius:5px;
		@include box-shadow(0 20px 30px rgba(0,0,0,.6));
		border:1px solid rgba(255,255,255,.3);
		padding:20px;
		text-align: center;
		@include box-sizing(border-box);
		text-shadow:0 1px 1px rgba(0,0,0,.4);
	 	display: flex;
	  	transition: box-shadow .3s ease;
	  
		&:active{
	    cursor:move;
	    @include box-shadow(0 20px 50px rgba(0,0,0,.9));
	  }
	  
	  .content{
	    margin: auto;
	  }
	 
	}
	</style>
</head>

<body id="page-top">
	<!-- Navigation -->
<%--     <%@include file="/WEB-INF/views/navi.jsp"%>  --%>
       
	<!-- <section class="text-center text-white d-flex">
			
			<div class="container">
				<div class="row text-center">
				<div class="col-lg-10">
					<h1 class="text-uppercase text-center">   MY HISTORY   </h1>
					<span class="col-lg-10 mx-auto"> 나의 연혁 관리 페이지 </span>				
					<p><a href="/historyWriteForm" target="_blank">나의 연혁 작성하러 가기</a></p>
				</div>
				</div>
			</div>					
		
	</section> -->
	
	<c:if test="${hisAll eq '[]' }">
	<div id="box1" class="box">
	  <div class="content">
	    <h1>MY HISTORY</h1>
		    <h2>나의 연혁 관리 페이지</h2>
	    	<p><a href="historyWriteForm">나의 연혁 작성하러 가기</a></p>
	  </div>
	</div>
	</c:if>
	
	<div class="timeline">
	
	 	<c:if test="${hisAll ne '[]'}">
	 		
	 		<div id="historyMenu">
	 			<p><a href="historyWriteForm"> 나의 연혁 추가하기 </a></p>
	 		</div>
	 		
	 		<c:forEach items="${hisAll }" var="his" varStatus="loopStat">
	 			<c:set var="prevYear" value="${hisAll[loopStat.index-1].hisDate }"/>
	 			<c:set var="nextYear" value="${hisAll[loopStat.index].hisDate }"/>
	 			<c:if test="${prevYear != nextYear}">
	 				<%-- <c:out value="${hisAll[loopStat.index].hisDate }" /> --%>
	 				<h2>${hisAll[loopStat.index].hisDate }</h2>
	 				<%-- <h2>${year.hisDate }</h2> --%>
	 			</c:if>
	   			<ul class="timeline-items">
	   				<c:if test="${loopStat.index%2 != 0 }">
		   				<li class="is-hidden timeline-item inverted">
	   				</c:if>
	   				<c:if test="${loopStat.index%2 == 0 }">
	   					<li class="is-hidden timeline-item">
	   				</c:if>
					   		<h3>${his.hisTitle }</h3>
					   		<hr>
					   		<p>${his.hisContent }</p>
					  		<hr>
					   		<time>${his.hisPeriod }</time><br>
					   		<hr>
					   		<p style="text-align:right;"><a href="historyUpdateForm?hisNo=${his.hisNo}">수정</a>&nbsp;
					   		<a href="historyDeleteOne?hisNo=${his.hisNo}">삭제</a></p>
			   			</li>
	   			</ul>
	   			
	   			
	 		</c:forEach>
	 	</c:if>
	</div>
	
	
	<!-- Timelify JavaScript -->
	<script type="text/javascript" src="<c:url value="/resources/timelify/js/jquery.timelify.js" />" ></script>

	<!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>
    
    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.js'/>"></script>
    <script src="<c:url value='/resources/vendor/scrollreveal/scrollreveal.js'/>"></script>
    <script src="<c:url value='/resources/vendor/magnific-popup/jquery.magnific-popup.js'/>"></script>
	
	
</body>
</html>