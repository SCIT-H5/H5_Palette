<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자아분석 - SWOT UPDATE PAGE</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	  $("#button_q").on("click", function(){
		  var complete = $('#swotUpdate');
		  complete.submit();
	  });
	}); 
</script>
<!-- 수정 시작 -->
<form action="swotUpdate" method="post" id="swotUpdate" name="swotUpdate">

<table>
	<tr>
		<td>Strength (강점)</td>
		<th><input type="text" id="writeUpdate_s" name="swotS" value="${sessionScope.swotlist.swotS}" ></th>
	</tr>
	<tr>
		<td>Weakness (약점)</td>
		<th><input type="text" id="writeUpdate_w" name="swotW" value="${sessionScope.swotlist.swotW}"" ></th>
	</tr>
	<tr>
		<td>Opportunity (기회)</td>
		<th><input type="text" id="writeUpdate_o" name="swotO" value="${sessionScope.swotlist.swotO}"" ></th>
	</tr>
	<tr>
		<td>Threat (위협)</td>
		<th><input type="text" id="writeUpdate_t" name="swotT"  value="${sessionScope.swotlist.swotT}"" ></th>
	</tr>
</table>


<input type="submit" id="button_q" value="수정완료 " >
</form>
 
</body>
</html>