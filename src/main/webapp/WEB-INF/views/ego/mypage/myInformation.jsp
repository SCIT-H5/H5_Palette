<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Palette - My Info</title>
	
	
	
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
		
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
	
	
<style type="text/css">
	.div_one{
	/* background-color:#DAD9FF;  */
	width: 25%;
	height: 683px;
	/* position: absolute; */
	float: left;
	top:87px;
	}
	.div_two{
	height: 683px;
	float: right;
	width: 75%;
	
	/* background-color:#EAEAEA;  */
	top:110px;
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
	
</style>
 
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
	
<body style="background-color:#ffffe6;">
	<!-- Navigation -->
	<%@include file="/WEB-INF/views/navi-font-black.jsp"%>
	
	<section class="text-center">
		<div class="my-auto" >
			<div class="mx-auto" style="margin-top: 100px; padding-top:0px;">
				<strong style="font-size: 60px;">Your Information</strong>				
			</div>         
		</div>      
	</section>

		<div class="div_one">
			<div class="inforEdit"><a href="#">会員情報修正</a></div>
			<div class="openEdit"><a href="#">公開範囲設定</a></div>
		</div>
		<div class="div_two">
			<div class="view_one"><%@include file="/WEB-INF/views/ego/mypage/inforEdit.jsp"%></div>
			<div class="view_two"><%@include file="/WEB-INF/views/ego/mypage/openEdit.jsp"%></div>
		</div>
	
    <section id="container" style="margin-top: 20px;">
		<!-- Footer -->
   	 	<%@include file="/WEB-INF/views/footer-text-black.jsp"%>
	</section>
	
	
	
</body>
</html>