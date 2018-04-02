<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Palette - 회원가입</title>
	
	<!-- jQuery -->
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	
	<!-- Bootstrap -->
	<link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.css'/>" rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="<c:url value='/resources/css/member.css'/>" rel="stylesheet">
</head>

	<body>
		
		<div class="site-wrapper">
			<div class="site-wrapper-inner">
				<div class="cover-container">
					<div class="inner cover">
						<h1 class="cover-heading">회원 가입</h1>
						
						<form class="form-signin" id="signin-form" data-toggle="validator">
						
							<div class="form-group has-feedback">
								<label for="inputId" class="sr-only">아이디</label> 
								<input type="text" id="id" name="id" data-remote="checkId"
									class="form-control" placeholder="아이디" pattern="^[_A-z0-9]{1,}$"
									required>
									
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<span class="help-block">아이디는 숫자와 영어로만 작성해 주세요.</span>
								<div id="help-block-id" class="help-block with-errors"></div>
							</div>
							
							<div class="form-group has-feedback">
								<label for="inputPassword" class="sr-only">비밀번호</label>
								<input type="password" id="password" name="password" pattern="^[_A-z0-9]{1,}$" 
									class="form-control" placeholder="비밀번호" required>
									
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<span class="help-block">비밀번호는 숫자와 영어로만 작성해 주세요.</span>
								<div class="help-block with-errors"></div>
							</div>
							
							<div class="form-group has-feedback">
								<label for="inputPasswordCheck" class="sr-only">비밀번호 확인</label>
								<input type="password" id="inputPasswordCheck" class="form-control"
									placeholder="비밀번호 확인" data-match="#password" 
									data-match-error="비밀번호가 일치하지 않습니다!" required>
									
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							
							<div class="form-group has-feedback">
								<label for="inputName" class="sr-only">이름</label> 
								<input type="text" id="name" name="name"
									class="form-control" placeholder="이름" required>
									
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							
							<div class="form-group has-feedback">
								<label for="inputEmail" class="sr-only">이메일</label> 
								<input type="email" id="email" name="email" data-remote="checkEmail" 
									class="form-control" placeholder="이메일 주소" data-error="잘못된 이메일 주소입니다." 
									required>
									
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							
							<div class="form-group">
								<button class="btn btn-lg btn-primary" type="submit">
									회원 가입
								</button>
							</div>
							<a href="../" class="btn btn-lg btn-primary">
								돌아가기
							</a>
							
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