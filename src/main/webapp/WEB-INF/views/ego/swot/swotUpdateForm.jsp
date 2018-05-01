<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자아분석 - SWOT UPDATE PAGE</title>
<!-- jquery 가져오기 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jQuery -->
		
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
</head>
<body style="background-color: rgb(34,48,80);">
	
	<script type="text/javascript">
	$(document).ready(function(){
		  $("#button_q").on("click", function(){
			  var complete = $('#swotUpdate');
			  complete.submit();
		  });
		}); 
	</script>
<!-- 수정 시작 -->
<form action="swotUpdate" method="post" id="swotUpdate" name="swotUpdate">

	    <div class="container" id="swottable">
	    
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
<<<<<<< HEAD
<<<<<<< HEAD
								<td class="cell100 column1" id="swot1" name="swotS" contenteditable='true'>
									<input type="text" id="swotO_S" name="swotS" value="${sessionScope.swotlist.swotS}" placeholder="強みを入力してください。" class="swotS">
=======
								<td class="cell100 column1" id="swot1" name="swotS">
									<input type="text" id="swotO_O" name="swotS" value="${sessionScope.swotlist.swotS}" placeholder="강점을 입력하시오" class="swotS">
>>>>>>> 4-30.6차합병브런치
=======
								<td class="cell100 column1" id="swot1" name="swotS">
									<input type="text" id="swotO_O" name="swotS" value="${sessionScope.swotlist.swotS}" placeholder="강점을 입력하시오" class="swotS">
>>>>>>> 4-28지농점심
								</td>				
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
<<<<<<< HEAD
<<<<<<< HEAD
								<td class="cell100 column1" id="swot2"  name="swotW" contenteditable='true'>
									<input type="text" id="swotO_W" name="swotW" value="${sessionScope.swotlist.swotW}" placeholder="弱みを入力してください。" class="swotW">
=======
								<td class="cell100 column1" id="swot2"  name="swotW">
									<input type="text" id="swotO_O" name="swotW" value="${sessionScope.swotlist.swotW}" placeholder="약점을 입력하시오" class="swotW">
>>>>>>> 4-30.6차합병브런치
=======
								<td class="cell100 column1" id="swot2"  name="swotW">
									<input type="text" id="swotO_O" name="swotW" value="${sessionScope.swotlist.swotW}" placeholder="약점을 입력하시오" class="swotW">
>>>>>>> 4-28지농점심
								</td>				
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
<<<<<<< HEAD
<<<<<<< HEAD
								<td class="cell100 column1" id="swot3" name="swotO" contenteditable='true'>
									<input type="text" id="swotO_O" name="swotO" value="${sessionScope.swotlist.swotO}" placeholder="機会を入力してください。" class="swotO">
=======
=======
>>>>>>> 4-28지농점심
								<td class="cell100 column1" id="swot3" name="swotO">
									<input type="text" id="swotO_O" name="swotO" value="${sessionScope.swotlist.swotO}" placeholder="기회를 입력하시오" class="swotO">
>>>>>>> 4-30.6차합병브런치
								</td>				
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
<<<<<<< HEAD
<<<<<<< HEAD
								<td class="cell100 column1" id="swot4" contenteditable='true'>
									<input type="text" id="swotT_T" name="swotT" value="${sessionScope.swotlist.swotT}" placeholder="脅威を入力してください。" class="swotT">
=======
=======
>>>>>>> 4-28지농점심
								<td class="cell100 column1" id="swot4">
									<input type="text" id="swotT_T" name="swotT" value="${sessionScope.swotlist.swotT}" placeholder="위협을 입력하시오" class="swotT">
>>>>>>> 4-30.6차합병브런치
								</td>				
							</tr>		
						</thead>
					</table>							
				</div>
			</div>
		</div>
	<input type="submit" id="button_q" value="修整完了" class="button_1">
</form>
 
 	<!-- Slide-Toggle -->
	<script src="<c:url value='/resources/js/slide-toggle.js'/>"></script>
</body>
</html>