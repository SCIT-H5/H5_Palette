<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
						<h1 class="cover-heading">회원 가입 중 오류가 발생하였습니다.</h1>
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