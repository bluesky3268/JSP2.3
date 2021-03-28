package simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		// type 파라미터를 가져와서 사용자의 요청 파악
		String type = request.getParameter("type");
		Object resultObject = null;
		
		// 요청한 기능을 수행
		if(type == null || type.equals("greeting")) {
			resultObject = "반갑습니다.";
		}else if(type.equals("date")) {
			resultObject = new java.util.Date();
		}else {
			resultObject = "invalid Type";
		}
		// request(또는 session)에 처리 결과를 저장
		request.setAttribute("result", resultObject);
		
		// RequestDispatcher를 통해 알맞은 뷰로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/simpleView.jsp");
		dispatcher.forward(request, response);
	}
	
	
	
}
