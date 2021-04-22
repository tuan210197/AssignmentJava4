package edu.poly.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDao;
import edu.poly.common.CookieUtils;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SesionUtils;
import edu.poly.domain.LoginForm;
import edu.poly.model.User;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = CookieUtils.get("username", request);
		if (username == null) {
			PageInfo.prepareAndForwardUser(request, response, PageType.USER_LOGIN_PAGE);
			return;
		}
		SesionUtils.add(request, "username", username);
		request.getRequestDispatcher("/HomePage").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			LoginForm form = new LoginForm();

			BeanUtils.populate(form, request.getParameterMap());

			UserDao dao = new UserDao();
			User user = dao.findById(form.getUsername());

			if (user != null && user.getPassword().equals(form.getPassword())) {

				SesionUtils.add(request, "username", user.getUsername());
				System.out.println(user.getUsername());
				if (form.isRemember()) {

					CookieUtils.add("username", response, form.getUsername(), 24);
				} else {
					CookieUtils.add("username", response, form.getUsername(), 0);

				}
				request.setAttribute("isLogin", true);
				request.setAttribute("name", user.getFullname());
				request.getRequestDispatcher("/HomePage").forward(request, response);
		
				return;

			}

			request.setAttribute("error", "invalid username or password");

		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardUser(request, response, PageType.USER_LOGIN_PAGE);
	}

}
