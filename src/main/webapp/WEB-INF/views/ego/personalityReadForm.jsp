<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자아분석 - 성격분석</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
	.drag_word {
		cursor: move;
	}
	.drop_strongword {
		width: 700px; height: 50px; border: 1px solid black;
	}
	.drop_weakword {
		width: 700px; height: 50px; border: 1px solid black;
	}
	.strong_detail {
		width: 700px; height: 300px; border: 1px solid black; display: none;
	}
	 .weak_detail {
	 	width: 700px; height: 300px; border: 1px solid black; display: none;
	 }
	.in_strongword {
		cursor: pointer;
		font-size : 20px;
		color: red;
	}
	.in_weakword {
		cursor: pointer;
		font-size : 20px;
		color: yellow;
	}
</style>
<script type="text/javascript">
	$(function() {
		var strong_cnt = 0;	//들어간 장점 갯수
		var weak_cnt = 0;	//들어간 단점 갯수
		
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
						alert("중복불가능");
						return;
					}
				}
				
				//div에 text추가
				$(this).append("<span class='in_strongword' id='strong"+strong_cnt+"'>"+word+"</span> ");
				
				//추가된 단어 클릭시 단어에 대한 편집영역 보이기,또는 숨기기
				$('.in_strongword').off('click').on('click', function() {
					var display = $('#strong_detail').css('display');
					if(display == 'none'){
						$('#strong_detail').css('display', 'block');
					}
					else if(display == 'block'){
						$('#strong_detail').css('display', 'none');
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
				$(this).append("<span class='in_weakword' id='weak"+weak_cnt+"'>"+word+"</span> ");
				
				//추가된 단어 클릭시 단어에 대한 편집영역 보이기,또는 숨기기
				$('.in_weakword').off('click').on('click', function() {
					var display = $('#weak_detail').css('display');
					if(display == 'none'){
						$('#weak_detail').css('display', 'block');
					}
					else if(display == 'block'){
						$('#weak_detail').css('display', 'none');
					}
				});
				
				weak_cnt++; //단점갯수 +
			}
		});
		
	});
</script>
</head>
<body>
	<div>
		<table border="1">
			<c:forEach items="${personalityList}" var="list">
				<c:if test="${list.persListNum%5 == 1 }">
					<tr>
					<td><div class="drag_word" value="${list.persListNum }">${list.persListWord }</div></td>
				</c:if>
				<c:if test="${list.persListNum%5 != 1 }">
					<td><div class="drag_word" value="${list.persListNum }">${list.persListWord }</div></td>
				</c:if>
				<c:if test="${list.persListNum%5 == 0 }">
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	
	<div class="drop_strongword"><b>장점 |</b> </div>
	<span id="strong_detail" class="strong_detail" contenteditable="true"></span>
	<div class="drop_weakword"><b>단점 |</b> </div>
	<span id="weak_detail" class="weak_detail" contenteditable="true"></span>
</body>
</html>