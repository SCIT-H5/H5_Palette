<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>나만의 포트폴리오 만들기</title>
<%@include file="/WEB-INF/views/navi.jsp"%>

<!-- jquery, jquery-ui, 위젯에 필요한 css -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/js/wiget_default.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/js/wiget_table.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/js/wiget_graph.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/css/wiget.css">

<!-- graph -->
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/ion.rangeSlider.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/ion.rangeSlider2.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/colpick.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/dist/roundslider.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/normalize.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/ion.rangeSlider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/ion.rangeSlider.skinModern.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/colpick/colpick.css" type="text/css"/>
<link href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/roundslider.min.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/jquery.barrating.js"></script>
<link href="http://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-1to10.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-movie.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-square.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-pill.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-reversed.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bars-horizontal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/fontawesome-stars.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/css-stars.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/bootstrap-stars.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/barrating/themes/fontawesome-stars-o.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/css/bar_graph.css">
<!-- table -->


<style type="text/css">
	.ui-side1{
		position: absolute;
    	left: 57px;
    	top: 153px;
    	width: 50px;
		display : none;
	}
	.ui-side2{
		position: absolute;
		left : 47px;
		top : 0px;
		display: none;
	}
	.textEditBox {
		border-radius: 20px;
	}
</style>
<script>
document.execCommand('styleWithCSS', false, true);

document.execCommand('insertBrOnReturn', false, true);

var shapeselect;
var setr;
var setp;
var seth;
var setb;
var val;

var eTable;
var jsonData;
var bar_graphNum = 0;
var circle_graphNum = 0;
var etc_graphNum = 0;

var g_width;
var g_handleSize;
var g_handelShape;
var g_value;

