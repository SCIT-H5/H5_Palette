<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공개 범위 설정</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
<style type="text/css">
.openDiv{
	
	/* background-color: gray; */
}

.openTable{
	border: 2px solid;
	/* background-color: orange; */
	margin:auto;
	margin-top: 250px;
	
}
.openTable th{
/* border: 2px solid; */
width: 200px;
height: 95px;
text-align: center;
}
</style>

<script type="text/javascript">
$(function() {
	var onoff = '${portList[0].portOpen}';

	if(onoff == 0){
		$('#port_off').prop('checked', true);
	}
	else if(onoff == 1){
		$('#port_on').prop('checked', true);
	}
	
	
	$('#port').on('change', function() {
		var portOpen = $('#port option:selected').attr("portOpen");
		if(portOpen == 0){
			$('#port_off').prop('checked', true);
		}
		else if(portOpen == 1){
			$('#port_on').prop('checked', true);
		}
	});
	
	$('#sbtn').on('click', function() {
		var portNum = $('#port option:selected').val();
		var portOpen = $("input:radio[name='portOpen']:checked").val();
		$.ajax({
			type:"POST",						
			url:"/h5/userinfo/openInfo",				
			data:{
				portNum : portNum,
				portOpen : portOpen
			},
			dataType:"text",				
			success:function(data){	
				console.log(data);
				alert("수정완료!");
			},
			error: function(e){			
				console.log(e);
			}
		});
	});
	
	/* $('#port_on').on('click', function() {
		$('#port option:selected').attr("portOpen", 1);
	});
	$('#port_off').on('click', function() {
		$('#port option:selected').attr("portOpen", 0);
	}); */
});
</script>
</head>
<body>
<div class="openDiv">

<form action="openInfo" method="post" id="openInfoForm">
	<table class="openTable">
		<tr>
			<th colspan="4">公開範囲設定</th>
			<th colspan="2">ON</th>
			<th colspan="2">OFF</th>
			
			
		</tr>
		<tr>
			<th colspan="4">
			<p>ポートフォリオ 選択</p>
			<select name="portNum" id="port">
				<c:forEach items="${portList }" var="list" varStatus="status">
					<option value="${list.portNum }" portOpen="${list.portOpen }">${status.index+1 }番ポートフォリオ</option>
				</c:forEach>

			</select>
			</th>
			
			<th colspan="2">
				<input type="radio" id="port_on" class="port_radio" name="portOpen" value="1">
			</th>
			<th colspan="2">
				<input type="radio" id="port_off" class="port_radio" name="portOpen" value="0">
			</th>
			
			
		</tr>
		
		
		
	</table>
	<br>
	<input type="button" id="sbtn" value="セーブ">
</form>	
</div>
</body>
</html>