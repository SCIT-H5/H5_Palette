<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Navigation -->
	<%@include file="/WEB-INF/views/navi.jsp"%>    
	<title>Palette - 히스토리 작성</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Table_Fixed_Header CSS -->
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css">
	<!--===============================================================================================-->
	
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
		var hisDate = document.getElementById("hisDate");
		var hisTitle = document.getElementById("hisTitle");
		var hisContent = document.getElementById("hisContent");
		var hisPeriod = document.getElementById("hisPeriod");
		
		if(hisDate.value == ""){
			alert("연도을 입력해주세요.");
			hisDate.focus();
			return false;
		}
		
		if(hisTitle.value == ""){
			alert("제목을 입력해주세요.");
			hisTitle.focus();
			return false;
		}
		
		if(hisContent.value == ""){
			alert("내용을 입력해주세요.");
			hisContent.focus();
			return false;
		}
		
		if(hisPeriod.value == ""){
			alert("기간을 입력해주세요.");
			hisPeriod.focus();
			return false;
		}
		
		return true;
	}
	
	</script>

</head>
<body id="page-top" style="background-color: #e6e6e6;">

	<header id="bg-primary" style="height:70px; background-color: black;"></header>
	
	<section id="viewList" style="padding-bottom: 80px;">
	
	<h1 style="width: 100%; margin-bottom: 30px; text-align: center; font-weight: bold;">ヒストリー内容入力</h1>
	
		<form action="historyWrite" method="post" onsubmit="return formCheck();">
			<input type="hidden" name="hisId" id="hisId" value="${sessionScope.loginId}">
				<div class="table100 ver2 m-b-110" style="width: 70%; left: 15%;">
					<div class="table100-head">
					
					<table>	
						<tr class="row100 head" style="font-weight: bold;">
							<th class="cell100" style="padding-left: 50px; width:30%;">YEAR</th>
							<td class="cell100 row100 body" style="width:70%;"> 
								<input type="text" style="width:100%" name="hisDate" id="hisDate" placeholder="日にち入力">
							</td>
						</tr>
						<tr class="row100 head" style="font-weight: bold;">
							<th class="cell100" style="padding-left: 50px; width:30%;">TITLE</th>
							<td class="cell100 row100 body" style="width:70%;"> 
								<input type="text" style="width:100%" name="hisTitle" id="hisTitle" placeholder="タイトル入力">
							</td>
						</tr>
						<tr class="row100 head" style="font-weight: bold;">
							<th class="cell100" style="padding-left: 50px; width:30%;">CONTENT</th>
							<td class="cell100 row100 body" style="width:70%;"> 
								<textarea style="width:100%; height: 300px; border-color: #e6e6e6;" 
									name="hisContent" id="hisContent" placeholder="詳細内訳"></textarea>							
							</td>
						</tr>
						<tr class="row100 head" style="font-weight: bold;">
							<th class="cell100" style="padding-left: 50px; width:30%;">PERIOD</th>
							<td class="cell100 row100 body" style="width:70%;"> 
								<input type="text" style="width:100%" name="hisPeriod" id="hisPeriod" placeholder="期間入力">
							</td>
						</tr>										
					</table>
				</div>		
			</div>	
			<div class="mx-auto" style="text-align: center;">
		    	<input type="submit" class="text-uppercase text-white btn btn-primary btn-xl" value="作成完了">
			</div>
		</form>
	</section>

	<!-- Footer -->
	<%@include file="/WEB-INF/views/footer-text-black.jsp"%>  

	<!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.js'/>"></script>
    <script src="<c:url value='/resources/vendor/scrollreveal/scrollreveal.js'/>"></script>
    <script src="<c:url value='/resources/vendor/magnific-popup/jquery.magnific-popup.js'/>"></script>

    <!-- Custom scripts for this template -->
    <script src="<c:url value='/resources/js/creative.js'/>"></script>

	<!-- Table-Fixed-Header JS -->
	<!--===============================================================================================-->
		<script src="<c:url value='/resources/Table_Fixed_Header/vendor/bootstrap/js/popper.js'/>"></script>
		<script src="<c:url value='/resources/Table_Fixed_Header/vendor/bootstrap/js/bootstrap.js'/>"></script>
	<!--===============================================================================================-->
		<script src="<c:url value='/resources/Table_Fixed_Header/vendor/select2/select2.js'/>"></script>
	<!--===============================================================================================-->
		<script src="<c:url value='/resources/Table_Fixed_Header/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
		<script>
			$('.js-pscroll').each(function(){
				var ps = new PerfectScrollbar(this);
	
				$(window).on('resize', function(){
					ps.update();
				})
			});	
		</script>
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-23581568-13');
		</script>		
	<!--===============================================================================================-->
		<script src="<c:url value='/resources/Table_Fixed_Header/js/main.js'/>"></script>

</body>
</html>