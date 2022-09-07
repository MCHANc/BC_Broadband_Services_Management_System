<%@page import="java.util.*,pojo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<style type="text/css">
.main-userM{
		
		position:absolute;
		width:1000px;
	 	height:1000px;
	  	margin-left:-500px;
	   	left:50%;
	}
.search-main{
	   	
	   background-color:#f5f5f5;
	   	position:relative;
	   	top:10px;
	   	height:50px;
	   }
.search{
	   
	   	position:relative;
	  	width:600px;
	  	height:36px;
	   	left:300px;
	   	top:5px;
	   }
	   .input-1{
	   	 width:300px;
	   	 height:30px;
	   	 font-size: 18px;
	   	
	   }
	   .bt-1{
	   	cursor: pointer;
	   	 width:86px;
	   	 height:35px;
	   
	   }
	   .st-1{
	   	width:86px;
	   	 height:35px;
	   	 cursor: pointer;
	   }
	   .manage-main{
	   	position:relative;
	   	top:20px;
	   	min-height: 300px;
	   	height: auto;
	   	overflow: auto;
	   }
	   .manage-main table{
			position:relative;
			width:1000px;
			text-align: center;
		}
		.manage-main input{
			position:relative;
			text-align: center;
			border: none;
			
		}
		.manage-main button{
			position:relative;
			width: 70px;
			cursor: pointer;
		}
		.main-change{
			position:relative;
		   
		   	top:20px;
		}
		.main-change table{
			position:relative;
			width:1000px;
			text-align: center;
		}
		.main-change input{
			position:relative;
			text-align: center;
			margin: 0px;
			border: none;
		}
		.main-change button{
			position:relative;
			cursor: pointer;
			width: 100px;
		}
		.bottom{
			position:relative;
		   	
		   	top:80px;
		}
		.bottom a{
			position:relative;
		   	text-decoration: none;
		   	color: black;
		   	font-size: 20px;
		   	left:330px;
		   	margin-left: 18px;
		}
		.bottom a:HOVER {
		 	color:red;
		}
		.p-rs{
			position:relative;
		    font-size: 20px;
		    color:red;
		    width:150px;
		   	height:30px;
		   	left:400px;
		}
 .login{
			border:1px solid black;
			position:fixed;
			width:500px;
	 		height:500px;
	  		margin-left:-250px;
	   		left:48%;
	   		top:10%;
	   		padding:80px 40px;
	   		background: white;
	   		border-radius: 10px; 		
	   		opacity: 0.9;
	   		display: none;
	   		
		}
		.login h1{
			position:relative;
			display: black;
			font-size: 2em;
			text-align: center;
		    font-weight: bold;
		}
		.name{
			position:relative;
			
			left:15%;
			font-size: 20px;
		}
		.name input{
			position:relative;
			width:200px;
			height:20px;
			font-size: 20px;
		}
		.pwd{
			position:relative;
			left:15%;
			font-size: 20px;
		}
		.pwd input{
			position:relative;
			width:200px;
			height:20px;
			left:30px;
			font-size: 20px;
		}
		
		.bt-login{
			position:relative;
			left:40%;
			font-size: 18px;
			width: 100px;
			height: 40px;
		}
		.bt-close{
			position:relative;
			top:20px;
			left:40%;
			font-size: 18px;
			width: 100px;
			height: 40px;
		}
		.p1{
		position:relative;
	    font-size: 20px;
	    top:30px;
	    color:red;
	    width:150px;
	   	height:30px;
	   	left:180px;
		}
