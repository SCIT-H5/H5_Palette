<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/table/js/test3.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/table/js/wiget_table.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/table/css/jquery.edittable.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/table/css/jquery-ui.css">


<script type="text/javascript">
	var toggle = true;
	var jaatable;
	var tablehtml;
	var datatable;
	var dataable = true;

	$(function readtable() {
		$.ajax({
			url : "certificateRead",
			type : "POST",
			datatype : "json",
			//받아오는 데이터타입
			success : function(obj) {
				//console.log(JSON.stringify(obj));
				jaatable = obj.certJSON; //DB json 불러오기
				tablehtml = obj.certHtml; //DB html 불러오기
				console.log(jaatable);
				console.log(tablehtml);
				if(jaatable === undefined && tablehtml === undefined){ //두개다 널일시
					alert("노데이트");
					dataable = false;
					nodata(); //초기화테이블 생성
					tableresize(); //테이블 리사이즈 생성
				} else{
					alert("노데이트 아님"); //값이 있을때
					$('#edittable2').html(tablehtml); //테이블 html로 값을 그림
					tableresize();
					tableresizedis();
					addrow(); //addrow
				}
				
				// Example of jQuery UI datePicker
				$("#edittable2").on("focusin", "td:nth-child(3) input", function() {
					$(this).datepicker();
				});
			},
			error : function(e) {
				alert(e);
			}
		});
	});
	
	//edittable function
	function nodata() {
		jaatable = $("#edittable2") //edittable생성
				.editTable(
						{
							field_templates : {
								'textarea' : {
									html : '<textarea class="jaatextarea" style="width: 100%; height: 100%; resize: none; border: 0; text-align: center; font-family: Arial; "/>',
									getValue : function(input) {
										return $(input).val();
									},
									setValue : function(input, value) {
										return $(input).text(value);
									}
								}
							},
							row_template : [ 'textarea', 'textarea', 'text',
									'textarea', 'textarea' ],
							headerCols : [ '취득자격구문', '기관명', '취득일자', '비고',
									'자격증이미지' ],
							first_row : false
						});
		/* 
		// Example of jQuery UI datePicker
		$("#edittable2").on("focusin", "td:nth-child(3) input", function() {
			$(this).datepicker();
		});
		 */
		
	}; //end edittable function
	 
	$(document).ready(function() {
		$("#complete").click(function() {
			//테이블리사이즈 디스트로이
			tableresize();
			tableresizedis();

			//row추가 히든
			$(".addrowtd").hide();
			//수정버튼 히든
			//$("#updatetoggle").hide();
			//$("#complete").hide();
			if(dataable == true){
				datatable = JSON.stringify(exportData());
				alert("데이터" + datatable);
			} else{
				datatable = jaatable.getJsonData();
				alert("노데이터" + datatable);
			}
			alert(datatable);
			if(datatable != "[]"){
	        	var json = JSON.parse(datatable);
	            var cnt = 0;
	            for(var i=0; i<json.length; i++){
	            	for(var j=0; j<json[i].length; j++){
	            		$(".inputtable .hi2td:eq("+cnt+")").html("<input type='text' value='"+json[i][j]+"'>");
	            		cnt++;
	            	}	
	            }
	        }
			console.log(datatable);
			
			tablehtml = $('#edittable2').html();
			console.log(tablehtml);

			var datasum = {
				tablehtml : tablehtml,
				datatable : datatable
			};

			console.log(datasum);

			var datasum2 = JSON.stringify(datasum);

			//table data json 보내기
			$.ajax({
				url : "certificateWrite",
				type : "POST",
				data : {
					tablehtml : tablehtml,
					datatable : datatable
				},
				success : function() {
				},
				error : function(e) {
					alert(JSON.stringify(e));
				}
			});

		});
	});

	$(document).ready(function() { //업데이트 펑션
		$("#updatetoggle").click(function() {
			$(".addrowtd").slideToggle("slow");
			if (toggle == true) {
				$(".jaatextarea").attr("readonly", true);
				tableresize();
				toggle = false;
			} else {
				$(".jaatextarea").attr("readonly", false);
				tableresizedis();
				toggle = true;
			}
		});
	});


	// Resizable function
	function tableresize() {
		$(".inputtable").resizable();
		$(".hi2td").resizable();
	};
	
	function tableresizedis() {
		$(".inputtable").resizable('destroy');
		$(".hi2td").resizable('destroy');
	};


</script>

</head>
<body>

	<div id="edittable2"></div>

	<button id="updatetoggle">수정</button>
	<button id="complete">완료</button>

</body>
</html>
