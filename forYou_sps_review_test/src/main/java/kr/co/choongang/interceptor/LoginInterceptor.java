package kr.co.choongang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object memberVO = modelMap.get("memberVO");

		if (memberVO != null) {
			LOGGER.info("new login success");
			session.setAttribute("memberVO", memberVO);
			response.sendRedirect("/main/mainPage");
		}

	}

	// @Override
	// public boolean preHandle(HttpServletRequest request, HttpServletResponse
	// response, Object handler)
	// throws Exception {
	//
	// HttpSession session = request.getSession();
	//
	// if (session.getAttribute("memberVO") != null) {
	// LOGGER.info("clear login data before");
	// session.removeAttribute("login");
	// }
	// return true;
	//
	// }
}
