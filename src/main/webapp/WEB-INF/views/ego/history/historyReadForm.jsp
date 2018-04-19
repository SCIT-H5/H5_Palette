<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>    
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/timelify/js/jquery.timelify.js" />" ></script>
	<script type="text/javascript">
		$(function() {
			$('.timeline').timelify({
			    animRight: "fadeInRight",
			    animCenter: "zoomIn"
			});
			alert('${hisAll}');
		});
	</script>
	
	<!-- Timelify animation 적용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/timelify.css">
	
	<title>history Read Form</title>
</head>

<body>

	<div class="timeline">
	 	<c:if test="${hisAll ne null }">
	 		<c:forEach items="${hisAll }" var="year">
	 			<c:if test="">
	 				<h2>${year.hisDate }</h2>
	 			</c:if>
	 			<ul class="timeline-items">
			   		<li class="is-hidden timeline-item">
			   			<h3>${year.hisTitle }</h3>
			   			<hr>
			   			<p>${year.hisContent }</p>
			   			<hr>
			   			<time>${year.hisPeriod }</time>
			   		</li>
	   			</ul>
	 		</c:forEach>
	 	</c:if>
	 	
	 	
		<!-- <h2>2013</h2> -->
	   	<ul class="timeline-items">
	   		<li class="is-hidden timeline-item">
	   			<h3>Title</h3>
	   			<hr>
	   			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet cupiditate, delectus deserunt doloribus earum eveniet explicabo fuga iste magni maxime mollitia nemo neque, perferendis quod reprehenderit ut, vel veritatis voluptas?</p>
	   			<hr>
	   			<time>Date</time>
	   		</li>
	   	</ul>
	</div>

	

</body>
</html>