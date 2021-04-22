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
import edu.poly.model.User;


@WebServlet("/Registration")
public class RegistrationServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PageInfo.prepareAndForwardUser(request, response, PageType.USER_REGISTRATION_PAGE);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		try {
	
			BeanUtils.populate(user, request.getParameterMap());		
			UserDao dao = new UserDao();
			dao.insert(user);
			request.getRequestDispatcher("/Login").forward(request, response);
			
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		request.setAttribute("user", user);
	
		
	}

}
