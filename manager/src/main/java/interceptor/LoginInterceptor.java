package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String islogin=(String) session.getAttribute("islogin");	
		if(islogin!=null && islogin.equals("true")) {
			return true;
		}
		else
		{
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			return false;
		}
	}
}