$( function() {
	// 위젯박스, 포트폴리오영역 변수지정
	var $wigetBox = $( "#wigetBox" ),
	$trash = $( "#trash" );

	//colpick();
	imgUpload();

	// 수정이 아닐때 포트폴리오영역 resizable이벤트 생성
	if(${port == null}){
		$trash.resizable({
			maxWidth: 1000,
			autoHide: true
		});
		$trash.css('width', '1000px');
		$trash.css('height', '700px');
	}
    
    //저장버튼
    $('#savebtn').on('click', function () {
    	$('.edit_text').attr('contenteditable', false);	//텍스트박스 편집기능제거
    	//resizable이벤트제거
    	$('#trash').resizable('destroy');				
    	$( ".drag_text").resizable('destroy');
    	$( ".drag_img").resizable('destroy');
    	$( ".drag_video").resizable('destroy');
    	
    	//Table 내용 html코드에 저장
    	jsonData = JSON.stringify(exportData());
        if(jsonData != "[]"){
        	var json = JSON.parse(jsonData);
            var cnt = 0;
            for(var i=0; i<json.length; i++){
            	for(var j=0; j<json[i].length; j++){
            		$(".inputtable .hi2td:eq("+cnt+")").html("<input type='text' value='"+json[i][j]+"'>");
            		cnt++;
            	}	
            }
        }
    	
        $("input[type=text]").attr('readonly', true);
    	$(".addrowtd").hide();
		$(".addcolth").hide();
		$("#updatetoggle").hide();
		$("#complete").hide();
		
		$('.edit_graph_btn').css('display', 'none');
		$('.drag_graph_btn').css('display', 'none');
		
		$('#bar_graphNum').remove();
		$('#circle_graphNum').remove();
		$('#etc_graphNum').remove();
		$('#trash').prepend('<input type="hidden" id="bar_graphNum" value="'+bar_graphNum+'">');
		$('#trash').prepend('<input type="hidden" id="circle_graphNum" value="'+circle_graphNum+'">');
		$('#trash').prepend('<input type="hidden" id="etc_graphNum" value="'+etc_graphNum+'">');
		
		
		
    	var width = $('#trash').css('width');
    	var height = $('#trash').css('height');
    	$('#div_size').remove();
    	$('#trash').prepend("<input type='hidden' id='div_size' div_width='"+width+"' div_height='"+height+"'>");

		var html = $('#trash').html();	//포트폴리오영역의 html태그 전부 변수에 저장
		$('#saveDiv').val(html);		//hidden폼에 html태그 저장(view용)

		//그래프 뿌셔
		for(var i=0; i<etc_graphNum; i++){
			$('#stargraph'+i).barrating('destroy');
		}
		for(var i=0; i<bar_graphNum; i++){
			var s = $("#bargraph"+i).data("ionRangeSlider");
			if(typeof s === 'object')
				s.destroy();
			var bar = $("#bargraph"+i).val();
			$("#bargraph"+i).attr("g_value", bar);
		}
		
		html = $('#trash').html();	//포트폴리오영역의 html태그 전부 변수에 저장
		$('#saveDiv2').val(html);	//hidden폼에 html태그 저장(수정용)
		$('#portHeight').val(height);
		
		$('#saveForm').submit();		//전송
	});
    
    //포트폴리오 수정일때(이페이지에 넘어온값이 있을때)
    if(${port != null}) {
    	$trash.html('${port.portModify}');		//포트폴리오영역에 넘어온값 추가
    	
    	var width = $('#div_size').attr('div_width');
    	var height = $('#div_size').attr('div_height');
    	$trash.css('width', width);
		$trash.css('height', height);
		
		//여러가지 이벤트 초기화
    	$("input[type=text]").attr('readonly', false);
    	addcol();
    	addrow();
    	
    	bar_graphNum = $('#bar_graphNum').val();
    	circle_graphNum = $('#circle_graphNum').val();
    	etc_graphNum = $('#etc_graphNum').val();
    	
    	
    	for(var i=0; i<circle_graphNum; i++){
    		createGraph(i);
    	}
    	
    	
    	$trash.resizable({
    		maxWidth: 1000,
    		autoHide: true
    	});
    	$('.edit_text').attr('contenteditable', true);
    	
    	$( ".drag_text").draggable({
			revert: "invalid"	//포트폴리오영역 밖으로 나가면 제자리로 되돌아오는 속성
		}).click(function() {
			//클릭시 편집가능
			$(this).draggable({
				disabled: true
			});
			
		});
		$('.edit_text').blur(function() {
			//focus벗어나면 편집불가능
			$(".drag_text").draggable({
				disabled: false
			});
		});	
    	
    	$( ".drag_img").draggable({
			revert : "invalid"
		});
    	
    	$( ".drag_video").draggable({
			revert : "invalid"
		});
    	
    	$( ".drag_graph").draggable({
			revert : "invalid"
		});
    	
    	$( ".drag_stargraph").draggable({
			revert : "invalid"
		});
    	
    	$( ".drag_table").draggable({
			revert : "invalid"
		});
    	
    	
    	
    	$(".addrowtd").show();
		$(".addcolth").show();
		$("#updatetoggle").show();
		$("#complete").show();
    	
		$('.edit_graph_btn').css('display', 'block');
		$('.drag_graph_btn').css('display', 'block');
		
		$('.edit_graph_btn').on('click', function() {
  			$(this).siblings(".slider").roundSlider("enable");
  			$( ".drag_graph").draggable({
				disabled : true
			});
		});
  		
		$('.drag_graph_btn').on('click', function() {
			$(this).siblings(".slider").roundSlider("disable");
			$( ".drag_graph").draggable({
				disabled : false
			});
		});
		
		for(var i=0; i<etc_graphNum; i++){
			var type = $('#stargraph'+i).attr("g_type");
			var g_value = $('#stargraph'+i).attr("g_value");
			
			updateEtcGraph(i, type, g_value);
		}
		
		for(var i=0; i<bar_graphNum; i++){
			$("#bargraph"+i).ionRangeSlider({
				min : 0,
				max : 100,
				from : $("#bargraph"+i).attr("g_value"),
				hide_min_max : true
			/*          hide_from_to: true  최소값 최대값 보이기*/
			});
		}
		
		initResizable('.drag_text', 1);
    	initResizable('.drag_graph', 4);
    	initResizable('.drag_img', 0);
    	initResizable('.drag_video', -1);
    	$(".inputtable").resizable();
 	  	$(".hi2td").resizable();
    	
    	initCloseBtn('.drag_text');
    	initCloseBtn('.drag_graph');
    	initCloseBtn('.drag_stargraph');
    	initCloseBtn('.drag_img');
    	initCloseBtn('.drag_video');
    	initCloseBtn('.drag_table');
    }//if
    
});	/* //function종료 */
	
