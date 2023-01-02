<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.ArrayList"%>
   <%@ page import="bean.Bean"%>
   <%@ page import="bean.Experiment"%>
   <%@ page import="bean.Process"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/index.css"/>
<script src="css/jquery-3.3.1.min.js"></script>
<script type="text/javascript" ></script>
<script>
	$(document).ready(function(){
		var flag = true;
		$("#lan").click(function(){
			if(flag == true){
				$("#lan").text("Chinese");
				$("#title").text("Academic Affairs System of Hangzhou Huiming University")
				$("#t1").text("personal information");
				$("#t2").text("Log out");
				$("#date").text("2022-2023-1 school year");
				$("#h1").text("essential");
				$("#h2").text("Teaching");
				$("#h3").text("Experiment");
				$("#h4").text("essential");
				$("#h5").text("Teaching");
				$("#h6").text("Experiment");
				$("#ta1").text("Campus");
				$("#ta2").text("college");
				$("#ta3").text("credit");
				$("#ta4").text("cycle");
				$("#ta5").text("Theory");
				$("#ta6").text("Experi");
				$("#ta7").text("Weekly");
				$("#ta8").text("hours");
				$("#ta9").text("Lecturer");
				$("#ta10").text("Tutor");
				$("#ta11").text("Office");
				$("#ta12").text("Place");
				$("#bd1").text("Relationship between course description and other courses");
				$("#bd2").text("Use of textbooks and reference books");
				$("#bd3").text("Course assessment");
				$("#bd4").text("Teaching methods, means and relevant requirements");
				$("#s1").text("Main teaching contents");
				$("#s2").text("Teaching form and content materials");
				$("#s3").text("Assignment and coaching arrangement");
				$("#e1").text("Name of experiment project");
				$("#e2").text("Experimental nature");
				$("#e3").text("requirements");
				$("#e4").text("laboratory");
				$("#e5").text("Number of people");
				$("#date2").text("2022-2023-1 Course");
				$("#bt1").text("Import Data");
				$("#bt2").val("Save Data");
				
			}else{
				$("#lan").text("English");
				$("#title").text("杭州惠明科技大学教务系统")
				$("#t1").text("个人信息");
				$("#t2").text("退出登录");
				$("#date").text("2022-2023-1 学年");
				$("#h1").text("基本信息");
				$("#h2").text("教学进度");
				$("#h3").text("实验进度");
				$("#h4").text("基本信息");
				$("#h5").text("教学进度");
				$("#h6").text("实验进度");
				$("#h6").text("实验进度");
				$("#ta1").text("授课校区");
				$("#ta2").text("开课学院");
				$("#ta3").text("课程学分");
				$("#ta4").text("教学周期");
				$("#ta5").text("理论课时");
				$("#ta6").text("实验课时");
				$("#ta7").text("周学时数");
				$("#ta8").text("总课时数");
				$("#ta9").text("主讲老师");
				$("#ta10").text("辅导教师");
				$("#ta11").text("答疑时间");
				$("#ta12").text("答疑地点");
				$("#bd1").text("课程描述与其他课程关系");
				$("#bd2").text("使用教材与参考书目");
				$("#bd3").text("课程考核");
				$("#bd4").text("教学方法与手段及相关要求");
				$("#s1").text("主要教学内容");
				$("#s2").text("教学形式与内容资料");
				$("#s3").text("作业与辅导安排");
				$("#e1").text("实验项目名称");
				$("#e2").text("实验性质");
				$("#e3").text("实验要求");
				$("#e4").text("实验教室");
				$("#e5").text("每组人数");
				$("#date2").text("2022-2023-1 课程");
				$("#bt1").text("导入信息");
				$("#bt2").val("保存数据");
			}
			flag = !flag;
		})
		
	})
