<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.*,pojo.*"%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理</title>
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
	   	width:70px;
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
			width: 100px;
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
		.phone{
			position:relative;
			left:15%;
			font-size: 20px;
		}
		.phone input{
			position:relative;
			width:200px;
			height:20px;
			left:30px;
			font-size: 20px;
		}
		.dorm{
			position:relative;
			left:15%;
			font-size: 20px;
		}
		.dorm input{
			position:relative;
			width:200px;
			height:20px;
			left:10px;
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
		.st-2{
		position:relative;
		left:20%;
	   	width:70px;
	   	 height:35px;
	   	 cursor: pointer;
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
			<input class="input-1" type="text" id="search" " placeholder="请输入客户名"/>
			<button onclick="search()" class="bt-1">查询</button>
		</div>
		<br>
	</div>
	
	<div class="manage-main">
		
			<table border="1">
					<tr>
						<th>学号</th>
						<th>客户名</th>
						<th>电话</th>
						<th>宿舍号</th>
						<th>业务类型</th>
						<th>修改操作</th>
						<th>删除操作</th>	
					</tr>
					<%
						List<Customer> list=(List<Customer>)request.getAttribute("list");
						int index=1;
						if(list!=null)
							for(Customer c:list){ %>
							<tr>
						<td><%= c.getCustomerId() %></td>
						<td><%= c.getCustomerName() %></td>
						<td><%= c.getPhone() %></td>
						<td><%= c.getDorm() %></td>
						<td><%= c.getType() %></td>
						<td><button onclick="show('<%=c.getCustomerId() %>')">修改信息</button></td>	
						<td><button onclick="delete1('<%=c.getCustomerId() %>')">删除用户</button></td>	
					</tr> 
					<%}%>
				
			</table>
	
			<p class="p-rs">${requestScope.msg }</p>
	</div>
<br/>
	<div class="main-change">
			<form action="add2"  method="post" onsubmit="return check();">
			<table border="1">
			<tr>
				<th>学号</th>
				<th>客户名</th>
				<th>电话</th>
				<th>宿舍号</th>
				<th>业务类型</th>
				<th>办理业务</th>
				</tr>
				<tr>
					<td><input type="text" id="id" name="customerId" /></td>
					<td><input type="text" id="name" name="customerName" /></td>
					<td><input type="text" id="phone" name="phone" /></td>
					<td><input type="text" id="dorm" name="dorm" /></td>
					<td>
					<select class="st-1" name="type">
						<option value="包年" selected="selected">包年</option>
						<option value="包月">包月</option>
					</select>
					</td>
					<td><button name="bt" >办理业务</button></td>
				</tr>
			</table>
			</form>
	</div>
		<div class="bottom">
			<a href="main">返回管理主页</a>
			<a href="customerManage">刷新当前页面</a>
			
		</div>
</div>
<div class="login">
<div>
<form action="update2" method="post" onsubmit="return check2();">
	<h1>修改客户信息</h1>
		<div class="name">学 号：&nbsp;&nbsp;<input  type="text" id="id2" name="id" value="${selectcustomer.customerId }" /></div>
		<br/>
		<div class="name">客户名:&nbsp;&nbsp;<input  type="text" id="name2" name="customerName" value="${selectcustomer.customerName }" placeholder="客户名"/></div>
		<br/>
		<div class="phone">电话:<input  type="text" id="phone2" name="phone" value="${selectcustomer.phone }" placeholder="电话"/></div>
		<br/>
		<div class="dorm">宿舍号:<input  type="text" id="dorm2" name="dorm" value="${selectcustomer.dorm }" placeholder="宿舍号"/></div>
		<br/>
		<div class="type">
		<select class="st-2" name="type">
			<option value="${selectcustomer.type }" selected="selected">${selectcustomer.type}</option>
			<option value="包年" >包年</option>
			<option value="包月">包月</option>
		</select>
		</div>
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
	var id=document.getElementById("id").value;
	var name=document.getElementById("name").value;
	var phone=document.getElementById("phone").value;
	var dorm=document.getElementById("dorm").value;
	if(id==null||id==""){
		alert("学号不能为空");
		return false;
	}
	if(name==null||name==""){
		alert("客户名不能为空");
		return false;
	}
	if(phone==null||phone==""){
		alert("电话不能为空");
		return false;
	}
	if(dorm==null||dorm==""){
		alert("宿舍号不能为空");
		return false;
	}
	return true;
}
function check2() {
	var id=document.getElementById("id2").value;
	var name=document.getElementById("name2").value;
	var phone=document.getElementById("phone2").value;
	var dorm=document.getElementById("dorm2").value;
	if(id==null||id==""){
		alert("学号不能为空");
		return false;
	}
	if(name==null||name==""){
		alert("客户名不能为空");
		return false;
	}
	if(phone==null||phone==""){
		alert("电话不能为空");
		return false;
	}
	if(dorm==null||dorm==""){
		alert("宿舍号不能为空");
		return false;
	}
	return true;
}
function show(id) {
	window.location.href="selectcustomer?customerId="+id;
}
function unshow() {
	document.getElementsByClassName("login")[0].style.display="none";
}
function delete1(id) {
	window.location.href="delete2?customerId="+id;
}
function search() {
	var search=document.getElementById("search").value;
	window.location.href="customerManage?search="+search;
}
window.onload=function(){	
	if("${selectcustomer}"!=""){
		document.getElementsByClassName("login")[0].style.display="inline-block";	
	}
}
</script>