function createGraph(i) {
	var g_id = '#gslider'+i;
	var ctx = document.createElement('canvas').getContext('2d');
	g_width = $(g_id).attr("g_width");
	g_radius = $(g_id).attr("g_radius");
	g_handleSize = $(g_id).attr("g_handleSize");
	g_handelShape = $(g_id).attr("g_handleShape");
	g_value = $(g_id).attr("g_value");
	g_type = $(g_id).attr("g_type");
	
	ctx.strokeStyle = $(g_id).attr("rrc_bg");
	rrc_bg = ctx.strokeStyle;
	ctx.strokeStyle = $(g_id).attr("rpc_bg");
	rpc_bg = ctx.strokeStyle;
	ctx.strokeStyle = $(g_id).attr("rh_bg");
	rh_bg = ctx.strokeStyle;
	ctx.strokeStyle = $(g_id).attr("rb_bg");
	rb_bg = ctx.strokeStyle;
	ctx.strokeStyle = $(g_id).attr("rb_bd");
	rb_bd = ctx.strokeStyle;
	ctx.strokeStyle = $(g_id).attr("rh_pd");
	rh_pd = ctx.strokeStyle;
	ctx.strokeStyle = $(g_id).attr("rhrf_bd");
	rhrf_bd = ctx.strokeStyle;
	
	$('#slider'+i).roundSlider({
		radius: g_radius,
		width: g_width,
		handleSize: g_handleSize,
		handleShape: g_handelShape,
		sliderType: "min-range",
		value: g_value,
		
		create : function (e) {
			graph = e.options;
			g_width = graph.width;
			g_radius = graph.radius;
			g_handleSize = graph.handleSize;
			g_handleShape = graph.handleShape;
			g_value = graph.value;
			$('#gslider'+i).remove();
			$('#trash').prepend('<input type="hidden" id="gslider'+i+'" g_width="'+g_width+'" g_radius="'+g_radius+'" g_handleSize="'+g_handleSize+'" g_handleShape="'+g_handleShape+'" g_value="'+g_value+'"'
					+' g_type="'+g_type+'" rrc_bg="'+rrc_bg+'" rpc_bg="'+rpc_bg+'" rh_bg="'+rh_bg+'" rh_pd="'+rh_pd+'" rhrf_bd="'+rhrf_bd+'" rb_bg="'+rb_bg+'" rb_bd="'+rb_bd+'">');
		},
		change : function(e) {
			graph = e.options;
			g_width = graph.width;
			g_radius = graph.radius;
			g_handleSize = graph.handleSize;
			g_handleShape = graph.handleShape;
			g_value = graph.value;
			g_type = $(g_id).attr("g_type");
			rrc_bg = $('#slider'+i+ " .rs-range-color").css('background-color');
			rpc_bg = $('#slider'+i+ " .rs-path-color").css('background-color');
			rh_bg = $('#slider'+i+ " .rs-handle").css('background-color');
			rb_bg = $('#slider'+i+ " .rs-border").css('background-color');
			rb_bd = $('#slider'+i+ " .rs-border").css('border-color');
			rh_pd = $("#slider"+i+" .rs-handle").css('padding');
			rhrf_bd = $("#slider"+i+" .rs-handle.rs-focus").css('border-color');
			$('#gslider'+i).remove();
			$('#trash').prepend('<input type="hidden" id="gslider'+i+'" g_width="'+g_width+'" g_radius="'+g_radius+'" g_handleSize="'+g_handleSize+'" g_handleShape="'+g_handleShape+'" g_value="'+g_value+'"'
					+' g_type="'+g_type+'" rrc_bg="'+rrc_bg+'" rpc_bg="'+rpc_bg+'" rh_bg="'+rh_bg+'" rh_pd="'+rh_pd+'" rhrf_bd="'+rhrf_bd+'" rb_bg="'+rb_bg+'" rb_bd="'+rb_bd+'">');
		}
	});
	if(g_type == 2){
		$("#slider"+i+" .rs-range-color").css('background-color', rrc_bg);
		$("#slider"+i+" .rs-path-color").css('background-color', rpc_bg);
		$("#slider"+i+" .rs-handle").css('background-color', rh_bg);
		$("#slider"+i+" .rs-border").css('background-color', rb_bg);
	}
	else if(g_type == 3){
		$("#slider"+i+" .rs-range-color").css('background-color', rrc_bg);
		$("#slider"+i+" .rs-handle").css('background-color', rh_bg);
		$("#slider"+i+" .rs-border").css('border-color', rb_bd);
	}
	else if (g_type == 4){
		$("#slider"+i+" .rs-range-color").css('background-color', rrc_bg);
		$("#slider"+i+" .rs-path-color").css('background-color', rpc_bg);
		$("#slider"+i+" .rs-handle").css('background-color', rh_bg);
		$("#slider"+i+" .rs-handle").css('padding', rh_pd);
		$("#slider"+i+" .rs-handle.rs-focus").css('border-color', rhrf_bd);
		$("#slider"+i+" .rs-border").css('border-color', rb_bd);
	}
}

</script>
  
</head>
<body>

