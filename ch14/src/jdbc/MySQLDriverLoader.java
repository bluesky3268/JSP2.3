package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class MySQLDriverLoader extends HttpServlet{
	public void init(ServletConfig config) throws ServletException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception ex) {
			throw new ServletException(ex);
		}
	}
}
// web.xml에 servlet 태그를 추가하게 되면 웹 어플리케이션을 구동할 때 가종으로 init()메서드가 실행된다. 
// 그래서 insertItem 작성할 때 JDBC드라이버를 로드하는 코드는 작성하지 않음
