<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>history Update Form</title>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
	<script type="text/javascript">
		
	function KeyCheck(){
		var EventStatus = event.srcElement.tagName;
		if(EventStatus == 'TEXTAREA'){
			if(event.keyCode=='13'){
				memo.rows = memo.rows+1;
			}
		}
	}
	document.onkeypress = KeyCheck;
	
	function formCheck(){
		var hisTitle = document.getElementById("hisTitle");
		var hisContent = document.getElementById("hisContent");
		var hisPeriod = document.getElementById("hisPeriod");
		
		if(hisTitle.value == ""){
			alert("제목을 입력해주세요.");
			title.focus();
			return false;
		}
		
		if(hisContent.value == ""){
			alert("내용을 입력해주세요.");
			content.focus();
			return false;
		}
		
		if(hisPeriod.value == ""){
			alert("기간을 입력해주세요.");
			content.focus();
			return false;
		}
		
		return true;
	}
	
	</script>
	
</head>
<body>
	
	<div>
		<form action="historyWrite" method="post" onsubmit="return formCheck();">
			<input type="hidden" name="hisId" id="hisId" value="${sessionScope.userId }">
			<table>
				<tr>
					<th>YEAR</th>
					<td>
						<input type="text" name="hisDate" id="hisDate" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>TITLE</th>
					<td>
						<input type="text" name="hisTitle" id="hisTitle">
					</td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td>
						<textarea rows="1" cols="60" name="hisContent" id="thisContent"></textarea>
					</td>
				</tr>
				<tr>
					<th>PERIOD</th>
					<td>
						<input type="text" name="hisTitle" id="hisTitle">
					</td>
				</tr>
			</table>
			<div>
				<br><input type="submit" value="수정">
			</div>
		</form>
	</div>


</body>
</html>