</script>
</head>
<body>


	<div class="g-index">
		<div class="g-nav">
			<div class="m-nav">
				<a class="navbar-brand" href="index.jsp">
					<img src="	https://mqcai.top/static/media/logo.621524bf.svg">
				</a>
				<label id="title">杭州惠明科技大学教务系统</label>
			</div>
			<div class="m-menu-wrap">
				<div class="m-item sel">
					<a id="lan">English</a>
				</div>

				<form name="MineForm" action="/BigHomework/Mine">
				<%ArrayList courseList2 = (ArrayList) application.getAttribute("courselist");
					Bean bean2 = (Bean) courseList2.get(0);
				%>
				<div class="m-item">
					<a name="username" value=<%=bean2.getUsername() %> href="javascript:document.MineForm.submit();" id="t1">个人信息</a>
				</div>
				</form>
				<div class="m-item">
					<a href="" id="t2">退出登录</a>
				</div>
			</div>
		</div>
		<form action="/BigHomework/Save">
		<div class="g-main">
			<div class="m-inner">
				<%ArrayList courseList = (ArrayList) application.getAttribute("courselist");
					Bean bean = (Bean) courseList.get(0);
				%>
			
				<div class="m-form">
					<div class="m-hd">
						<div class="m-term">

						<%=bean.getTerm() %>
						</div>
						<div class="m-title">
							<span><%=bean.getCourse_cname() %></span>
						</div>
						<div class="m-menu">
							<div class="u-item">
								<a href="#a" id="h1">基本信息</a>
							</div>
							<div class="u-item">
								<a href="#b" id="h2">教学进度</a>
							</div>
							<div class="u-item">
								<a href="#c" id="h3">实验进度</a>
							</div>
						</div>
					</div>
					<div class="s-main">
					
						<div class="main-left">
						<div class="m-main" id="a">
						<div class="m-tl" id="h4">基本信息</div>
						<div class="m-sect">
							<div class="ms-item">
								<label  id="ta1">授课校区</label>
								<span><%=bean.getCampus() %></span>
							</div>
							<div class="ms-item">
								<label  id="ta2">开课学院</label>
								<span><%=bean.getCollege() %></span>
							</div>
							<div class="ms-item">
								<label id="ta3">课程学分</label>
								<span><%=bean.getMark() %></span>
							</div>
							<div class="ms-item">
								<label id="ta4">教学周期</label>
								<span><%=bean.getWeek() %></span>
							</div>
						</div>
						<div class="m-sect">
							<div class="ms-item">
								<label id="ta5">理论课时</label>
								<input type="text" name="theorylessons" value = "<%=bean.getTheorylessons()%>"></input>
							</div>
							<div class="ms-item">
								<label id="ta6">实验课时</label>
								<input type="text" name="lablessons" value = "<%=bean.getLablessons()%>"></input>
							</div>
							<div class="ms-item">
								<label id="ta7">周学时数</label>
								<span><%=bean.getTheorylessons()+bean.getLablessons() %></span>
							</div>
							<div class="ms-item">
								<label id="ta8">总课时数</label>
								<span><%=(bean.getTheorylessons()+bean.getLablessons())*16 %></span>
							</div>
						</div>
						<div class="m-sect">
							<div class="ms-item">
								<label id="ta9">主讲老师</label>
								<input type="text" name="courseid" style="display:none" value = "<%=bean.getCourse_id() %>">
								<input type="text" name="course_teacher" value = "<%=bean.getCourse_teacher() %>">
							</div>
							<div class="ms-item">
								<label id="ta10">辅导教师</label>
								<input type="text" name="course_teacher2" value = "<%=bean.getCourse_teacher() %>"></input>
							</div>
							<div class="ms-item">
								<label id="ta11">答疑时间</label>
								<input type="text" name="officetime" value = "<%=bean.getOfficetime() %>"></input>
							</div>
							<div class="ms-item">
								<label id="ta12">答疑地点</label>
								<input type="text" name="officeplace" value = "<%=bean.getOfficeplace() %>"></input>
							</div>
						</div>
					</div>
						<div class="m-main">
							<div class="m-tab">
								<div class="t-item">
									<label  id="bd1">
										"课程描述与其他课程关系"
										<em class="alert">(不超过200字)</em>
									</label>
									<textarea name="course_introduction"><%=bean.getCourse_introduction() %></textarea>
								</div>
								<div class="t-item">
									<label id="bd2"> 
										"使用教材与参考书目"
										<em  class="alert">(不超过200字)</em>
									</label>
									<textarea name="reference"><%=bean.getReference() %></textarea>
								</div>
								<div class="t-item">
									<label  id="bd3">
										"课程考核"
										<em  class="alert">(不超过200字)</em>
									</label>
									<textarea name="checkmethod"><%=bean.getCheckmethod() %></textarea>
								</div>
								<div class="t-item">
									<label  id="bd4">
										"教学方法与手段及相关要求"
										<em  class="alert">(不超过200字)</em>
									</label>
									<textarea name="teachmethod"><%=bean.getTeachmethod() %></textarea>
								</div>
							</div>
						</div>
							<div class="m-main  m-hei" style="margin:45px 0px 0px;" id="b">
							<div class="m-tl"  id="h5">教学进度</div>
							<div class="m-tech">
								<div class="m-row-t">
									<span id="s1">主要教学内容</span>
									<span id="s2">教学形式与内容资料</span>
									<span id="s3">作业与辅导安排</span>
								</div>
								<!--动态添加每行数据  -->
								<%ArrayList processlist = (ArrayList) application.getAttribute("processlist");
									
									for(int i =0;i<processlist.size();i++){
										Process process = (Process) processlist.get(i);
										System.out.println(process.getPro_id());
								%>
								<div class="m-row-t">
									<input name="pro_id" style="display:none" value=<%=process.getPro_id() %>>
									<input type="text" name="cnt" class="at-input" value=<%=process.getCnt() %>>
									<input type="text" name="method" class="at-input" value=<%=process.getMethod() %>>
									<input type="text" name="task" class="at-input" value=<%=process.getTask() %>>
								</div>
								<%} %>
							</div>
						</div>
						<div class="m-main m-hei" style="margin:45px 0px 0px" id="c">
							<div class="m-tl" id="h6">实验进度</div>
							<!--标题  -->
							<div class="m-tech">
								<div class="m-row-e">
									<span  id="e1">实验项目名称</span>
									<span id="e2">实验性质</span>
									<span id="e3">实验要求</span>
									<span id="e4">实验教室</span>
									<span id="e5">每组人数</span>
								</div>
								<!--动态添加数据  -->
								<%ArrayList explist = (ArrayList) application.getAttribute("explist");
									
									for(int i =0;i<explist.size();i++){
										Experiment exp = (Experiment) explist.get(i);
										System.out.println(exp.getExp_id());
								%>
								<div class="m-row-e">
									<div class="e-item">
										<input type="text" class="at-input" value=<%=exp.getName() %>>
									</div>
									<div class="e-item">
									<select  name = "experimental">
										<option value="验证">验证</option>
										<option value="设计">设计</option>
										<option value="研究">研究</option>
										<option value="综合">综合</option>
										<option value="演示">演示</option>
										<option value="专业" selected="selected">专业</option>
									</select>
									</div>
									<div class="e-item">
									<select  name = "Requirements">
										<option value="选做">选做</option>
										<option value="必做" selected="selected">必做</option>
									</select>
									</div>
									<div class="e-item">
									<input type="text" class="at-input" value=<%=exp.getAddr() %>>
									</div>
									<div class="e-item">
									<input type="text" class="at-input" value=<%=exp.getGroupnum() %>>
									</div>
								</div>
								<%} %>
							</div>
						</div>
						<div class="m-footer">
							<p>
								<small>
								"© 杭州惠明科技大学信息科学与技术学院 All Rights Reserved. "	
								<a class="u-footer" href="https://icp.chinaz.com/info?q=hznu.edu.cn">浙ICP备2022006063号-1</a>
								</small>
							</p>
						</div>
						</div>
					
						<div class="m-right">
							<div class="m-fun">
								<div class="r-tl">
									2022-2023-1
									课程
								</div>
								<!--动态添加课程  -->
								<%
								for(int i =0;i<courseList.size();i++){
									Bean bean1 =(Bean) courseList.get(i);
								
								%>
								
								<input type="button" class="m-cls" value=<%=bean1.getCourse_cname() %>>
								
								<%} %>
								<!-- <input type="button" value="JSP/Servlet程序设计"> -->
							</div>
							<div class="m-fun">
							<div class="f-item" id="bt1" style="background:rgb(33,165,87);color:rgb(255,255,255); ">
								导入信息
							</div> 
							<input type="submit" class="f-item" id="bt2" value="保存数据" style="background:rgb(33,165,87);color:rgb(255,255,255); ">
								
							</div>
						</div>
					
					</div>
				</div>
			</div>
		</div>
		</form>	
	</div>

</body>
</html>