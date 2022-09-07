<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>校园宽带管理平台</title>
</head>
<style type="text/css">
	.admin{
		
		position:relative;
		text-align: center;
	}
	.admin h1{
		position:relative;
	
		height:50px;
		margin: -10px;
		background-color: #1f87e8;
		color: white;
	}
	.admin p{
		position:relative;
		top:10px;
		
		font-size: 20px;
	}
	.admin p a{
		text-decoration: none;
		position:relative;
		
	}
	.dh{
		
		height:43px;
		position:relative;
		background-color: #f5f5f5;
		
	}
	.dh ul{
		padding:0px;
		margin:0px;
		position:relative;
		
	}
	#nav{
		
		width:750px;
		height:40px;
		margin-left:-375px;
		left:52%;
	}
	.dh li{
		list-style-type:none;
		float:left;
		margin-left: 50px;
		line-height: 40px;
		
	}
	.dh a{
		font-size: 25px;
		color:black;
		text-decoration: none;
	}
	.dh a:HOVER {
		color:red;
	}
	.p2{
		position:fixed;
	    font-size: 20px;
	    color:red;
	    width:150px;
	   	height:30px;
	   	left:45%;
		}
</style>
</head>
<body>
<div class="admin">
<h1 >校园宽带管理平台</h1>
<p>欢迎您：${userName} <a href="logout">切换用户</a>
 </p>
	<div class="dh">
		<ul id="nav">
			<li><a href="userManage">用户管理</a></li>
			<li><a href="customerManage">客户管理</a></li>
			<li><a href="orderManage">订单管理</a></li>
			<li><a href="logout">退出登录</a></li>
		</ul>
	</div>
</div>
<p class="p2">${requestScope.msg2 }</p>
</body>
</html>