<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link href="./css/iconfont.css" rel="stylesheet" type="text/css">
<style type="text/css">
div{
	//border:1px solid black;
}
.login{
	width:1280px;
	height:600px;
	margin:50px auto;
}
.title{
	font-size:34px;
}
.content{
	margin-top:40px;
	display:flex;
	background:#F5F5F5;
	border-radius:5px;
}
.content-right{
	margin:50px auto;
	display:flex;
	width:220px;
	align-items:center;
	flex-direction:column;
	height:250px;
	justify-content:space-between;
	font-size:20px;
}
.c-title{
	font-size:25px;
	font-weight:bold;
}

.iconfont {
  font-family: "iconfont" !important;
  font-size: 22px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.input{
	//border:1px solid black;
	width:210px;
	height:40px;
	display:flex;
	justify-content:space-between;
	align-items:center;
}
.c-input{
	height:30px;
	width:170px;
}
.btn{
	background:#337AB7;
	width:150px;
	height:40px;
	border-radius:5px;
	color:#fff;
}

</style>
</head>
<body>
	<div class="login">
		<div class="title">杭州惠民科技大学教务系统</div>
		<div class="content">
			<image src="http://43.143.111.217:8008/hznu.png" width=1000px/>
			<form action="/BigHomework/Login">
			<div class="content-right">
				<div class="c-title">用户登录</div>
				<div class="input">
					<i class="iconfont">&#xe617</i>
					<input class="c-input" name="username" placeholder="用户名"></input>
				</div>
				<div class="input">
					<i class="iconfont">&#xe64c</i>
					<input class="c-input" name="password" placeholder="密码"></input>
				</div>
				<button class="btn">登录1</button>
			</div>
			</form>
		</div>
	</div>
</body>
</html>