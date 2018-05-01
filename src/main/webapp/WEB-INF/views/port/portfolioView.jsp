<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/navi.jsp"%>

<!-- jquery, jquery-ui, 위젯에 필요한 css -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/js/wiget_default.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/js/wiget_table.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/js/wiget_graph.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/css/wiget.css">

<!-- graph -->
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/ion.rangeSlider.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/ion.rangeSlider2.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/colpick.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/dist/roundslider.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/normalize.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/ion.rangeSlider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/ion.rangeSlider.skinModern.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/colpick/colpick.css" type="text/css"/>
<link href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/roundslider.min.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/jquery.barrating.js"></script>
<link href="http://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-1to10.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-movie.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-square.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-pill.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-reversed.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-horizontal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/fontawesome-stars.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/css-stars.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bootstrap-stars.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/fontawesome-stars-o.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/css/bar_graph.css">


<script type="text/javascript">
	$(function() {
		$('#see').html('${port.portContent}');
		
		
		
		
		
		$('#update').on('click', function() {
			$('#upForm').submit();
		});
		$('#delete').on('click', function() {
			$('#delForm').submit();
		});
		
	})
</script>
<style type="text/css">
.see{
	width: 70%;
    height: 95%;
    background-color: white;
    position: relative;
    top: 140px;
    left: 236px;
}

/* .btnDiv{
	position: relative;
    top: 100px;
    /* background-color: red; */
    width: 45px;
    margin: auto;
} */
</style>
</head>
<body>
	
	<c:if test="${sessionScope.loginId == port.portId}">
		<form action="portUpdateForm" method="post" id="upForm">
			<input type="hidden" name="portNum" value="${port.portNum }">
			<input type="hidden" name="portId" value="${sessionScope.loginId }">
			<input type="button" id="update" value="修整">
		</form>
		<form action="portDelete" method="post" id="delForm">
			<input type="hidden" name="portNum" value="${port.portNum }">
			<input type="hidden" name="portId" value="${sessionScope.loginId }">
			<input type="button" id="delete" value="削除">
		</form>
		
	</c:if>
	
	<div id="see" class="see">
	<!-- 보여지는 영역 -->
	
	</div>
	
	<%-- <div class="btnDiv">
		<form action="portUpdateForm" method="post" id="upForm">
			<input type="hidden" name="portNum" value="${port.portNum }">
			<input type="hidden" name="portId" value="${sessionScope.loginId }">
			<input type="button" id="update" class="update" value="수정">
		</form>	
	</div>	 --%>

</body>




<script src="${pageContext.request.contextPath}/resources/portfolio/table/js/test4.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/table/css/jquery.edittable.min.css">

</html>