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
import bean.User;
import utils.JDBCUtils;

/**
 * Servlet implementation class Mine
 */
@WebServlet("/Mine")
public class Mine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mine() {
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
		
		String sql = "select * from teacher where username = "+username;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			ServletContext scx = session.getServletContext(); // 通过session对象获取应用上下文
			ArrayList<User> userlist = (ArrayList) scx.getAttribute("userlist");

			userlist = new ArrayList<User>();
			while(rs.next()) {	
				User user = new User();
				userGetInfo(rs,user);
				
				//System.out.println(user.getOfficeplace());
				if(user.getName()!=null) {
					
					userlist.add(user);
					scx.setAttribute("userlist", userlist);
					
				}
			}
			rs.close();
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("mine.jsp");
	}

	private void userGetInfo(ResultSet rs, User user) throws SQLException {
		// TODO Auto-generated method stub
		user.setBiography(rs.getString("biography"));
		System.out.println("68"+user.getBiography());
		user.setDegree(rs.getString("degree"));
		user.setLaboratory(rs.getString("laboratory"));
		user.setPosts(rs.getString("posts"));
		user.setSex(rs.getInt("sex"));
		user.setName(rs.getString("name"));
		user.setUsername(rs.getString("username"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
