<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자아분석 - SWOT WRITE PAGE</title>

	<!-- jquery 가져오기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	
	<!-- Table_Fixed_Header CSS -->	
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css">
	<!--===============================================================================================-->

	<script type="text/javascript">
	
		$(document).ready(function(){
			$("#button").on("click", function(){
				var complete = $('#swotWrite');
				complete.submit();
			});
		}); 
	</script>
</head>
<body style="background-color: rgb(34,48,80);">
<!-- 폼 작성 하는 곳 -->
<form action="swotWrite" method="post" id="swotWrite" name="swotWrite">
<section id="contact">
	    <div class="container" id="swottable">
	    
			<!-- Strength -->		
			<div class="table100 ver2 m-b-50">
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
								<td class="cell100 column1" id="swot1">
									<input type="text" id="swotO_O" name="swotS" value="" placeholder="強みを入力してください。" class="swotS">
								</td>				
							</tr>
						</tbody>
					</table>
				</div>	
			</div>
			
			<!-- Weakness -->
			<div class="table100 ver2 m-b-50">	
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
								<td class="cell100 column1" id="swot2">
									<input type="text" id="swotO_O" name="swotW" value="" placeholder="弱みを入力してください。" class="swotW">
								</td>				
							</tr>
						</thead>
					</table>
				</div>	
			</div>
			
			<!-- Opportunity -->
			<div class="table100 ver2 m-b-50">	
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
								<td class="cell100 column1" id="swot3">
									<input type="text" id="swotO_O" name="swotO" value="" placeholder="機会を入力してください。" class="swotO">
								</td>				
							</tr>
						</thead>
					</table>
				</div>
			</div>
			
			<!-- Threat -->
			<div class="table100 ver2 m-b-50">		
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
								<td class="cell100 column1" id="swot4">
									<input type="text" id="swotT_T" name="swotT" value="" placeholder="脅威を入力してください。" class="swotT">
								</td>				
							</tr>		
						</thead>
					</table>							
				</div>
			</div>
		</div>
	</section>
<!-- <table>
	<tr>
		<td>Strength (강점)</td>
		<th><input type="text" id="swotS_S" name="swotS" value="" placeholder="강점을 입력하시오"></th>
	</tr>
	<tr>
		<td>Weakness (약점)</td>
		<th><input type="text" id="swotW_W" name="swotW" value="" placeholder="약점을 입력하시오"></th>
	</tr>
	<tr>
		<td>Opportunity (기회)</td>
		<th><input type="text" id="swotO_O" name="swotO" value="" placeholder="기회를 입력하시오"></th>
	</tr>
	<tr>
		<td>Threat (위협)</td>
		<th><input type="text" id="swotT_T" name="swotT" value="" placeholder="위협을 입력하시오"></th>
	</tr>
</table> -->

<input type="submit" id="button" class="button_1" value="作成完了">

</form>
 

	<!-- Slide-Toggle -->
	<script src="<c:url value='/resources/js/slide-toggle.js'/>"></script>


	
</body>
</html>