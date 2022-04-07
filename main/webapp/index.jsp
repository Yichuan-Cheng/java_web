<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>拾柒，遇到有趣的人</title>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Study Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
<!-- //end-smoth-scrolling -->
<script src="js/menu_jquery.js"></script>

</head>
<body>

<!--header start here-->
<div class="header">
	<div class="container">
		 <div class="header-main">
				<!---->
					<div class="header-logo">
						<div class="logo">
						<a href="index.jsp"><img src="images/logo1.png" alt="" ></a>
						</div>
						<div class="top-nav">
							<span class="icon"><img src="images/menu.png" alt=""> </span>
							<ul>
								 <li ><a href="index.jsp" >主页</a> </li>
						<li><a href="userLogin.jsp">用户登录/注册</a></li>
						<li><a href="adminLogin.jsp">管理员登录</a></li>
							</ul>
							<!--script-->
						<script>
							$("span.icon").click(function(){
								$(".top-nav ul").slideToggle(500, function(){
								});
							});
					</script>				
				</div>
				<div class="clearfix"> </div>
					</div>
			<!---->
			<div class="top-menu">					
					<ul>

					    	<li><a  href="adminLogin.jsp"><button class = "login-button" ><li>管理员登录</li></button></a>
						<li><a href="index.jsp"> <img src="images/logo1.png" alt=""> </a></li>
						<a  href="userLogin.jsp"><button class = "login-button"><li>登录/注册</li>	</button></a>	
						<!--  <li><div class="header-login">
									 <div class="top-nav-right">
										<div id="loginContainer"> <a href="userLogin" id="loginButton"><span>登录</span></a>
											    <div id="loginBox">                
											        <form id="loginForm">
											                <fieldset id="body">
											                	<fieldset>
											                          <label for="id">账号</label>
											                          <input type="text" name="id" id="email">
											                    </fieldset>
											                    <fieldset>
											                            <label for="passwd">密码</label>
											                            <input type="text" name="passwd" id="passwd">
											                     </fieldset>
											                    <input type="submit" id="login" value="登录">
											                	<label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住我</i></label>
											            	</fieldset>
											            <span><a href="forgetPasswd.jsp">忘记密码？</a></span>
												 </form>
									        </div>
									  </div>
								   </div>
		                         </div>	</li>-->
					</ul>
				</div>
					<!--script-->
			<div class="bann-bottom">
				<h1>- 来拾柒 -</h1>
				<br><p>- 遇到有趣的灵魂 -</p>

				<div class="clearfix"> </div>
			</div>
		 </div>
	 </div>
   </div>
</div>

</body>
</html>