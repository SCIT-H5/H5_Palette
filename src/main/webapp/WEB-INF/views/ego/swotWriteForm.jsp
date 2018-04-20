<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자아분석 - SWOT WRITE PAGE</title>
<!-- jquery 가져오기 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript">
/* $(function(){
	
	$('#button').on('click',function(){
			 
		var params = $("#swotWrite").serialize();	
		$.ajax({
		url : "swotWrite",
		type : "POST",
		contentType : "application/json; charset=utf-8", 
              //보내줄때 형태 밑의 JSON.stringify({}) 와 같이 씀
		data : params,
		success : function(data){
			alert('디비에 저장되었습니다');
		
		},
		error : function(e){
					
		alert(JSON.stringify(e));
		}
				
		});
			
	});
}); */

 $(document).ready(function(){
	  $("#button").on("click", function(){
		  var complete = $('#swotWrite');
		  complete.submit();
	  });
	}); 
</script>
</head>
<body>
<!-- 폼 작성 하는 곳 -->
<form action="swotWrite" method="post" id="swotWrite" name="swotWrite">

<table>
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
</table>

<input type="submit" id="button" value="작성하기 ">

</form>
 



</body>
</html>