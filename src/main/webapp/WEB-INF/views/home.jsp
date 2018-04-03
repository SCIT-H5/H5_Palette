<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Palette !</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

    <!-- Custom fonts for this template -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css">
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'>
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'>

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/creative.min.css">

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Start Your Dream!</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="userinfo/login">Log-In</a>
            </li>    
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="userinfo/join">Join</a>
            </li>          
          </ul>
        </div>
      </div>
    </nav>

    <header class="masthead text-center text-white d-flex">
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h1 class="text-uppercase">
              <strong>Draw Your Dreams for Yourself!</strong>
            </h1>
            <hr>
          </div>
          <div class="col-lg-8 mx-auto">
            <p class="text-faded mb-5">자신만의 포트폴리오를 만들어 보세요</p>
            <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">시작하기!</a>
          </div>
        </div>
      </div>
    </header>

    <section class="bg-primary" id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading text-white">About...</h2>
            <hr class="light my-4">
            <p class="text-faded mb-4">[ 프로젝트에 대한 설명 필요 ]</p>
            <a class="btn btn-light btn-xl js-scroll-trigger" href="userinfo/login">Get Started!</a>
          </div>
        </div>
      </div>
    </section>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/scrollreveal/scrollreveal.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/magnific-popup/jquery.magnific-popup.min.js'/>"></script>

    <!-- Custom scripts for this template -->
    <script src="<c:url value='/resources/js/creative.min.js'/>"></script>

  </body>

</html>
