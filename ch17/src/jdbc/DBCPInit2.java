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

public class DBCPInit2 extends HttpServlet{

	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}
	// JDBC 드라이버 로딩
	private void loadJDBCDriver() {
		String driverClass = getInitParameter("jdbcDriver");
		try{
			Class.forName(driverClass);
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("fail to load JDBC Driver", e);
		}
	}
	// 커넥션 풀
	private void initConnectionPool() {
		try {
			String jdbcUrl = getInitParameter("jdbcUrl");
			String dbId = getInitParameter("dbId");
			String dbPwd = getInitParameter("dbPwd");
			
			ConnectionFactory connFac = new DriverManagerConnectionFactory(jdbcUrl, dbId, dbPwd);
			PoolableConnectionFactory poolableConnFac = new PoolableConnectionFactory(connFac, null);
			poolableConnFac.setValidationQuery("select 1");
			
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			poolConfig.setMinIdle(4);
			poolConfig.setMaxTotal(50);
			poolConfig.setTestWhileIdle(true);
			
			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFac, poolConfig);
			poolableConnFac.setPool(connectionPool);
			
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			String poolName = getInitParameter("poolName");
			driver.registerPool(poolName, connectionPool);
		}catch(Exception e) {
			throw new RuntimeException(e);
		}
	}
		
}