<div class="bg-image-blur" style="border: 1px solid black;">
					<img src="/h5/resources/img/portfoliomain.png" style="width: 100%;">
					
				</div>
<%-- <!-- Navigation -->
    <%@include file="/WEB-INF/views/navi.jsp"%>  --%>
   

<!-- <div id="graphColor">
	<div>handleShape</div>
	
	<select name="target" id="target" onchange="change()">
	    <option value="round">round</option>
	    <option value="dot">dot</option>
	    <option value="square">square</option>
	  </select>
	  
	<div class="divTable" style="border: 2px solid #000;">
		<div class="divTableBody">
			<div class="divTableRow">
				<div class="divTableCell">range</div>
				<div class="color-box" id="color-box-range"></div>
				<div class="divTableCell">path</div>
				<div class="color-box" id="color-box-path"></div>
				<div class="divTableCell">handle</div>
				<div class="color-box" id="color-box-handle"></div>
				<div class="divTableCell">background</div>
				<div class="color-box" id="color-box-background"></div>
			</div>
		</div>
	</div>
</div> -->
<!-- DivTable.com -->

<div class="ui-widget ui-helper-clearfix" style="margin: 0px;">
 
 	<!-- 포트폴리오 영역 -->

 	<div id="trash" class="ui-widget-header" style=" top:70px; border: 1px black solid"></div>

	<!-- 위젯영역 -->
	<div id="sidebox" class="sidebox">
		<c:if test="${port == null }">
			<input type="button" class="btn btn-primary btn-l" style="background: rgb(55,96,146);" value="セーブ" id="savebtn">
		</c:if>
		<c:if test="${port != null }">
			<input type="button" value="修正" id="savebtn">
		</c:if>
		<ul id="wigetBox" class="wigetBox ui-helper-reset ui-helper-clearfix">
		  <li class="ui-widget-content ui-corner-tr" value="1">
		   <!--  <h5 class="ui-widget-header">TextBox</h5> -->
		    <img src="${pageContext.request.contextPath}/resources/portfolio/img/text icon.png" width="96" height="72">
		  </li>
		  <li class="ui-widget-content ui-corner-tr" value="2">
		    <!-- <h5 class="ui-widget-header">Table</h5> -->
		    <img src="${pageContext.request.contextPath}/resources/portfolio/img/icon_table.png" width="96" height="72">
		  </li>
		  <li class="ui-widget-content ui-corner-tr" id="graph_1" style="cursor: pointer;">
		    <!-- <h5 class="ui-widget-header">그래프</h5> -->
		    <img src="${pageContext.request.contextPath}/resources/portfolio/img/graph icon_1.png" width="96" height="72">
		    <ul class="wigetBox ui-helper-reset ui-helper-clearfix ui-side1">

		    	<li class="ui-widget-content ui-corner-tr" value="3" id="bar_graph">
		    		<!-- <h5 class="ui-widget-header">바그래프</h5> -->

		    		<img src="${pageContext.request.contextPath}/resources/portfolio/img/mack.png" width="96" height="72">
		    		<ul class="wigetBox ui-helper-reset ui-helper-clearfix ui-side2" >
				    	<li class="ui-widget-content ui-corner-tr" value="3" type="1">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/bar_1.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="3" type="2">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/bar_2.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="3" type="3">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/bar_3.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="3" type="4">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/bar_4.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="3" type="5">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/bar_5.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="3" type="6">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/bar_6.png" width="96" height="72">
							</h5>
				    	</li>
		   			</ul>
		    	</li>
		    	<li class="ui-widget-content ui-corner-tr" id="circle_graph">
		    		<!-- <h5 class="ui-widget-header">원그래프</h5> -->
		    		<img src="${pageContext.request.contextPath}/resources/portfolio/img/icon_circlegraph.png" width="96" height="72">
		    		<ul class="wigetBox ui-helper-reset ui-helper-clearfix ui-side2">
				    	<li class="ui-widget-content ui-corner-tr" value="4" type="1">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/cycle_1.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="4" type="2">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/cycle_2.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="4" type="3">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/cycle_3.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="4" type="4">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/cycle_4.png" width="96" height="72">
							</h5>
				    	</li>
		   			</ul>
		    	</li>
		    	<li class="ui-widget-content ui-corner-tr" id="etc_graph">
		    		<!-- <h5 class="ui-widget-header">단계그래프</h5> -->
		    		<img src="${pageContext.request.contextPath}/resources/portfolio/img/icon_etc_graph.png" width="96" height="72">
		    		<ul class="wigetBox ui-helper-reset ui-helper-clearfix ui-side2">
				    	<li class="ui-widget-content ui-corner-tr" value="5" id="graph5_1">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/dan_1.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="5" id="graph5_2">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/dan_2.png" width="96" height="72">
							</h5>
				    	</li>
				    	<li class="ui-widget-content ui-corner-tr" value="5" id="graph5_3">
				    		<h5 class="ui-widget-header">
								<img src="${pageContext.request.contextPath}/resources/portfolio/img/dan_3png.png" width="96" height="72">
							</h5>
				    	</li>
		   			</ul>
		    	</li>
		    </ul>
		  </li>
		</ul>
		<input type=file name="file1" id="upload" style="display: none;" accept=".gif, .jpg, .png, .mp4">
		<img class="addfile" src="${pageContext.request.contextPath}/resources/portfolio/img/clip.png" width="48"  onclick="document.all.file1.click()">
	</div>
