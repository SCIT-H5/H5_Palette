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

	<script type="text/javascript">
		$(function() {
			//alert('${persS}');
		
			if(${persS == '[]' && persW == '[]'}){
				nodata();
			}
			else {
				yesdata();
			}
		});
		
		function yesdata() {
			var strong_cnt = 0;	//들어간 장점 갯수
			var weak_cnt = 0;	//들어간 단점 갯수
			
			if(${persS[0].persWord != null}){
				$('.drop_strongword').append("<span class='in_strongword' id='strong"+strong_cnt+"' value='"+strong_cnt+"'>${persS[0].persWord}</span> ");
				strong_cnt++;	
			}
			if(${persS[1].persWord != null}){
				$('.drop_strongword').append("<span class='in_strongword' id='strong"+strong_cnt+"' value='"+strong_cnt+"'>${persS[1].persWord}</span> ");
				strong_cnt++;	
			}	
			if(${persS[2].persWord != null}){
				$('.drop_strongword').append("<span class='in_strongword' id='strong"+strong_cnt+"' value='"+strong_cnt+"'>${persS[2].persWord}</span> ");
				strong_cnt++;	
			}	
			if(${persW[0].persWord != null}){
				$('.drop_weakword').append("<span class='in_weakword' id='weak"+weak_cnt+"' value='"+weak_cnt+"'>${persW[0].persWord}</span> ");
				weak_cnt++;	
			}
			if(${persW[1].persWord != null}){
				$('.drop_weakword').append("<span class='in_weakword' id='weak"+weak_cnt+"' value='"+weak_cnt+"'>${persW[1].persWord}</span> ");
				weak_cnt++;	
			}	
			if(${persW[2].persWord != null}){
				$('.drop_weakword').append("<span class='in_weakword' id='weak"+weak_cnt+"' value='"+weak_cnt+"'>${persW[2].persWord}</span> ");
				weak_cnt++;	
			}	
			
			$('.in_strongword').off('click').on('click', function() {
				
				var v = $(this).attr('value');
				var display = $('#strong_detail'+v).css('display');
				if(display == 'none'){
					$('.strong_detail').css('display', 'none');
					$('#strong_detail'+v).css('display', 'block');
				}
				else if(display == 'block'){
					$('#strong_detail'+v).css('display', 'none');
				}
			});
			
			$('.in_weakword').off('click').on('click', function() {
				var v = $(this).attr('value');
				var display = $('#weak_detail'+v).css('display');
				if(display == 'none'){
					$('.weak_detail').css('display', 'none');
					$('#weak_detail'+v).css('display', 'block');
				}
				else if(display == 'block'){
					$('#weak_detail'+v).css('display', 'none');
				}
			});
			//성격리스트에 드래그이벤트 생성
			$('.drag_word').draggable({
				revert: "invalid",
				helper: "clone",
				cursor: "move"
			});
			
			//장점div영역에 드롭이벤트 생성
			$('.drop_strongword').droppable({
				drop : function( event, ui ) {
					var word = ui.draggable.text();		//드래그 된 text값 변수에 담기
					if(strong_cnt >= 3){
						alert('장점은 3개까지만 가능합니다');
						return;
					}
					
					//중복단어검사
					for(var i=0; i<strong_cnt; i++){
						var txt = $('#strong'+i).text();
						if(txt == word){
							alert("중복 불가능");
							return;
						}
					}
					
					//div에 text추가
					$(this).append("<span class='in_strongword' id='strong"+strong_cnt+"' value='"+strong_cnt+"'>"+word+"</span> ");
					
					//추가된 단어 클릭시 단어에 대한 편집영역 보이기,또는 숨기기
					$('.in_strongword').off('click').on('click', function() {
						
						var v = $(this).attr('value');
						var display = $('#strong_detail'+v).css('display');
						if(display == 'none'){
							$('.strong_detail').css('display', 'none');
							$('#strong_detail'+v).css('display', 'block');
						}
						else if(display == 'block'){
							$('#strong_detail'+v).css('display', 'none');
						}
					});
					strong_cnt++;	//장점갯수 +
				}
			});
			
			//단점div영역에 드롭이벤트 생성
			$('.drop_weakword').droppable({
				drop : function( event, ui ) {
					var word = ui.draggable.text();
					if(weak_cnt >= 3){
						alert('단점은 3개까지만 가능합니다');
						return;
					}
					
					//중복단어검사
					for(var i=0; i<weak_cnt; i++){
						var txt = $('#weak'+i).text();
						if(txt == word){
							alert("중복불가능");
							return;
						}
					}
					
					//div에 text추가
					$(this).append("<span class='in_weakword' id='weak"+weak_cnt+"' value='"+weak_cnt+"'>"+word+"</span> ");
					
					//추가된 단어 클릭시 단어에 대한 편집영역 보이기,또는 숨기기
					$('.in_weakword').off('click').on('click', function() {
						var v = $(this).attr('value');
						var display = $('#weak_detail'+v).css('display');
						if(display == 'none'){
							$('.weak_detail').css('display', 'none');
							$('#weak_detail'+v).css('display', 'block');
						}
						else if(display == 'block'){
							$('#weak_detail'+v).css('display', 'none');
						}
					});
					
					weak_cnt++; //단점갯수 +
				}
			});
			
			$('#updateBtn').on('click', function() {
				for(var i=0; i<strong_cnt; i++){
					var s = $('#strong'+i).text();
					var sc = $('#strong_detail'+i).text();
					$('#u_s'+i).val(s);
					$('#u_sContent'+i).val(sc);
				}
				for(var j=0; j<weak_cnt; j++){
					var w = $('#weak'+j).text();
					var wc = $('#weak_detail'+j).text();
					$('#u_w'+j).val(w);
					$('#u_wContent'+j).val(wc);
				}
				$('#updateForm').submit();
			});
		}//yesdata
	</script>
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
			<c:if test="${persS == '[]' }">
				<span id="strong_detail0" class="strong_detail table100 ver2" contenteditable="true"></span>
				<span id="strong_detail1" class="strong_detail table100 ver2" contenteditable="true"></span>
				<span id="strong_detail2" class="strong_detail table100 ver2" contenteditable="true"></span>
			</c:if>
			<c:if test="${persS != '[]' }">
				<c:forEach items="${persS }" var="persS" varStatus="status">
					<span id="strong_detail${status.index }" class="strong_detail table100 ver2" contenteditable="true">${persS.persContent }</span>
				</c:forEach>
			</c:if>
			<div class="drop_weakword table100 ver2" style="text-align: left;">
				<b style="margin: 8px; font-size: large;">단점 |</b>
			</div>
			<c:if test="${persW == '[]' }">
				<span id="weak_detail0" class="weak_detail table100 ver2" contenteditable="true"></span>
				<span id="weak_detail1" class="weak_detail table100 ver2" contenteditable="true"></span>
				<span id="weak_detail2" class="weak_detail table100 ver2" contenteditable="true"></span>
			</c:if>
			<c:if test="${persW != '[]' }">
				<c:forEach items="${persW }" var="persW" varStatus="status">
					<span id="weak_detail${status.index }" class="weak_detail table100 ver2" contenteditable="true">${persW.persContent }</span>
				</c:forEach>
			</c:if>
		<div class="divOne">
			<c:if test="${persS == '[]' && persW == '[]' }">
				<input type="button" style="margin-top: 20px;" id="saveBtn" class="button_1" value="저장하기">
			</c:if>
			<c:if test="${persS != '[]' || persW != '[]' }">
				<input type="button" style="margin-top: 20px;" id="updateBtn" class="button_1" value="수정하기">
			</c:if>
		</div>
		</div></div></div>
		
	</section>		
	
	<form action="personalityWrite" method="post" id="personalityForm">
		<input type="hidden" name="s0" id="s0">
		<input type="hidden" name="s1" id="s1">
		<input type="hidden" name="s2" id="s2">
		<input type="hidden" name="sContent0" id="sContent0">
		<input type="hidden" name="sContent1" id="sContent1">
		<input type="hidden" name="sContent2" id="sContent2">
		<input type="hidden" name="w0" id="w0">
		<input type="hidden" name="w1" id="w1">
		<input type="hidden" name="w2" id="w2">
		<input type="hidden" name="wContent0" id="wContent0">
		<input type="hidden" name="wContent1" id="wContent1">
		<input type="hidden" name="wContent2" id="wContent2">
	</form>
	
	<form action="personalityUpdate" method="post" id="updateForm">
		<input type="hidden" name="s0" id="u_s0">
		<input type="hidden" name="s1" id="u_s1">
		<input type="hidden" name="s2" id="u_s2">
		<input type="hidden" name="sContent0" id="u_sContent0">
		<input type="hidden" name="sContent1" id="u_sContent1">
		<input type="hidden" name="sContent2" id="u_sContent2">
		<input type="hidden" name="w0" id="u_w0">
		<input type="hidden" name="w1" id="u_w1">
		<input type="hidden" name="w2" id="u_w2">
		<input type="hidden" name="wContent0" id="u_wContent0">
		<input type="hidden" name="wContent1" id="u_wContent1">
		<input type="hidden" name="wContent2" id="u_wContent2">
	</form>
	
	<!-- Footer -->
    <%@include file="/WEB-INF/views/footer-text-white.jsp"%> 
    
    
    <!-- JQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- Drag & Drop Table -->
    <script src="<c:url value='/resources/js/drag-n-drop.js'/>"></script>
</body>
	
</html>