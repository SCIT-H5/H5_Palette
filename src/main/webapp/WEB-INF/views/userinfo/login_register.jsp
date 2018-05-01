<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Palette - Sign In &amp; Sign Up</title>
        		
        <!-- Javascript -->      		        
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>        
        
		<script src="/h5/resources/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/h5/resources/assets/js/scripts.js"></script>
        
        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="/resources/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/resources/assets/ico/apple-touch-icon-57-precomposed.png">
	
		<script type="text/javascript">
		
			function form_signin() {
				var userId = document.getElementById('userIid');
				var userPw = document.getElementById('userPw');
				
				if (userId.value == '' || userPw.value == '') {
					alert('IDと暗証番号を入力してください。');
					return false;
				}
				return true;
			}
			
		</script>
	
    </head>

    <body>

        <!-- Top content -->
        <div class="top-content" style="background-color:#ffffe6;">
        	
            <div class="inner-bg">
                <div class="container">
                	
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1>Sign-In &amp; Sign-Up</h1>
                            <div class="description">
                            	<p>
	                            	ログインと会員加入
                            	</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
	                        	<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Login to our site</h3>
	                            		<p>IDと暗証番号を入力してください。</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-key"></i>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <form role="form" action="loginForm" method="post" class="login-form" onsubmit="return form_signin();">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-username">Username</label>
				                        	<input type="text" name="userId" placeholder="ID" class="form-username form-control" id="userId">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-password">Password</label>
				                        	<input type="password" name="userPw" placeholder="Password" class="form-password form-control" id="userPw">
				                        </div>
				                        <div class="errorMsg">
											<p style="color: red;">${errorMsg}</p>
										</div>
				                        <button type="submit" class="btn">Sign in!</button>
				                    </form>
			                    </div>
		                    </div>   
                        </div>
                        
                        <div class="col-sm-1 middle-border"></div>
                        <div class="col-sm-1"></div>
                        	
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
                        		<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Sign up now</h3>
	                            		<p>空欄を作成してください。</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-pencil"></i>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    <form role="form" action="joinForm" method="post" class="form-signin" data-toggle="validator">
				                    	<div class="form-group has-feedback">
				                    		<label for="inputId" class="sr-only">ID</label> 
											<input type="text" id="id" name="id" data-remote="checkId"
												class="form-control" placeholder="ID" pattern="^[_A-z0-9]{1,}$"
												required>
												
											<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
											<span class="help-block">IDは数字と英語だけで作成してください。</span>
											<div id="help-block-id" class="help-block with-errors"></div>
				                        </div>
				                        <div class="form-group has-feedback">
				                        	<label for="inputPassword" class="sr-only">PW</label>
											<input type="password" id="password" name="password" pattern="^[_A-z0-9]{1,}$" 
												class="form-control" placeholder="暗証番号" required>
												
											<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
											<span class="help-block">暗証番号は数字と英語だけで作成してください。</span>
											<div class="help-block with-errors"></div>
				                        </div>
				                        <div class="form-group has-feedback">
				                        	<label for="inputPasswordCheck" class="sr-only">暗証番号確認</label>
											<input type="password" id="inputPasswordCheck" class="form-control"
												placeholder="暗証番号確認" data-match="#password" 
												data-match-error="暗証番号が違います。" required>
												
											<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
											<div class="help-block with-errors"></div>
				                        </div>
				                        <div class="form-group has-feedback">
				                        	<label for="inputName" class="sr-only">名前</label> 
											<input type="text" id="name" name="name"
												class="form-control" placeholder="名前" required>
												
											<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
											<div class="help-block with-errors"></div>
				                        </div>
				                        <div class="form-group has-feedback">
											<label for="inputEmail" class="sr-only">メールアドレス</label> 
											<input type="email" id="email" name="email" data-remote="checkEmail" 
												class="form-control" placeholder="メールアドレス" data-error="間違ったメールアドレスです。" 
												required>
												
											<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
											<div class="help-block with-errors"></div>
										</div>
				                        <button type="submit" class="btn">会員加入</button>
				                        <a href="../" class="btn">
											戻る
										</a>
				                    </form>
			                    </div>
                        	</div>                        	
                        </div>
                    </div>                    
                </div>
            </div>            
        </div>

        <!-- Footer -->
        <footer>
        	<div class="container">
        		<div class="row">
        			
        			<div class="col-sm-8 col-sm-offset-2">
        				<div class="footer-border"></div>
        				<p>Made by H5. Having a lot of fun. <i class="fa fa-smile-o"></i></p>
        			</div>
        			
        		</div>
        	</div>
        </footer>

        <!-- Bootstrap Validator -->
		<script type="text/javascript" src="<c:url value='/resources/js/validator.js'/>"></script>				
		        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>