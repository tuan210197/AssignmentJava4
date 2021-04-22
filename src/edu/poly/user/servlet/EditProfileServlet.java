package edu.poly.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDao;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SesionUtils;
import edu.poly.model.User;

@WebServlet("/EditProfile")
public class EditProfileServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = SesionUtils.getLoginedUsername(request);

		if (username == null) {

			request.getRequestDispatcher("/Login").forward(request, response);
			return;
		}
		try {
			UserDao dao = new UserDao();
			User user = dao.findById(username);

			request.setAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardUser(request, response, PageType.USER_EDIT_PROFILE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			
			String username = SesionUtils.getLoginedUsername(request);

			UserDao dao = new UserDao();
			User oldUser = dao.findById(username);

			user.setAdmin(oldUser.getAdmin());
			dao.update(user);
			request.setAttribute("message", "user profile updated!");
			request.setAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardUser(request, response, PageType.USER_EDIT_PROFILE);
	}

}
