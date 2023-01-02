package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Bean;
import utils.JDBCUtils;

/**
 * Servlet implementation class MineSave
 */
@WebServlet("/MineSave")
public class MineSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MineSave() {
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
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String sex1 = request.getParameter("sex");
		
		int sex=0;
		if(sex1.equals("男")) sex = 1;
		String posts = request.getParameter("posts");
		String degree = request.getParameter("degree");
		String laboratory = request.getParameter("laboratory");
		String biography = request.getParameter("biography");
		
		try {
			PreparedStatement ps = con.prepareStatement("UPDATE teacher SET name=?, "
					+ "sex=?, degree=?, posts=?, laboratory=?, biography=? WHERE username=?");
			stmt = con.createStatement();
			Bean bean = new Bean();
			ps.setObject(1, name); // 注意：索引从1开始
		    ps.setObject(2, sex);
		    ps.setObject(3, degree);
		    ps.setObject(4, posts);
		    ps.setObject(5, laboratory);
		    ps.setObject(6, biography);
		    ps.setObject(7, username);
		    int n = ps.executeUpdate(); 
		    
		    
		    
		    response.sendRedirect("/BigHomework/Mine");
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
