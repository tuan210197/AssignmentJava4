package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoriteDao;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.domain.FavoriteReport;

@WebServlet("/ReportsManagement")
public class ReportsManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reportFavoriteByVideos(request, response);
		PageInfo.prepareAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void reportFavoriteByVideos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			FavoriteDao dao = new FavoriteDao();
			List<FavoriteReport> list = dao.reportFavoriteByVideos();
			request.setAttribute("favList", list);
		} catch (Exception e) {
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}
}
