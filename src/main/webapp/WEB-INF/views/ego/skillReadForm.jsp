<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Palette - 스킬 분석</title>

	<!-- Navigation -->
	<%@include file="/WEB-INF/views/navi.jsp"%>
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/graph/css/normalize.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/graph/css/ion.rangeSlider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/graph/css/ion.rangeSlider.skinModern.css" />

	<!-- Table_Fixed_Header CSS -->
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css">
	<!--===============================================================================================-->

<!-- All JS -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%-- 
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/ion.rangeSlider.js"></script>
 --%>
 <script src="${pageContext.request.contextPath}/resources/graph/js/ion.rangeSlider.js"></script>
		
	<!-- Custom scripts for this template -->
    <script src="<c:url value='/resources/js/creative.js'/>"></script>

<style type="text/css">

	.divTableBody {
		margin: 20px;
	}
	.divTable {
		color: white;
	}

</style>


<script type="text/javascript">
	var tnum = 0;
	var trow = 0;
	var toggle = true;
	
	
	$(function readgraph() {
		$.ajax({
            url : "skillload",
            type : "get",
            datatype : "json",
            //받아오는 데이터타입
            success : function(obj){

				if(obj.skillHtml === undefined && obj.skillRow === undefined){ //두개다 널일시
				} else{
		            skillHtml = obj.skillHtml;
		            trow = obj.skillRow;
		            tnum = obj.skillTrow;
	       			$('#maindiv').html(skillHtml); //테이블 html로 값을 그림
	       			for(var i=0; i<trow; i++){
	   					$("#js-range-slider"+i).ionRangeSlider({
	   						min : 0,
	   						max : 100,
	   						from : $("#js-range-slider"+i).attr("g-value"),
	   						hide_min_max : true
	   					});
	   				}
				}
       			
            },
            error : function(err){
                     //에러 정보를 가진 자바스크립트 객체를 파라미터로
            }
         });
	});

	function addtable() {
		var tablevalue = $('#divtablevalue').val();
		
		++tnum; //테이블넘버++
		
		var tadd = '<div class="divTable" id="divTable'+tnum+'" style="color: yellow;">';
		tadd += tablevalue;
		tadd += '<div class="divTableBody" id="divTableBody'+tnum+'">';
		tadd += '</div>';
		tadd += '</div>';
		tadd += '<input type="button" class="addgraphbtn btn btn-primary btn-light btn-l" onclick="addgraph('+tnum+')" id="addgraphbtn'+tnum+'" style="padding: 20px; margin: 10px;" value="グラフ追加"></input>';
		tadd += '<input type="text" class="divTableCell table100 ver2" id="divTableCell'+tnum+'" style="float: left; padding: 20px; margin: 10px; width: 40%;"></input>';
		tadd += '<input type="button" class="deltablebtn btn btn-primary btn-light btn-l" onclick="deltable('+tnum+')" id="deltablebtn'+tnum+'" style="padding: 20px; margin: 10px;" value="テーブル削除"></input>';

		$('#maindiv').append(tadd);
		
		$('#divtablevalue').val("");
		
	}

	function deltable(tnum) {
		$(document).ready(function() {
			$("#divTable" + tnum).remove();
			$("#addgraphbtn" + tnum).remove();
			$("#divTableCell" + tnum).remove();
			$("#deltablebtn" + tnum).remove();
		});
	}
	
	function delrow(rownum){
		$(document).ready(function() {
			$("#divTableRow" + rownum).remove();
			$("#range-slider" + rownum).remove();
			$("#js-range-slider" + rownum).remove();
			$("#delrowbtn" + rownum).remove();
		});
	}

	function addgraph(gtnum) { //gtnum 현제 테이블 넘버
		console.log(gtnum+'현재 테이블넘버');
		var gtext = $('#divTableCell'+gtnum).val(); //그려준 그래프 추가의 텍스트를 가져온다.
		console.log(gtext+'gtext값');
		
		$('#divTableCell'+gtnum).val(""); //값을 지워준다.

		var gadd = '<div class="divTableRow" id="divTableRow'+trow+'"  style="color: white;">';
		gadd += '<div class="divGraphCell" id="divGraphCell'+trow+'">'+gtext+'</div>';
		gadd += '<div class="range-slider color-1" style="width:80%;" id="range-slider'+trow+'">';
		gadd += '<input type="text" class="js-range-slider" id="js-range-slider'+trow+'" />'; //슬라이더에 trow더하기
		gadd += '</div>';
		gadd += '<input type="button"  class="delrow btn btn-primary btn-l btn-light" style="margin: 10px; position: relative; top: -40px; float:right;" value="削除" onclick="delrow('+trow+')" id="delrowbtn'+trow+'"></input>';
		gadd += '</div>';
		
		
		//gadd += '<input type="button" onclick="delgraph('+gtnum+')" value="그래프 추가" style="float: left; vertical-align: bottom;"></input>';
		
		$('#divTableBody'+gtnum).append(gadd);
		
		$(function initslider() {

			$("#js-range-slider"+trow).ionRangeSlider({
				min : 0,
				max : 100,
				hide_min_max : true,
			/*          hide_from_to: true  최소값 최대값 보이기*/
			});

		});
		
		trow++;
		
		
	}
	
	$(document).ready(function() {
		$("#updateto").click(function() {
			if (toggle == true) {
				//숨기기
				$(document).ready(function() {
					$('.delrow').show();
					$('.divTableCell').show();
					$('.addgraphbtn').show();
					$('.deltablebtn').show();
				});
				toggle = false;
			} else {
				//나타내기
				$(document).ready(function() {
					$('.delrow').hide();
					$('.divTableCell').hide();
					$('.addgraphbtn').hide();
					$('.deltablebtn').hide();
				});
				toggle = true;
			}
		});
	});
	
	$(document).ready(function() {
		$("#complete").click(function() {
			for(var i=0; i<trow; i++){
				var s = $("#js-range-slider"+i).data("ionRangeSlider");
				if(typeof s === 'object')
					s.destroy();
				var bar = $("#js-range-slider"+i).val();
				$("#js-range-slider"+i).attr("g-value", bar);
			}
			
			var graphhtml = $('#maindiv').html();
			console.log(graphhtml);
			
			for(var i=0; i<trow; i++){
				$("#js-range-slider"+i).ionRangeSlider({
					min : 0,
					max : 100,
					hide_min_max : true,
				});
			}
			
			var graphrow = trow;
			graphrow.toString();
			//alert(graphrow); 그래프개순
			
			$.ajax({
				url : "skillWrite",
				type : "POST",
				data : {
					graphhtml : graphhtml,
					graphrow : trow,
					tablerow : tnum
				},
				success : function(){
					
				},
				error : function(e) {
					alert(JSON.stringify(e));
				}
			});//endtoajax
			
		});//endtoclick
	});