</div>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
<!-- 텍스트에디터 영역 -->
<div class="textEditBox" id="textEditBox">
	<img src="${pageContext.request.contextPath}/resources/portfolio/img/bold.png" class="textEditIcon" id="bold" >
	<img src="${pageContext.request.contextPath}/resources/portfolio/img/italic.png" class="textEditIcon" id="italic">
	<img src="${pageContext.request.contextPath}/resources/portfolio/img/underline.png" class="textEditIcon" id="underLine">
		
	<img src="${pageContext.request.contextPath}/resources/portfolio/img/left_sort.png" class="textEditIcon" id="justifyLeft">
	<img src="${pageContext.request.contextPath}/resources/portfolio/img/center_sort.png" class="textEditIcon" id="justifyCenter">
	<img src="${pageContext.request.contextPath}/resources/portfolio/img/right_sort.png" class="textEditIcon" id="justifyRight">
	<br>
	<select id="fontName" style="width: 23%;">
		<option value="">フォント</option>
		<option value="돋움">돋움</option>
		<option value="굴림">굴림</option>
		<option value="궁서">궁서</option>
		<option value="바탕">바탕</option>
		<option value="맑은 고딕">맑은 고딕</option>
	</select>
    	
	<select id="fontSize" style="width: 23%;">
		<option value="">文字サイズ</option>
		<option value="1">4px</option>
		<option value="2">8px</option>
		<option value="3">10px</option>
		<option value="4">12px</option>
		<option value="5">16px</option>
		<option value="6">20px</option>
		<option value="7">30px</option>
	</select>
	<br>
		
<<<<<<< HEAD
	<select id="foreColor" style="width: 23%;">
=======
	<select id="foreColor" width="50px">
>>>>>>> 5-1포폴공유,포폴height적용2
		<option value="">フォント色</option>
		<option value="#f00">赤い</option>
		<option value="#00f">青い</option>
		<option value="#0f0">緑</option>
		<option value="#ffff00">黄色い</option>
		<option value="#000">黒い</option>
	</select>

		
	<select id="hiliteColor" style="width: 23%;">
		<option value="">文字背景</option>
		<option value="#f00">赤い</option>
		<option value="#00f">青い</option>
		<option value="#0f0">緑</option>
		<option value="#ffff00">黄色い</option>
		<option value="#000">黒い</option>
	</select>
</div>
  
  
  
	
  <div id="ttdiv"></div>
  
  <!-- 포트폴리오 저장을 위한 폼 -->
  <c:if test="${port == null }">
	  <form action="portSave" method="post" id="saveForm">
	  	<input type="hidden" id="saveDiv" name="portContent" value="">
	  	<input type="hidden" id="saveDiv2" name="portModify" value="">
	  	<input type="hidden" id="portHeight" name="portHeight" value="">
	  	<input type="hidden" name="portId" value="${sessionScope.loginId }">
	  </form>
  </c:if>
  
  <c:if test="${port != null }">
	  <form action="portUpdate" method="post" id="saveForm">
	  	<input type="hidden" id="saveDiv" name="portContent" value="">
	  	<input type="hidden" id="saveDiv2" name="portModify" value="">
	  	<input type="hidden" id="portHeight" name="portHeight" value="">
	  	<input type="hidden" name="portNum" value="${port.portNum }">
	  	<input type="hidden" name="portId" value="${sessionScope.loginId }">
	  </form>
  </c:if>
  <section>
		<!-- Navigation -->
		<%@include file="/WEB-INF/views/footer-text-white.jsp"%>
	</section>
 
</body>


<script src="${pageContext.request.contextPath}/resources/portfolio/table/js/test4.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/table/css/jquery.edittable.min.css">


</html>