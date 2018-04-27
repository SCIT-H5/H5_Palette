<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>자아분석 - 성격분석</title>
		
	<!-- Navigation -->
    <%@include file="/WEB-INF/views/navi.jsp"%>
	
	<!-- Table_Fixed_Header CSS -->
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css">
	<!--===============================================================================================-->
	
		
	<!-- Drag & Drop CSS -->
	<style type="text/css">
		.drag_word {
			cursor: move;
		}
		.drop_strongword {
			width: 750px; height: 50px; border: 1px solid black;
		}
		.drop_weakword {
			width: 750px; height: 50px; border: 1px solid black;
		}
		.strong_detail {
			width: 750px; height: 300px; border: 1px solid black; display: none; text-align:left;
		}
		 .weak_detail {
		 	width: 750px; height: 300px; border: 1px solid black; display: none; text-align:left;
		 }
		.in_strongword {
			cursor: pointer;
			font-size : 20px;
			color: red;
		}
		.in_weakword {
			cursor: pointer;
			font-size : 20px;
			color: blue;
		}
		.outer {
		  display: table;
		  width: 100%;
		  height: 100%;
		}
		.inner {
		  display: table-cell;
		  vertical-align: middle;
		  text-align: center;
		}
		.centered {
		  position: relative;
		  display: inline-block;
		 
		  width: 50%;
		  padding: 1em;
		}
	</style>
</head>

<body id="page-top" style="background-color: rgb(34,48,59);">
   	
   	<header>
		<div id="container">
		    <div class="row">
		      <div class="mx-auto">
		      	<img src="/h5/resources/img/personality-main.png" style="width: 100%;">
		      </div>         
		    </div>
	    </div>
   	</header>
   	
   	<section id="contact">   		
		<div id="container">
			<div class="outer">
				<div class="inner">
					<div class="centered">
						<table class="table100 ver2" style="width: 750px; height: 380px;">
							<c:forEach items="${personalityList}" var="list">
								<c:if test="${list.persListNum%5 == 1 }">
									<tr>
									<td style="padding:5px; margin: 3px;">
										<div class="drag_word" value="${list.persListNum }">${list.persListWord }</div>
									</td>
								</c:if>
								<c:if test="${list.persListNum%5 != 1 }">
									<td style="padding:5px; margin: 3px;">
										<div class="drag_word" value="${list.persListNum }">${list.persListWord }</div>
									</td>
								</c:if>
								<c:if test="${list.persListNum%5 == 0 }">
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
   		
   		<div class="outer"><div class="inner"><div class="centered">
			<div class="drop_strongword table100 ver2" style="text-align: left;">
				<b style="margin: 8px; font-size: large;">장점 |</b>
			</div>
			<span id="strong_detail" class="strong_detail table100 ver2" contenteditable="true"></span>
			<div class="drop_weakword table100 ver2" style="text-align: left;">
				<b style="margin: 8px; font-size: large;">단점 |</b>
			</div>
			<span id="weak_detail" class="weak_detail table100 ver2" contenteditable="true"></span>
		<div class="divOne">
			<input type="button" style="margin-top: 20px;" id="saveBtn" class="button_1" value="저장하기" onclick="saveForm()">			
		</div>
		</div></div></div>
		
	</section>		
	
	<!-- Footer -->
    <%@include file="/WEB-INF/views/footer-text-white.jsp"%> 
    
    
    <!-- JQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- Drag & Drop Table -->
    <script src="<c:url value='/resources/js/drag-n-drop.js'/>"></script>
</body>
	
</html>