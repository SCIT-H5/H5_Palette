<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인</title>
	
	<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />

	<script>
	
	//로그인 폼 검사
	function formCheck() {
		var userId = document.getElementById('userId');
		var userPw = document.getElementById('userPw');
		
		if (userId.value == '' || userPw.value == '') {
			alert('ID와 비밀번호를 입력하세요.');
			return false;
		}
		return true;
	}
	
	function goJoinForm(){
		
	}
	
	</script>
</head>
<body>

	<div class="centerdiv">
	<h2>[ 로그인 ]</h2>

	<form id="loginForm" action="loginForm" method="post" onSubmit="return formCheck();">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="userId" id="userId" /></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="text" name="userPw" id="userPw" /></td>
			</tr>
			<tr>
				<td class="white"></td>
				<td class="white">
					<div class="errorMsg">
						${errorMsg}
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="center white">
					<input type="submit" value="로그인" />
				</td>
				<td colspan="2" class="center white">
					<input type="button" value="회원가입" onclick="goJoinForm()" />
				</td>
			</tr>
		</table>
	</form>

	</div>
</body>
</html>