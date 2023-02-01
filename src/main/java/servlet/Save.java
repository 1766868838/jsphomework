package servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Bean;
import utils.JDBCUtils;

/**
 * Servlet implementation class Save
 */
@WebServlet("/Save")
public class Save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Save() {
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
		String courseid = request.getParameter("courseid");
		String theorylessons = request.getParameter("theorylessons");
		String lablessons = request.getParameter("lablessons");
		String course_teacher = request.getParameter("course_teacher");
		String course_teacher2 = request.getParameter("course_teacher2");
		String officetime = request.getParameter("officetime");
		String officeplace = request.getParameter("officeplace");
		String course_introduction=request.getParameter("course_introduction");
		String reference=request.getParameter("reference");
		String checkmethod=request.getParameter("checkmethod");
		String teachmethod=request.getParameter("teachmethod");
		String[] pro_id = request.getParameterValues("pro_id");
		String[] cnt = request.getParameterValues("cnt");
		String[] method = request.getParameterValues("method");
		String[] task = request.getParameterValues("task");
		try {
			PreparedStatement ps = con.prepareStatement("UPDATE course SET theorylessons=?, "
					+ "lablessons=?, course_teacher=?, course_teacher2=?, officetime=?,"
					+ "officeplace=?, course_introduction=?, reference=?, checkmethod=?, teachmethod=? WHERE course_id=?");
			stmt = con.createStatement();
			Bean bean = new Bean();
			ps.setObject(1, theorylessons); // 注意：索引从1开始
		    ps.setObject(2, lablessons);
		    ps.setObject(3, course_teacher);
		    ps.setObject(4, course_teacher2);
		    ps.setObject(5, officetime);
		    ps.setObject(6, officeplace);
		    ps.setObject(7, course_introduction);
		    ps.setObject(8, reference);
		    ps.setObject(9, checkmethod);
		    ps.setObject(10, teachmethod);
		    ps.setObject(11, courseid);
		    int n = ps.executeUpdate(); 
		    System.out.println(5+n);
		    int i =0;
		    for(;i<pro_id.length-1;i++) {
		    	PreparedStatement ps2 = con.prepareStatement("UPDATE process SET cnt=?, method=?, task=? WHERE pro_id=?");
				stmt = con.createStatement();
				 // 注意：索引从1开始
				ps2.setObject(1, cnt[i]);
				ps2.setObject(2, method[i]);
				ps2.setObject(3, task[i]);
				ps2.setObject(4, pro_id[i]);
				int n2 = ps2.executeUpdate(); 
		    }
		    
		    
		    if(!method[i].equals("")) {
		    	System.out.println(i + "     "+method[i]);
				String sql = "insert into process(pro_id,username,week,cnt,method,task,course_id) values(?,?,?,?,?,?,?)";
			    PreparedStatement ps3 = con.prepareStatement(sql);
				stmt = con.createStatement();
					 // 注意：索引从1开始
				ps3.setObject(1, pro_id[i]);
				ps3.setObject(2, 20021234);
				ps3.setObject(3, 3);
				ps3.setObject(4, cnt[i]);
				ps3.setObject(5, method[i]);
				ps3.setObject(6, task[i]);
				ps3.setObject(7, 1);
				
				int n3 = ps3.executeUpdate(); 
			    
		    }
		    
		    response.sendRedirect("/BigHomework/Import");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
