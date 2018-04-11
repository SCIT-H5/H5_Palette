<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
	<title> History Write Form </title>
</head>
<body>
	<div>
		<form action="historyWrite" method="post" onsubmit="return formCheck();">
			<input type="hidden" name="hisId" id="id" value="${sessionScope.loginId }"> 
			<table>
				<tr>
					<th>YEAR</th>
					<td>
						<input type="text" id="hisDate" name="hisDate">
					</td>
				</tr>
				<tr>
					<th>TITLE</th>
					<td>
						<input type="text" id="hisTitle" name="hisTitle">
					</td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td>
						<!-- rows 와 cols는 임의로 할당 -->
						<textarea rows="5" cols="60" id="hisContent" name="hisContent"></textarea>
					</td>
				</tr>
				<tr>
					<th>PERIOD</th>
					<td>
						<input type="text" id="hisPeriod" name="hisPeriod">
					</td>
				</tr>			
			</table>	
		</form>
	</div>
</body>
</html>