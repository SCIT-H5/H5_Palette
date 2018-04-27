/**
 * 		Slide Toggle
 * 		2018-04-16
 * 		Made By H5_Palette
 */

	$(document).ready(function(){
	   if ($("#swot1").text() || $("#swot2").text() || $("#swot3").text() || $("#swot4").text()) {
	      for (var i = 1; i < 5; i++) {
	         if ($("#swot" + i).text()) {
	             $("#flip" + i).show();
	             $("#panel" + i).slideToggle("slow");
	         }
	         else if(!$("#swot" + i).text()){
	            $("#flip" + i).hide();
	            $("#panel" + i).hide();
	         }
	      }
	      
	      $("#toggle").hide();
	   }
	   else{
	      console.log("전부 비어있는값입니다.");
	      //$("#swottable").hide();
	      $("#toggle").show();
	   }
	});

   $(document).ready(function() {
      $("#panel1").hide();
	  $("#flip1").click(function() {
		  $("#panel1").slideToggle("slow");
	  });
   });

   $(document).ready(function() {
      $("#panel2").hide();
      $("#flip2").click(function() {
    	  $("#panel2").slideToggle("slow");
      });
   });

   $(document).ready(function() {
      $("#panel3").hide();
      $("#flip3").click(function() {
    	  $("#panel3").slideToggle("slow");
      });
   });

   $(document).ready(function() {
      $("#panel4").hide();
      $("#flip4").click(function() {
    	  $("#panel4").slideToggle("slow");
      });
   });

