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
			
		});
		
		$(function() {
			$( ".box" ).draggable();
		});
		
	</script>
	
	<!-- Timelify animation 적용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/timelify.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/css/blur.css">
	
	<title>history Read Form</title>
</head>

<body>
	
	<c:if test="${hisAll eq null }">
		<div>
			<h1> |  MY HISTORY  | </h1>
			<h1> 나의 연혁 관리 페이지</h1>
			<p><a href="/historyWriteForm" target="_blank">나의 연혁 작성하러 가기</a></p>
		</div>
	</c:if>

	<div class="timeline">
	
	 	<c:if test="${hisAll ne null }">
	 		<c:forEach items="${hisAll }" var="his" varStatus="loopStat">
	 			<c:set var="prevYear" value="${hisAll[loopStat.index-1].hisDate }"/>
	 			<c:set var="nextYear" value="${hisAll[loopStat.index].hisDate }"/>
	 			<c:if test="${prevYear != nextYear}">
	 				<c:out value="${hisAll[loopStat.index].hisDate }" />
	 				<h2>${hisAll[loopStat.index].hisDate }</h2>
	 				<%-- <h2>${year.hisDate }</h2> --%>
	 			</c:if>
	   				<ul class="timeline-items">
	   					<c:if test="${loopStat.index%2 == 0 }">
		   					<li class="is-hidden timeline-item inverted">
	   					</c:if>
	   					<c:if test="${loopStat.index%2 != 0 }">
	   						<li class="is-hidden timeline-item">
	   					</c:if>
				   			<h3>${his.hisTitle }</h3>
				   			<hr>
				   			<p>${his.hisContent }</p>
				   			<hr>
				   			<time>${his.hisPeriod }</time>
			   			</li>
	   				</ul> 
	 		</c:forEach>
	 	</c:if>
	</div>

	

</body>
</html>