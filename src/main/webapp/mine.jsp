<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心页面</title>
 <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<link href="./css/iconfont.css" rel="stylesheet" type="text/css">
<style type="text/css">
div{
	//border:1px solid black;
}
.mine{
	border-radius:5px;
	width:1280px;
	height:600px;
	margin:0 auto;
	margin-top:120px;
	display:flex;
	justify-content:space-around;
	background:#F5F5F5;
}
/*头像*/
.head{
padding-top:20px;
	display:flex;
	flex-direction:column;
	align-items:center;
	font-size:28px;
}
.content{
	width:900px;
	font-size:22px;
	display:flex;
	flex-direction:column;
}
.content-item{
	margin-top:35px;
	display:flex;
	height:38px;
}

.content-item1{
	margin-top:35px;
	display:flex;
	height:120px;
}
.itemDiv{
	height:38px;
	width:110px;
}
.itemInput{

	width:250px;
}
.saveBtn{
	margin-top:20px;
	width:200px;
	height:45px;
	background:#337AB7;
	color:#fff;
	margin-left:120px;
	border-radius:5px;
}
.saveBtn:hover{
	cursor: pointer;
	
}

.img{
width:140px;
height:140px;
	margin-top:25px;
	border:1px solid grey;
	border-radius:100%;
	background:#DDDDDD;
}

.imginput{
	width:220px;
	border:1px solid grey;
	margin-top:20px;
	display:none;
}

</style>
</head>
<body>
<form action="/BigHomework/MineSave">
	<div class="mine">
			<div class="head">
				<lable class="label">头像</lable>
				<img src="./css/default.png" class="img" width=140px id="avatar" onclick="$(this).next().click();"
				onerror="this.src='./css/default.png'">
				<input type="file" class="imginput" id="btn-file" onchange="inputFile(this)" accept="image/*">
			</div>
		<div class="content">

			<div class="content-item">
				<div class="itemDiv">姓名:</div>
				<%
				ArrayList userlist = (ArrayList) application.getAttribute("userlist");
					User user = (User) userlist.get(0);
					System.out.println(user.getUsername()+"222");
					String sex;
					if(user.getSex()==0){
						sex = "女";
					}
					else{
						sex = "男";
					}
				%>
				<input name="name" class="itemInput" value=<%=user.getName() %>></input>
				<input name="username" style="display:none" value=<%=user.getUsername() %>>
			</div>
			<div class="content-item">
				<div class="itemDiv">性别:</div>
				<input name="sex" class="itemInput" value=<%=sex %>></input>
			</div>
			<div class="content-item">
				<div class="itemDiv">学历:</div>
				<input name="degree" class="itemInput" value=<%=user.getDegree() %>></input>
			</div>
			<div class="content-item">
				<div class="itemDiv">职位：</div>
				<input name="posts" class="itemInput" value=<%=user.getPosts() %>></input>
			</div>
			<div class="content-item">
				<div class="itemDiv">实验室:</div>
				<input name="laboratory" class="itemInput"  value=<%=user.getLaboratory() %>></input>
			</div>
			<div class="content-item1">
				<div class="itemDiv">个人简介:</div>
				<textarea name="biography" rows="3" cols="100" ><%=user.getBiography() %></textarea>
			</div>
			<input type="submit" value="保存" class="saveBtn">
		</div>
	</div>
</form>
</body>
<script>
//选择文件完毕的回调
function inputFile(obj) {

     const file = obj.files[0];
     var reader = new FileReader();
     reader.readAsDataURL(file);
     reader.onload = function () {
         $("#avatar").attr("src", this.result);
     }
 }
 
 //提交表单数据
 function saveInfo(){
         //jquery对象转js对象
         const avatarFile = $('btn-file')[0].files[0];

         var form = new FormData();
         form.append('name', $('#name').val());
         form.append('avatar', avatarFile);
         form.append('mobile', $('#mobile').val());
         form.append('unit', $('#unit').val());
 
         form.append('email', $('#email').val());

         postRequest("UpdateUserInfo", form, (result)=>{
                location.reload(true)
         })
 }
</script>
</html>