<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>	
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<title>자아분석 - SWOT READ PAGE</title>
			
	<!-- jQuery -->
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	
	<!-- Table_Fixed_Header CSS -->
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/fonts/font-awesome-4.7.0/css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/select2/select2.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/perfect-scrollbar/perfect-scrollbar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css">
	<!--===============================================================================================-->
	
	<!-- Plugin CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

	<style type="text/css">.head { cursor:pointer; }</style>
	
	<script type="text/javascript">
		function writeForm(){	// 글쓰기 창 띄우기		
			window.open("swotWriteForm","writeForm","top=150,left=150,width=1500,height=500");		   	
		}	
	
		function editForm(){	// 글수정 창 띄우기
		    window.open("swotUpdateForm","UpdateForm","top=150,left=150,width=1500,height=500");
		}
			
		function deleteForm(loginId){	// 글삭제
			location.href="deleteswot";			
		}	
	</script>
</head>



<body id="page-top" style="background-color: rgb(34,48,59);">

	<!-- Navigation -->
    <%@include file="/WEB-INF/views/navi.jsp"%> 
   
   	<header>
      <div>
        <div class="row">
          <div class="mx-auto">
           	<img src="/h5/resources/img/swot-main.png" style="width: 100%;">
          </div>         
        </div>
      </div>
    </header>   
    
    <section id="contact">
    
	    <div class="container" id="swottable">
	    <c:choose>
			<c:when test="${swotlist == '' || swotlist == null }">
				<input type="button" id="button_1" class="button_1" value="입력하기" onclick="writeForm()">
			</c:when>
			<c:otherwise>
				<!-- Strength -->		
				<div class="table100 ver2 m-b-70">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head" id="flip1">
									<th class="cell100 column1">Strength</th>						
								</tr>
							</thead>
						</table>	
					</div>
					<div class="table100-body js-pscroll">	
						<table>	
							<tbody>
								<tr class="row100 body" id="panel1">
									<td class="cell100 column1" id="swot1">${swotlist.swotS}</td>				
								</tr>
							</tbody>
						</table>
					</div>	
				</div>
				
				<!-- Weakness -->
				<div class="table100 ver2 m-b-70">	
					<div class="table100-head">	
						<table>
							<thead>		
								<tr class="row100 head" id="flip2">
									<th class="cell100 column1">Weakness</th>						
								</tr>
							</thead>
						</table>	
					</div>
					<div class="table100-body js-pscroll">
						<table>
							<thead>
								<tr class="row100 body" id="panel2">			
									<td class="cell100 column1" id="swot2">${swotlist.swotW}</td>				
								</tr>
							</thead>
						</table>
					</div>	
				</div>
				
				<!-- Opportunity -->
				<div class="table100 ver2 m-b-70">	
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head" id="flip3">
						        	<th class="cell100 column1">Opportunity</th>
						      	</tr>
						    </thead>
						</table>
			      	</div>
			      	<div class="table100-body js-pscroll">
			      		<table>
							<thead>
							    <tr class="row100 body" id="panel3">
									<td class="cell100 column1" id="swot3">${swotlist.swotO}</td>				
								</tr>
							</thead>
						</table>
					</div>
				</div>
				
				<!-- Threat -->
				<div class="table100 ver2 m-b-70">		
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head" id="flip4">
						        	<th class="cell100 column1">Threat</th>
						      	</tr>
						    </thead>
						</table>
			      	</div>
			      	<div class="table100-body js-pscroll">
			      		<table>
							<thead>
							    <tr class="row100 body" id="panel4">
									<td class="cell100 column1" id="swot4">${swotlist.swotT}</td>				
								</tr>		
							</thead>
						</table>							
					</div>
				</div>	
				<div class="divOne">
			     	<input type="button" id="button_2" class="button_2 btn-xl" value="수정하기" onclick="editForm()">
			  	  	<input type="button" id="button_3" class="button_3 btn-xl" value="삭제하기" onclick="deleteForm()">
			  	</div>
			</c:otherwise>
		</c:choose>	    	    	    
	  						
		</div>
	</section>

	<!-- Footer -->
    <%@include file="/WEB-INF/views/footer-text-white.jsp"%> 
	
	
	
	<!-- ============================================================================================= -->
	
	<!-- Slide-Toggle -->
	<script src="<c:url value='/resources/js/slide-toggle.js'/>"></script>
	
	<!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.js'/>"></script>
    <script src="<c:url value='/resources/vendor/scrollreveal/scrollreveal.js'/>"></script>
    <script src="<c:url value='/resources/vendor/magnific-popup/jquery.magnific-popup.js'/>"></script>
    
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
	    <script src="<c:url value='/resources/js/creative.js'/>"></script>
 

</body>
</html>