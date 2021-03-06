<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Palette - 로그인</title>
	
	<!-- jQuery -->
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	
	<!-- Bootstrap -->
	<link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.css'/>" rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="<c:url value='/resources/css/member.css'/>" rel="stylesheet">
	
	<script>
	
		function sign_in(){
			location.href = 'join';
		}
		
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
		
	</script>
	
</head>
<body>

	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">
				<div class="inner cover">
					<h2 class="cover-heading">로그인</h2>
				
					<form id="loginForm" action="loginForm" method="post" onSubmit="return formCheck();">
					
						<div class="form-group has-feedback">
							<label for="inputId" class="sr-only">아이디</label> 
							<input type="text" id="userId" name="id" data-remote="checkIdDuplicate"
								class="form-control" placeholder="아이디" pattern="^[_A-z0-9]{1,}$"
								required>								
						</div>
						
						<div class="form-group has-feedback">
							<label for="inputPassword" class="sr-only">비밀번호</label>
							<input type="password" id="userPw" name="password" pattern="^[_A-z0-9]{1,}$" 
								class="form-control" placeholder="비밀번호" 
								required>
						</div>
							
						<div class="form-group">
							<input type="submit" value="로그인" />
							<input type="button" value="회원가입" onclick="sign_in()" />
						</div>
					</form>		
				</div>
			</div>
		</div>
	</div>
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	
	<!-- Bootstrap Validator -->
	<script type="text/javascript" src="<c:url value='/resources/js/validator.js'/>"></script>
			
	<!-- Custom javascript -->
	<script type="text/javascript" src="<c:url value='/resources/js/member.js'/>"></script>
</body>
</html>