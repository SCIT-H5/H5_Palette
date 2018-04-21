<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/table/js/test3.js"></script>
<script src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/table/css/jquery.edittable.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/table/css/jquery-ui.css">


<script type="text/javascript">
	var toggle = true;
	var jaatable;
	var data;


	$(function() {
		jaatable = $("#edittable2").editTable({
			/* 			
			data: [
				[""],
				[""]
			], 
			*/
			field_templates: {
					'textarea' : {
			            html: '<textarea class="jaatextarea" style="width: 100%; height: 100%; resize: none; border: 0; text-align: center; font-family: Arial; "/>',
			            getValue: function (input) {
			                return $(input).val();
			            },
			            setValue: function (input, value) {
			                return $(input).text(value);
			            }
				}
			},
			row_template: [
				'textarea', 'textarea', 'text', 'textarea', 'textarea'
			],
			headerCols: [
				'취득자격구문',
				'기관명',
				'취득일자',
				'비고',
				'자격증이미지'
			],
			first_row: false
		});
		
		// Example of jQuery UI datePicker
		$("#edittable2").on("focusin", "td:nth-child(3) input", function(){
		    $(this).datepicker();
			});
		});

		$(document).ready(function() {
			$("#updatetoggle").click(function() {
				$(".addrowtd").slideToggle("slow");
				
				if (toggle == true) {
					$(".jaatextarea").attr("readonly", true);
					toggle = false;
				} else {
					$(".jaatextarea").attr("readonly", false);
					toggle = true;
				}
			});
		});

	$(document).ready(function() {
		$("#complete").click(function() {
			
			/* 
			$(".addrowtd").hide();
			$("#updatetoggle").hide();
			$("#complete").hide();
			 */
			datatable = jaatable.getJsonData();
			 console.log(datatable);
			 
			  $.ajax({
	               url : "certificateWrite",
	               type : "POST",
	               contentType : "application/json; charset=utf-8",
	               data:datatable
	            });
 		});
		

	});

	/* 	$(function(){
	 $(".addcolth").resizable({
	 helper: "ui-resizable-helper"
	 });
	 });
	 */

	// Resizable function

	/* 리사이즈 */

	$(function() {
		$(".inputtable").resizable();
		$(".hi2td").resizable();
	});

	function complete() {
		$(".inputtable").resizable('destroy');
		$(".hi2td").resizable('destroy');
	}
	
/* 	
	function readtable(){
		$.ajax({
            url : "readtable",
            type : "get",
            datatype : "json",
            contentType : "text",
            data:datatable,
            //받아오는 데이터타입
            success : function(obj){
            },
            error : function(){
               alert("에러입니당!!");
            }
         });
		
		 
	}
	
*/
</script>

</head>
<body>

	<div id="edittable2"></div>

	<button id="updatetoggle">수정</button>
	<button id="complete" onclick="complete()">완료</button>

</body>
</html>