</style>
</head>
<body>
<div class="main-userM">
<jsp:include page="main.jsp"/>

	<div class="search-main">
		
		<div class="search">
			<input class="input-1" type="text" id="search" " placeholder="请输入用户名"/>
			<button onclick="search()" class="bt-1">查询</button>
		</div>
		<br>
	</div>
	
	<div class="manage-main">
		
			<table border="1">
					<tr>
						<th>用户ID</th>
						<th>用户名</th>
						<th>密码</th>
						<th>权限</th>
						<th>权限设置</th>
						<th>修改操作</th>
						<th>删除操作</th>	
					</tr>
					<%
						List<User> list=(List<User>)request.getAttribute("list");
						int index=1;
						if(list!=null)
							for(User u:list){ %>
							<tr>
						<td><%=u.getUserId() %></td>
						<td><%= u.getUserName() %></td>
						<td><%= u.getUserPwd() %></td>
						<td><%= u.getBan() %></td>
						<%if(u.getBan().equals("开启")) {%>	
								<td><button  onclick="close1('<%=u.getUserId() %>')" >禁止访问</button></td>
								<% }%>
							<%if(u.getBan().equals("禁用")){ %>	
								<td><button onclick="open1('<%=u.getUserId() %>')">开启权限</button></td>
							<%} %>
						<td><button onclick="show1('<%=u.getUserId() %>')">修改信息</button></td>	
						<td><button onclick="delete1('<%=u.getUserId() %>')">删除用户</button></td>	
					</tr> 
					<%}%>
				
			</table>
	
			<p class="p-rs">${requestScope.msg }</p>
	</div>
<br/>
	<div class="main-change">
			<form action="add"  method="post" onsubmit="return check();">
			<table border="1">
			<tr>
				
				<th>用户名</th>
				<th>密码</th>
				<th>权限</th>
				<th>添加用户</th>
				</tr>
				<tr>
					<td><input type="text" id="name" name="userName" /></td>
					<td><input type="text" id="pwd" name="password" /></td>
					<td><input type="text" name="ban" value="开启" readonly/></td>
					<td><button name="bt" value="5">添加用户</button></td>
				</tr>
			</table>
			</form>
	</div>
		<div class="bottom">
			<a href="main">返回管理主页</a>
			<a href="userManage">刷新当前页面</a>
			
		</div>
</div>
<div class="login">
<div>
<form action="update" method="post" onsubmit="return check2();">
	<h1>修改用户信息</h1>
		<div class="name">用户ID:&nbsp;&nbsp;<input  type="text"  name="id" value="${selectuser.userId }" readonly/></div>
		<br/>
		<div class="name">用户名:&nbsp;&nbsp;<input  type="text" id="userName2" name="userName" value="${selectuser.userName }" placeholder="用户名"/></div>
		<br/>
		<div class="pwd">密码:<input  type="text" id="userPwd2" name="password" value="${selectuser.userPwd }" placeholder="密码"/></div>
		<br/>
		<button  class="bt-login">修改</button>
</form>
<button onclick="unshow()" class="bt-close">关闭</button>	
	<p class="p1">${requestScope.msg }</p>
</div>
</div>
</body>
</html>
<script type="text/javascript" >

function check() {
	
	var name=document.getElementById("userName").value;
	var pwd=document.getElementById("userPwd").value;
	
	if(name==null||name==""){
		alert("用户名不能为空");
		return false;
	}
	if(pwd==null||pwd==""){
		alert("密码不能为空");
		return false;
	}
	return true;
}
function check2() {
	
	var name=document.getElementById("userName2").value;
	var pwd=document.getElementById("userPwd2").value;
	
	if(name==null||name==""){
		alert("用户名不能为空");
		return false;
	}
	if(pwd==null||pwd==""){
		alert("密码不能为空");
		return false;
	}
	return true;
}
function close1(id) {
	window.location.href="close?userId="+id;
}
function open1(id) {
	window.location.href="open?userId="+id;
}
function show1(id) {
	window.location.href="selectuser?userId="+id;
	
}
function unshow() {
	document.getElementsByClassName("login")[0].style.display="none";
}

function delete1(id) {
	window.location.href="delete?userId="+id;
}
function search() {
	var search=document.getElementById("search").value;
	window.location.href="userManage?search="+search;
}
window.onload=function(){	
	if("${selectuser}"!=""){
		document.getElementsByClassName("login")[0].style.display="inline-block";	
	}
}
</script>