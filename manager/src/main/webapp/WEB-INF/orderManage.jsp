<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.*,pojo.*,java.text.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
</head>
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
		.bill{
		position: relative;
		border: 2px solid #1f87e8;
		height: 200px;
		width: 300px;
		left:30%;
		font-family: "微软雅黑";
		border-radius:25px;
		}
		.span1{
		position: relative;
		left: 35%;
		}
		.line{
		border: 1px solid #1f87e8;
		height: 1px;
		background-color: #1f87e8;
		margin: 0px;
		}
		.bill input {
		position: relative;
		top: 20px;
		left: 5px;
		
		}
		.bill button {
		position: relative;
		top:21px;
		width: 50px;
		left: 5px;
		}
		.span2{
		position: relative;
		top: 20px;
		left: 8px;
		}
		.count{
		position: relative;
		top:35px;
		left: 30px;
		}
</style>
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
						<th>订单号</th>
						<th>开户日期</th>
						<th>到期日期</th>
						<th>总费用</th>
						<th>经办人</th>
						<th>剩余日期</th>
						<th>缴费操作</th>
						<th>修改操作</th>
						<th>删除操作</th>	
					</tr>
					<%
						List<Order> list=(List<Order>)request.getAttribute("list");
						int index=1;
						if(list!=null)
							for(Order o:list){ %>
							<%
							Date expireDate=new Date();
							SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
							SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
							Date beg=sdf.parse(sdf.format(expireDate));
							Date end=sdf2.parse(o.getExpireDate());
							long day=(end.getTime()-beg.getTime())/(24*60*60*1000);
							String day2=Long.toString(day); %>
						<tr>
						<td><%= o.getCustomerId() %></td>
						<td><%= o.getCustomer().getCustomerName() %></td>
						<td><%= o.getCustomer().getPhone() %></td>
						<td><%= o.getCustomer().getDorm() %></td>
						<td><%= o.getCustomer().getType() %></td>
						<td><%= o.getOrderId() %></td>
						<td><%= o.getPaymentDate() %></td>
						<td><%= o.getExpireDate() %></td>
						<td><%= o.getPrice() %></td>
						<td><%= o.getDirector() %></td>
						<td><%= day2 %>天</td>
						<td><button onclick="recharge('<%=o.getOrderId() %>')">续费</button></td>
						<td><button onclick="show('<%=o.getOrderId() %>')">修改信息</button></td>	
						<td><button onclick="delete1('<%=o.getOrderId() %>')">删除订单</button></td>	
					</tr> 
					<%}%>
				
			</table>
			<p class="p-rs">${requestScope.msg }</p>
			<div class="bill">
				<span class="span1">金额统计</span>
				<div class="line"> </div>
				<input type="date" id="date" />
			<span class="span2">~</span>
				<input type="date" id="date2" />
				<button  onclick="count()">查询</button>
				<div class="count">总金额为：${requestScope.count }</div>
			</div>
	</div>
<br/>

		<div class="bottom">
			<a href="main">返回管理主页</a>
			<a href="orderManage">刷新当前页面</a>
			
		</div>
</div>
<div class="login">
<div>
<form action="update3" method="post" onsubmit="return check();">
	<h1>修改订单信息</h1>
		<div class="name">订单号:&nbsp;&nbsp;<input  type="text"  name="orderid" value="${selectorder.orderId }" readonly/></div>
		<br/>
		<div class="name">学 号：&nbsp;&nbsp;<input  type="text" id="id" name="id" value="${selectorder.customer.customerId }" readonly/></div>
		<br/>
		<div class="name">客户名:&nbsp;&nbsp;<input  type="text" id="name" name="customerName" value="${selectorder.customer.customerName }" placeholder="客户名"/></div>
		<br/>
		<div class="phone">电话:<input  type="text" name="phone" id="phone" value="${selectorder.customer.phone }" placeholder="电话"/></div>
		<br/>
		<div class="dorm">宿舍号:<input  type="text" name="dorm" id="dorm" value="${selectorder.customer.dorm }" placeholder="宿舍号"/></div>
	
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
function show(id) {
	window.location.href="selectorder?orderId="+id;
}
function unshow() {
	document.getElementsByClassName("login")[0].style.display="none";
}
function delete1(id) {
	window.location.href="delete3?orderId="+id;
}
function search() {
	var search=document.getElementById("search").value;
	window.location.href="orderManage?search="+search;
}
window.onload=function(){	
	if("${selectorder}"!=""){
		document.getElementsByClassName("login")[0].style.display="inline-block";	
	}
}
function recharge(id) {
	window.location.href="recharge?orderId="+id;
}
function count() {
	var date=document.getElementById("date").value;
	var date2=document.getElementById("date2").value;
	if((date==null||date=="")||(date2==null||date2=="")){
		alert("输入的日期为空")
		return false
	}
	window.location.href="count?date="+date+"&date2="+date2;
}
</script>