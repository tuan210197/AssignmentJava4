package edu.poly.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

public class PageInfo {
	public static Map<PageType, PageInfo> pageRoute = new HashedMap();

	static {
		pageRoute.put(PageType.USER_MANAGEMRNT_PAGE,
				new PageInfo("User Management", "/views/admin/user/users.jsp", null));
		pageRoute.put(PageType.REPORT_MANAGEMENT_PAGE,
				new PageInfo("Reports", "/views/admin/report/reports.jsp", null));
		pageRoute.put(PageType.VIDEO_MANAGEMENT_PAGE,
				new PageInfo("Videos Management", "/views/admin/video/videos.jsp", null));

		pageRoute.put(PageType.USER_HOME_PAGE,
				new PageInfo("Home", "/views/user/home/home.jsp", null));


		pageRoute.put(PageType.USER_LOGIN_PAGE,
				new PageInfo("Login", "/views/user/users/login.jsp", null));

		pageRoute.put(PageType.USER_REGISTRATION_PAGE,
				new PageInfo("Registration", "/views/user/users/registration.jsp", null));
		pageRoute.put(PageType.USER_CHANGE_PW,
				new PageInfo("Change Password", "/views/user/users/change.jsp", null));

		pageRoute.put(PageType.USER_EDIT_PROFILE,
				new PageInfo("Edit Profile", "/views/user/users/editProfile.jsp", null));

		pageRoute.put(PageType.USER_FORGOT_PASSWORD,
				new PageInfo("Forgot Password", "/views/user/users/forgotPw.jsp", null));

		pageRoute.put(PageType.USER_FAVORITE_PAGE,
				new PageInfo("Favorite", "/views/user/videos/favorite.jsp", null));

		pageRoute.put(PageType.USER_VIDEO_DETAIL,
				new PageInfo("Video Detail", "/views/user/videos/detail.jsp", null));

		pageRoute.put(PageType.USER_SHARE_PAGE,
				new PageInfo("Share Friend", "/views/user/videos/share.jsp", null));

	}

	public static void prepareAndForward(HttpServletRequest request, HttpServletResponse response, PageType pagaType)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pagaType);
		request.setAttribute("page", page);

		request.getRequestDispatcher("views/admin/layout.jsp").forward(request, response);
	}

	public static void prepareAndForwardUser(HttpServletRequest request, HttpServletResponse response, PageType pagaType)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pagaType);
		request.setAttribute("page", page);

		request.getRequestDispatcher("views/user/layout.jsp").forward(request, response);
	}
	
	
	private String title;
	private String contentUrl;
	private String scriptUrl;

	public PageInfo(String title, String contentUrl, String scriptUrl) {
		super();
		this.title = title;
		this.contentUrl = contentUrl;
		this.scriptUrl = scriptUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}

	public String getScriptUrl() {
		return scriptUrl;
	}

	public void setScriptUrl(String scriptUrl) {
		this.scriptUrl = scriptUrl;
	}
}
