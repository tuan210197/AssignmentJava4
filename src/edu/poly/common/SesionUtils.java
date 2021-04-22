package edu.poly.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SesionUtils {
	public static void add(HttpServletRequest request, String name, Object value) {
		
		HttpSession ses = request.getSession();
		ses.setAttribute(name, value);
	}
public static  Object get(HttpServletRequest request, String name) {
		
		HttpSession ses = request.getSession();
		return ses.getAttribute(name);
	}
public static void Invalidate(HttpServletRequest request) {
	
		HttpSession ses = request.getSession();
		ses.removeAttribute("username");
		ses.invalidate();
}
public static boolean isLogin(HttpServletRequest request) {
	return get(request, "username") != null;
}
public static String getLoginedUsername(HttpServletRequest request) {
	
	Object username = get(request,"username");
	return username == null? null: username.toString();
}
}
