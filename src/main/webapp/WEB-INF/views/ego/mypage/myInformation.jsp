<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이 인포메이션</title>
	
	<!-- Navigation -->
	<%@include file="/WEB-INF/views/navi-font-black.jsp"%>
<!-- 
<style type="text/css">
	.div_one{
	background-color:#DAD9FF; 
	width: 25%;
	height: 100%;
	position: absolute;
	top:87px;
	}
	.div_two{
	float: right;
	width: 75%;
	height: 100%;
	background-color:#EAEAEA; 
	top:110px;
	}
	.view_one{
	
	}
	.inforEdit{
	
	margin-top:250px;
	margin-bottom:200px;
	text-align: center;
	font-size: 30px;
	}
	.openEdit{
	
	text-align: center;
	font-size: 30px;
	}
	.back{
		background-color: #BCBCBC;
	}
</style>
 -->
<script type="text/javascript">
	$(document).ready(function() {
		$(".view_two").hide();
		$(".inforEdit").click(function() {
			$(".view_two").hide();  
			$(".view_one").show();
		});
	 
		$(".openEdit").click(function() {
			$(".view_one").hide();
			$(".view_two").show();
		});
	});
</script>

</head>
	
<body class="back">

	<header class="text-center text-black d-flex">
		<div class="my-auto" >
			<div class="mx-auto" style="text-align: center;">
				<div class="row" style="left: 40%; top: 9%; display: inline-block; width: 50%; padding: 1em;">   
					<div class="col-lg-10 mx-auto">
						<h1 class="text-uppercase">
							<strong>Your Information</strong>
						</h1>
					</div>   					
				</div>
			</div>         
		</div>      
	</header> 
	
	<section>
		<div class="div_one">
			<div class="inforEdit"><a href="#">회원 정보 수정</a></div>
			<div class="openEdit"><a href="#">공개 범위 설정</a></div>
		</div>
		<div class="div_two">
			<div class="view_one"><%@include file="/WEB-INF/views/ego/mypage/inforEdit.jsp"%></div>
			<div class="view_two"><%@include file="/WEB-INF/views/ego/mypage/openEdit.jsp"%></div>
		</div>
	</section>

	<!-- Footer -->
    <%@include file="/WEB-INF/views/footer-text-black.jsp"%>
    
	<!-- jQuery -->
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
    
</body>
</html>