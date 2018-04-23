<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Palette - 내 포트폴리오</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style type="text/css">
	.portNum {
		font-size: 30sp;
		font-weight: bold;
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	$(function() {
		$('.portNum').on('click', function() {
			var portNum = $(this).attr('value');
			var portId = '${sessionScope.loginId}';
			//$('#portDiv').load('/h5/port/portView?portNum='+portNum+'&portId='+portId);
			var url = "/h5/port/portView?portNum="+portNum+"&portId="+portId;
			$(location).attr('href', url);
		});
	});
</script>
</head>

<body>

<h1 style="text-align: center;">MY PORTFOLIO</h1>

<div>
	<!-- portfolio list -->
	<div style="background-color: aqua; width: 20%; height: 700px; position: absolute; margin: 20px;">
		<c:forEach items="${portList }" var="list" varStatus="status">
			<br><br>
			<span class="portNum" value="${list.portNum }">${status.index+1 }번 포트폴리오</span>
		</c:forEach>
	</div>
	
	<div>
		<div style="width:75%; height: 700px; float: right; margin: 20px;">
			<!-- portfolio view -->
			<div id="portDiv" style="background-color: yellow; height: 70%;">
			</div>
			<div style="height: 30%;">
				<!-- comment -->
				<div style="background-color: blue; height: 80%;">
				</div>
				<!-- buttons -->
				<div style="height: 20%; background-color: fuchsia; text-align: center;">
					<input type="button" value="수정">
					<input type="button" value="다운로드">
					<input type="button" value="삭제">
				</div>
			</div>
		</div>				
		
	</div>
</div>

</body>
</html>