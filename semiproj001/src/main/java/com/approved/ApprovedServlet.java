package com.approved;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lectureList.LectureListDAO;
import com.lectureList.LectureListDTO;
import com.member.Sessioninfo;
import com.util.MyUtil;

@WebServlet("/approved/*")
public class ApprovedServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		
		try {
			HttpSession session = req.getSession();
			Sessioninfo info = (Sessioninfo) session.getAttribute("member");
			String type = info.getType();
			if(!type.equals("a")) {
				System.out.println("관리자 이외에 접근할 수 없습니다.");
				req.setAttribute("error", "관리자 이외에 접근할 수 없습니다.");
				return;
			}
			String admin_id = info.getId();
					
			if(uri.indexOf("list.do")!=-1)
				list(req, resp);
			if(uri.indexOf("lectureDetailed.do")!=-1)
				lecture_detailed(req, resp);
			if(uri.indexOf("submit.do")!=-1)
				submit(req, resp, admin_id);
			if(uri.indexOf("deny.do")!=-1)
				deny(req, resp);
		} catch (Exception e) {
			throw e;
		}
		
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ApprovedDAO dao = new ApprovedDAO();
		String cp = req.getContextPath();
		
		List<LectureListDTO> list = dao.listLecture();
		
		String articleUrl = cp+"/approved/lectureDetailed.do?";
		req.setAttribute("list", list);
		req.setAttribute("articleUrl", articleUrl);
		req.setAttribute("mode", "approve");
		
		forward(req, resp, "/WEB-INF/views/lectureList/lectureList.jsp");
		
	}
	
	protected void lecture_detailed(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LectureListDAO dao = new LectureListDAO();
		String cp = req.getContextPath();
		
		try {
			String opened_code= req.getParameter("opened_code");
			
			LectureListDTO dto = dao.readLecutreList(opened_code);
			if(dto==null) {
				resp.sendRedirect(cp+"/approved/list.do");
				return;
			}
			dto.setLecture_detail(dto.getLecture_detail().replace("\n", "<br>"));
			
			req.setAttribute("dto", dto);
			req.setAttribute("mode", "approve");
			
			forward(req, resp, "/WEB-INF/views/lectureList/lectureDetailed.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	protected void submit(HttpServletRequest req, HttpServletResponse resp, String admin_id) throws ServletException, IOException {
		String opened_code = req.getParameter("opened_code");
		if(req.getMethod().equalsIgnoreCase("GET"))
			opened_code = URLDecoder.decode(opened_code, "utf-8");
		
		ApprovedDAO dao = new ApprovedDAO();
		int result = dao.submitLecture(opened_code, admin_id);
		if(result==1) {
			req.setAttribute("ok", "ok");
			String cp = req.getContextPath();
			resp.sendRedirect(cp+"/approved/list.do");
			return;
		}
		
	}
	
	protected void deny(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String opened_code = req.getParameter("opened_code");
		System.out.println(opened_code);
		if(req.getMethod().equalsIgnoreCase("GET"))
			opened_code = URLDecoder.decode(opened_code, "utf-8");
		
		ApprovedDAO dao = new ApprovedDAO();
		int result = dao.denyLecture(opened_code);
		if(result==1) {
			req.setAttribute("ok", "ok");
			String cp = req.getContextPath();
			resp.sendRedirect(cp+"/approved/list.do");
			return;
		}
	}
	
	
	
	
}
