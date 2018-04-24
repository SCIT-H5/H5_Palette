<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이 인포메이션</title>



<!-- jQuery -->
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>

<style type="text/css">
.div_one{
background-color:#DAD9FF; 
width: 25%;
height: 100%;
position: absolute;
}
.div_two{
position: absolute;
left:25%;
width: 75%;
height: 75%;
background-color:#EAEAEA; 
}
.div_three{
	position: absolute;
    background-color: #E4F7BA;
    width: 75%;
    height: 25%;
    left: 25%;
    top: 75%;
}
ul{
	margin-top: 120px;
    /* text-align: center; */
    font-size: 30px;
}
li{
	margin-top: 30px;
}
</style>

<script type="text/javascript">

$(document).ready(function() {
		 
	      $(".pofol").click(function() {
	    	alert("눌렀단당~");
	      });
	      
	      
	   });
	   



</script>
</head>
<body>


    
<div class="div_one">
	<div class="view_one">
		<!-- 저장한 포폴 여러개일때 for문으로 출력 하면됨 -->
			<ul>
				<li class="pofol">저장한 포폴 </li>
				<li class="pofol">저장한 포폴 </li>
				<li class="pofol">저장한 포폴 </li>
				<li class="pofol">저장한 포폴 </li>
				<li class="pofol">저장한 포폴 </li>
				<li class="pofol">저장한 포폴 </li>
				<li class="pofol">저장한 포폴 </li>
			</ul>
	</div>	
</div>

<div class="div_two">
	
	클릭한 포폴 나타남
</div>
<div class="div_three">
<!-- 저장한 코멘트가 여러개일때 for문으로 출력 하면됨 -->
コメント部分
</div>
</body>
</html>