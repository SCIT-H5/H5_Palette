<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>    
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.timelify.js" />" ></script>
	<script type="text/javascript">
	
	</script>
	
	<!-- Timelify animation 적용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/timelify/timelify.css">
	
	<title>history Read Form</title>
</head>
<body>

	<div class="timeline">
	
<%-- 		<c:forEach>
		
		
		</c:forEach> --%>
	
	   	<h2>2013</h2>
	   	<ul class="timeline-items">
	   		<li class="is-hidden timeline-item">
	   			<h3>Title</h3>
	   			<hr>
	   			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet cupiditate, delectus deserunt doloribus earum eveniet explicabo fuga iste magni maxime mollitia nemo neque, perferendis quod reprehenderit ut, vel veritatis voluptas?</p>
	   			<hr>
	   			<time>Date</time>
	   		</li>
	   	</ul>
	   	<h2>2014</h2>
	   	<ul class="timeline-items">
	   		<li class="is-hidden timeline-item">
	   			<h3>Title</h3>
	   			<hr>
	   			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci alias aspernatur consequuntur culpa deserunt ea esse est inventore, ipsa laborum officia, quam quia quidem, rem sunt tempora tenetur ullam voluptatem.</p>
	   			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta dolore harum iure quod ut! Accusamus aspernatur corporis est excepturi facere laudantium nesciunt nihil optio, quaerat quos rerum sunt suscipit voluptate?.</p>
	   			<hr>
	   			<time>Mars 2014</time>
	   		</li>
	   		<li class="is-hidden timeline-item centered">
	   			<h3>Title</h3>
	   			<hr>
	   			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, cupiditate dicta dignissimos dolorem doloribus ducimus eos error ex molestiae nobis odio odit optio placeat quasi repudiandae, unde velit voluptate voluptatem!
	   			</p>
	   			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab commodi consectetur cupiditate ea, eius excepturi expedita illum, incidunt ipsam iste modi obcaecati optio repellendus! Dolore dolores pariatur sint veniam voluptates!</p>
	   			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci consequatur distinctio doloremque eos eum eveniet fuga molestiae mollitia nesciunt nisi nobis nostrum, odio omnis pariatur praesentium quibusdam sequi sint voluptates.</p>
	   			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam, aspernatur commodi consequuntur corporis dicta, distinctio enim eos expedita, id iste laborum maxime nesciunt quaerat sed temporibus veniam vero voluptatem.</p>
	   			<p><a
	   					href="http://gamejolt.com/games/slender-the-cursed-forest/30950">Link</a>
	   			</p>
	   			<hr>
	   			<time>Date</time>
	   		</li>
	   
	   	</ul>
	</div>

	

</body>
</html>