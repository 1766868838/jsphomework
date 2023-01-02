package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Bean;
import bean.Experiment;
import bean.Process;
import utils.JDBCUtils;

/**
 * Servlet implementation class Import
 */
@WebServlet("/Import")
public class Import extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Import() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Connection con = null;
		// 语句对象类型为PreparedStatement
		Statement  stmt = null;
		con = JDBCUtils.getConnection();
		String username = (String) this.getServletContext().getAttribute("username");
		String sql = "select * from course where username = "+username;
		int course_id = 1;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			ServletContext scx = session.getServletContext(); // 通过session对象获取应用上下文
			ArrayList<Bean> courselist = (ArrayList) scx.getAttribute("courselist");
			ArrayList<Process> processlist = (ArrayList) scx.getAttribute("processlist");
			ArrayList<Experiment> explist = (ArrayList) scx.getAttribute("explist");
			courselist = new ArrayList<Bean>();
			processlist = new ArrayList<Process>();
			explist = new ArrayList<Experiment>();
			while(rs.next()) {	
				Bean bean = new Bean();	
				beanGetInfo(rs,bean);
				
				System.out.println(bean.getOfficeplace());
				if(bean.getCampus()!=null) {
					
					courselist.add(bean);
					scx.setAttribute("courselist", courselist);
					
				}
			}
			rs.close();
			String sql2 = "select * from experiment where course_id = "+course_id;
			ResultSet rs2 = stmt.executeQuery(sql2);
			//rs = stmt.executeQuery(sql2);
			while(rs2.next()) {
				Experiment exp = new Experiment();
				expGetInfo(rs2,exp);
				if(exp.getName()!=null) {
					explist.add(exp);
					scx.setAttribute("explist", explist);
				}
			}
			//rs2.close();
			String sql3 = "select * from process where course_id = "+course_id;
			ResultSet rs3 = stmt.executeQuery(sql3);
			//rs = stmt.executeQuery(sql3);
			while(rs3.next()) {
				Process process = new Process();
				processGetInfo(rs3,process);
				if(process.getUsername()!=null) {
					processlist.add(process);
					scx.setAttribute("processlist", processlist);
				}
			}
			
			rs3.close();
			
			response.sendRedirect("index.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void expGetInfo(ResultSet rs2, Experiment exp) throws SQLException {
		// TODO Auto-generated method stub

		exp.setExp_id(rs2.getInt(1));
		exp.setUsername(rs2.getString("username"));
		exp.setWeek(rs2.getInt("week"));
		exp.setName(rs2.getString("name"));
		exp.setType(rs2.getString("type"));
		exp.setProp(rs2.getString("prop"));
		exp.setAddr(rs2.getString("addr"));
		exp.setCourse_id(rs2.getInt("course_id"));
		exp.setGroupnum(rs2.getInt("groupnum"));
	}

	private void processGetInfo(ResultSet rs3, Process process) throws SQLException {
		// TODO Auto-generated method stub
		process.setPro_id(rs3.getInt(1));
		process.setUsername(rs3.getString("username"));
		process.setWeek(rs3.getInt("week"));
		process.setCnt(rs3.getString("cnt"));
		process.setMethod(rs3.getString("method"));
		process.setTask(rs3.getString("task"));
		process.setCourse_id(rs3.getInt("course_id"));
	}

	private void beanGetInfo(ResultSet rs,Bean bean) throws SQLException {
		// TODO Auto-generated method stub
		bean.setCourse_id(rs.getInt(1));
		bean.setUsername(rs.getInt("username"));
		bean.setCampus(rs.getString("campus"));
		bean.setCourse_teacher(rs.getString("course_teacher"));
		bean.setMark(rs.getFloat("mark"));
		bean.setWeek(rs.getString("week"));
		bean.setTheorylessons(rs.getInt("theorylessons"));
		bean.setLablessons(rs.getInt("lablessons"));
		bean.setOfficeplace(rs.getString("officeplace"));
		bean.setOfficetime(rs.getString("officetime"));
		bean.setClickamounts(rs.getInt("clickamounts"));
		bean.setTerm(rs.getString("term"));
		bean.setCourse_cname(rs.getString("course_cname"));
		bean.setCollege(rs.getString("college"));
		bean.setCourse_introduction(rs.getString("course_introduction"));
		bean.setReference(rs.getString("reference"));
		bean.setCheckmethod(rs.getString("checkmethod"));
		bean.setTeachmethod(rs.getString("teachmethod"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
