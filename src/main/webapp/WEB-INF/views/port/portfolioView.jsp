<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/css/wiget.css">

<!-- graph -->
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/ion.rangeSlider.js"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/colpick.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/portfolio/graph/dist/roundslider.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/normalize.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/ion.rangeSlider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/graph/css/colpick/colpick.css" type="text/css"/>
<link href="${pageContext.request.contextPath}/resources/portfolio/graph/dist/roundslider.min.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/resources/portfolio/graph/js/jquery.barrating.min.js"></script>
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


<script type="text/javascript">
	$(function() {
		$('#see').html('${port.portContent}');
		
		
		var etc_graphNum = $('#etc_graphNum').val();
		var bar_graphNum = $('#bar_graphNum').val();
		
		for(var i=0; i<etc_graphNum; i++){
			var type = $('#stargraph'+i).attr("g_type");
			var g_value = $('#stargraph'+i).attr("g_value");
			if(type == 1){
				$('#stargraph'+i).barrating({
		    		theme: 'bars-horizontal',
		    		initialRating : g_value,
					readonly : true
		    	});
			}
			else if(type == 2){
				$('#stargraph'+i).barrating({
					theme: 'bars-movie',
					initialRating : g_value,
					readonly : true
		    	});
			}
			else if(type == 3){
				$('#stargraph'+i).barrating({
					theme: 'fontawesome-stars',
					initialRating : g_value,
					readonly : true
		    	});
			}
		}
		
		for(var i=0; i<bar_graphNum; i++){
			$("#bargraph"+i).ionRangeSlider({
				min : 0,
				max : 100,
				from : $("#bargraph"+i).attr("g_value"),
				from_min : $("#bargraph"+i).attr("g_value"),
				from_max : $("#bargraph"+i).attr("g_value"),
				hide_min_max : true
			/*          hide_from_to: true  최소값 최대값 보이기*/
			});
		}
		
		
		$('#update').on('click', function() {
			$('#upForm').submit();
		});
		
	})
</script>
</head>
<body>
	<form action="portUpdateForm" method="post" id="upForm">
		<input type="hidden" name="portNum" value="${port.portNum }">
		<input type="hidden" name="portId" value="${sessionScope.loginId }">
		<input type="button" id="update" value="수정">
	</form>
	<div id="see"></div>	
</body>
<script src="${pageContext.request.contextPath}/resources/portfolio/table/js/test4.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/portfolio/table/css/jquery.edittable.min.css">

</html>