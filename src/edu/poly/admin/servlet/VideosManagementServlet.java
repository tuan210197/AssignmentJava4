package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.VideoDao;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.UploadUtils;
import edu.poly.model.Video;

@WebServlet({ "/VideosManagement", "/create", "/update", "/delete", "/reset", "/edit", })

@MultipartConfig
public class VideosManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("vao doGet");
		String url = request.getRequestURL().toString();
		if (url.contains("edit")) {

			edit(request, response);
			System.out.println("vao edit");
			return;
		}
		if (url.contains("delete")) {

			delete(request, response);
			return;
		}
		if (url.contains("reset")) {

			reset(request, response);
			return;
		}

		Video video = new Video();
		video.setPoster("images/laptop.jpg");

		findAll(request, response);
		request.setAttribute("video", video);

		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("create")) {
			create(request, response);
			System.out.println("createed");
			return;
		}
		if (url.contains("delete")) {
			delete(request, response);
			return;
		}
		if (url.contains("update")) {
			update(request, response);
			return;
		}
		if (url.contains("reset")) {
			reset(request, response);
			return;
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Video video = new Video();

		try {
			BeanUtils.populate(video, request.getParameterMap());

			VideoDao dao = new VideoDao();
			Video oldVideo = dao.findById(video.getVideoId());

			if (request.getPart("cover").getSize() == 0) {
				video.setPoster(oldVideo.getPoster());
			} else {
				video.setPoster(
						"uploads/" + UploadUtils.processUploadFile("cover", request, "/uploads", video.getVideoId()));
			}
			dao.update(video);

			request.setAttribute("video", video);
			request.setAttribute("message", "video is updated!");
			findAll(request, response);

		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("videoId");
		if (id == null) {
			request.setAttribute("error", "Video id is required!");
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}
		try {

			VideoDao dao = new VideoDao();
			Video video = dao.findById(id);
			System.out.println("findId");
			request.setAttribute("video", video);
			System.out.println("setAtt");
			findAll(request, response);
			System.out.println("findAll");
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);

		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();

		try {
			BeanUtils.populate(video, request.getParameterMap());

			video.setPoster(
					"upload/" + UploadUtils.processUploadFile("cover", request, "/uploads", video.getVideoId()));

			VideoDao dao = new VideoDao();
			dao.insert(video);

			request.setAttribute("video", video);
			request.setAttribute("message", "video is inserted!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("videoId");
		if (id == null) {
			request.setAttribute("error", "Video id is required!");
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}
		try {

			VideoDao dao = new VideoDao();
			Video video = dao.findById(id);
			if (video == null) {
				request.setAttribute("error", "Video not found!");
				PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
				return;

			}

			dao.delete(id);
			request.setAttribute("message", "video is deleted!");
			request.setAttribute("video", new Video());

			findAll(request, response);

		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}

		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Video video = new Video();
		video.setPoster("images/laptop.jpg");
		
		
		request.setAttribute("video", video);
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);

	}

	private void findAll(HttpServletRequest request, HttpServletResponse response) {
		try {

			VideoDao dao = new VideoDao();
			List<Video> list = dao.findAll();

			request.setAttribute("videos", list);

		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}
