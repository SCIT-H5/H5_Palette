<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 수정</title>

<!-- jQuery -->
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/form-elements.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="/resources/assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/resources/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/resources/assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/resources/assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="/resources/assets/ico/apple-touch-icon-57-precomposed.png">

<script type="text/javascript">
	
	
	function formCheck() {
		
		var password = document.getElementById('password').value;
		var password_T = document.getElementById('inputPasswordCheck').value;
		var email = document.getElementById('email').value;
		
		
		if (password != password_T) {
			alert('비번이 일치하지 않습니다');
			password_T.focus();
			return false;
		}
		
		if (email == '') {
			alert('이메일을 입력 하시오');
			email.focus();
			return false;
		}
		
		return true;
		
	}
</script>



</head>

<body>

	<div class="col-sm-5">

		<div class="form-box">
			<div class="form-top">
				<div class="form-top-left">
					<h3>Sign up now</h3>
					<p>빈 칸을 작성해 주세요.</p>
				</div>
				<div class="form-top-right">
					<i class="fa fa-pencil"></i>
				</div>
			</div>
			<div class="form-bottom">
				<form role="form" action="editForm" method="post"
					class="form-signin" data-toggle="validator">
					<div class="form-group has-feedback">
						<label for="inputId" class="sr-only">아이디</label> <input
							type="text" id="id" name="id" 
							class="form-control" placeholder="${loginId}"
							pattern="^[_A-z0-9]{1,}$" readonly="readonly" required> <span
							class="glyphicon form-control-feedback" aria-hidden="true"></span>
						<span class="help-block">아이디는 숫자와 영어로만 작성해 주세요.</span>
						<div id="help-block-id" class="help-block with-errors"></div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputName" class="sr-only">이름</label> <input
							type="text" id="name" name="name" class="form-control"
							placeholder="${loginName}" readonly="readonly" required> <span
							class="glyphicon form-control-feedback" aria-hidden="true"></span>
						<div class="help-block with-errors"></div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputPassword" class="sr-only">비밀번호</label> <input
							type="password" id="password" name="password"
							pattern="^[_A-z0-9]{1,}$" class="form-control" placeholder="비밀번호"
							required> <span class="glyphicon form-control-feedback"
							aria-hidden="true"></span> <span class="help-block">비밀번호는
							숫자와 영어로만 작성해 주세요.</span>
						<div class="help-block with-errors"></div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputPasswordCheck" class="sr-only">비밀번호 확인</label> <input
							type="password" id="inputPasswordCheck" class="form-control"
							placeholder="비밀번호 확인" data-match="#password"
							data-match-error="비밀번호가 일치하지 않습니다!" required> <span
							class="glyphicon form-control-feedback" aria-hidden="true"></span>
						<div class="help-block with-errors"></div>
					</div>
					
					<div class="form-group has-feedback">
						<label for="inputEmail" class="sr-only">이메일</label> <input
							type="text" id="email" name="email" data-remote="checkEmail"
							class="form-control" placeholder="${loginEmail}"
							data-error="잘못된 이메일 주소입니다." required> <span
							class="glyphicon form-control-feedback" aria-hidden="true"></span>
						<div class="help-block with-errors"></div>
					</div>
					<button type="submit" class="btn" onclick='formCheck()'>회원수정</button>
					<a href="../" class="btn"> 돌아가기 </a>
				</form>
			</div>
		</div>
	</div>



	<!--        Javascript
        <script src="/resources/assets/js/jquery-1.11.1.min.js"></script>
        <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/resources/assets/js/scripts.js"></script> -->

	<%-- <!-- Bootstrap Validator -->
	<script type="text/javascript"
		src="<c:url value='/resources/js/validator.js'/>"></script> --%>

	<!-- Custom javascript -->
	<script type="text/javascript"
		src="<c:url value='/resources/js/member.js'/>"></script>

	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

</body>

</html>