</script>
</head>
<body id="page-top" style="background-color: rgb(34,48,59);">
	
	<header>
		<div>
	        <div class="row">
	          <div class="mx-auto">
	           	<img src="/h5/resources/img/skill-main.png" style="width: 100%;">
	          </div>         
	        </div>
	    </div>
	</header>
	
	<section>
		<div id="maindiv" style="width: 60%; margin: auto;"></div>
	</section>

	<section>
		<div style="width: 75%; margin-left: auto;">
			<div style="margin: auto;">
				<input type="button" class="btn btn-primary btn-light btn-l" onclick="addtable()" value="テーブル追加" style="padding: 20px; margin: 10px; float: left; vertical-align: bottom;"></input>
				<input type="text" id="divtablevalue" class="table100 ver2" style="float: left; padding: 20px; margin: 10px; width: 40%;"></input>
			</div>
			<div>
				<input type="button" class="btn btn-primary btn-light btn-l" id="updateto" style="padding: 20px; margin: 10px;" value="修正"></input>
				<input type="button" class="btn btn-primary btn-light btn-l" id="complete" style="padding: 20px; margin: 10px;" value="完了"></input>
			</div>
		</div>
	</section>

	
	<!-- Footer -->
    <%@include file="/WEB-INF/views/footer-text-white.jsp"%> 
    
</body>
</html>