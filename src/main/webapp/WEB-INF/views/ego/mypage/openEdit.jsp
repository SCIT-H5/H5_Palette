<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공개 범위 설정</title>
<style type="text/css">
.openDiv{
	
	/* background-color: gray; */
}

.openTable{
	border: 2px solid;
	/* background-color: orange; */
	margin:auto;
	margin-top: 250px;
	
}
.openTable th{
/* border: 2px solid; */
width: 200px;
height: 95px;
text-align: center;
}
</style>
</head>
<body>
<div class="openDiv">

<form action="openInfo" method="post">
	<table class="openTable">
		<tr>
			<th colspan="4">공개범위 설정</th>
			<th colspan="2">ON</th>
			<th colspan="2">OFF</th>
			
			
		</tr>
		<tr>
			<th colspan="4">
			<p>포토폴리오 페이지</p>
			<select name="port">
		
				
				<option>첫번째 포폴</option>
				<option>두번째 포폴</option>
				<option>세번째 포폴</option>
				<option>네번째 포폴</option>

			</select>
			</th>
			
			<th colspan="2">
			<input type="radio" name="on_off_one"></button>
			</th>
			<th colspan="2">
			<input type="radio" name="on_off_one"></button>
			</th>
			
			
		</tr>
		<tr>
			<th colspan="4">자아 분석 페이지</th>
			
			<th colspan="2">
			<input type="radio" name="on_off_two"></button>
			</th>
			<th colspan="2">
			<input type="radio" name="on_off_two"></button>
			</th>
			
			
		</tr>
		
		
	</table>
	<br>
	<input type="submit" id="sbtn" name="sbtn" value="수정하기">
</form>	
</div>
</body>
</html>