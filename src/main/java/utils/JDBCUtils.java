package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/** JDBC宸ュ叿绫� */
public class JDBCUtils {
	/** 瀹氫箟鏁版嵁搴撻┍鍔ㄧ▼搴�(MySQL) */
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	/** 瀹氫箟鏁版嵁搴撹繛鎺ュ湴鍧� */
	private static final String URL = "jdbc:mysql://localhost:3306/bighomework?serverTimezone=UTC&characterEncoding=utf-8";
	/** 瀹氫箟鏁版嵁搴撴湇鍔″櫒鐧诲綍鐢ㄦ埛鍚� */
	private static final String USERNAME = "root";
	/** 瀹氫箟鏁版嵁搴撶櫥褰曞瘑鐮� */
	private static final String PASSWORD = "";

	/**
	 * 鍒╃敤闈欐�佸垵濮嬪寲鍧楀姞杞芥暟鎹簱椹卞姩绋嬪簭 闈欐�佸垵濮嬪寲鍧楀湪绫诲姞杞芥椂灏辫皟鐢�,涓斿彧璋冪敤涓�娆�
	 */
	static {
		try {
			// 鍔犺浇鏁版嵁搴撻┍鍔ㄧ▼搴�
			Class.forName(DRIVER);
			System.out.println("成功");
		} catch (Exception e) {
			System.out.println("失败：" + e.getMessage());
		}
	}

	/** 鑾峰彇Connection瀵硅薄鐨勬柟娉� */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// 杩炴帴鏁版嵁搴擄紝鑾峰彇Connection瀵硅薄
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("连接成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("失败" + e.getMessage());
		}
		return conn;
	}

	/** 鍏抽棴杩炴帴銆佸伐浣滅┖闂村強缁撴灉闆� */
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}