package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {
	
	@Override
	public void init() throws ServletException{
		loadJDBCDriver();
		initConnectionPool();
	}
	
	private void loadJDBCDriver() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}
	
	private void initConnectionPool() {
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/guestbook?useUnicode=true&characterset=utf8";
			String dbId = "jspexam";
			String dbPwd = "jsppw";
			
			// 커넥션 팩토리(커넥션풀이 새로운 커넥션을 생성할 때 사용) 생성
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl, dbId, dbPwd);
			
			// PoolableConnection(DBCP는 커넥션풀에 커넥션을 보관할 때 PoolableConnection을 사용) 생성하는 팩토리 생성
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			poolableConnFactory.setValidationQuery("select 1");
			
			
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L); // 유휴 커넥션 검사 주기
			poolConfig.setTestWhileIdle(true); // 풀에 보관중인 커넥션이 유효한 지 검사여부
			poolConfig.setMinIdle(4); // 커넥션 최소 개수
			poolConfig.setMaxTotal(50); // 커넥션 최대 개수
			
			// 커넥션 풀 생성
			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);
			
			// JDBC드라이버 등록
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool("guestbook", connectionPool);
		}catch(Exception e) {
			throw new RuntimeException(e);
		}
	}
}
