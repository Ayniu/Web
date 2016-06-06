package Bean;

import java.sql.*;


public class MysqlConnect {

	private String DbName = "root";//数据库用户名
	private String password = "kun161";//数据库密码
	private String DatabaseDriver="com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/ayniutest";//测试数据库url
	private Connection con = null;
	private Statement stmt = null;
    public ResultSet rs;
	
	public MysqlConnect()
	{
		 try {
				Class.forName(DatabaseDriver);
				//连接数据库
				con = DriverManager.getConnection(url,DbName,password);
				stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
						ResultSet.CONCUR_UPDATABLE);
				System.out.println("连接成功");
			} catch (Exception e) {
				System.out.println("连接失败");
				
			}
	}
	
	
	public void newUser(String name,String mail,String passwork,String realname) {
		
		try {
			stmt.executeUpdate("insert into users (name,mail,passwork,realname) " +
					"value ("+name+","+mail+","+passwork+","+realname+")");
		} catch (Exception e) {
		}
	}
	
	//查询表格
	public ResultSet queryUser(String name) {
		try {
			rs = stmt.executeQuery("SELECT * FROM users WHERE name='"+name+"'");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return rs;
	}


	public void close() {
		try {
			con.close();
			stmt.close();
		} catch (SQLException e) {
		}
	}

}
