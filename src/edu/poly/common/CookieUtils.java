package edu.poly.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CookieUtils {
	public static String get(String name, HttpServletRequest request) {

		Cookie[] cookies = request.getCookies();
		if (cookies != null) {

			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}

	public static Cookie add(String name, HttpServletResponse reponse, String value, int hour) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(60 * 60 * hour);
		cookie.setPath("/");
		reponse.addCookie(cookie);
		return cookie;
	}
}
