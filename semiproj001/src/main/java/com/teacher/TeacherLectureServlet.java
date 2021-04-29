package com.teacher;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.member.Sessioninfo;
//import com.regist_lecture.Regist_LectureDAO;
import com.regist_lecture.Regist_LectureDTO;

@WebServlet("/teacher/*")
public class TeacherLectureServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	//private String pathname;

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
		String uri=req.getRequestURI();
		
		
		HttpSession session = req.getSession();
		Sessioninfo info = (Sessioninfo)session.getAttribute("member");
		
		if(info==null) {
			String cp = req.getContextPath();
			resp.sendRedirect(cp+"/member/login.do");
			return;
		}		
		
		if(uri.indexOf("lecturelist.do")!=-1) {
			article(req, resp);
		}else if(uri.indexOf("created.do")!=-1) {
				registLecture(req, resp);
		} else if(uri.indexOf("created_ok.do")!=-1) {
			registSubmit(req,resp);
		}else if(uri.indexOf("update.do")!=-1) {
			updateLecture(req,resp);
		}else if(uri.indexOf("update_ok.do")!=-1) {
			updateSubmit(req,resp);
		}
		
		
		
	}
	
	protected void registLecture(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//강의 등록 
		req.setAttribute("mode", "created");
		forward(req, resp, "/WEB-INF/views/teacher/created.jsp");
	}
	protected void registSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//강의등록 확인
		LectureDAO dao = new LectureDAO();
		Regist_LectureDTO dto = new Regist_LectureDTO();
		
		
		HttpSession session = req.getSession();
		Sessioninfo info = (Sessioninfo)session.getAttribute("member");
		
		
		
		try {
			dto.setTeacher_id(info.getId());
			dto.setLecture_code(req.getParameter("lecture_code"));
			dto.setLecture_name(req.getParameter("lecture_name"));
			dto.setLecture_subname(req.getParameter("lecture_subname"));
			dto.setLecture_detail(req.getParameter("lecture_detail"));
			
			dto.setOpened_code(req.getParameter("lecture_code")); // 일단 급한대로 opened_code는 lecture_code와 동일하게 설정했습니다.
			dto.setStart_date(req.getParameter("start_date"));
			dto.setEnd_date(req.getParameter("end_date"));
			dto.setStart_time(req.getParameter("start_time"));
			dto.setEnd_time(req.getParameter("end_time"));
			dto.setMaxnum( Integer.parseInt(req.getParameter("maxnum")));

			dao.insertLecture(dto);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String cp = req.getContextPath();
		resp.sendRedirect(cp+"/regist_lecture/regist_teacher_lecturelist.do");
		
		
	}
	
	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//글 보기
		//Regist_LectureDAO dao = new Regist_LectureDAO();
		String cp = req.getContextPath();
		String page = req.getParameter("page");
		String query = "page="+page;
		try {
			forward(req, resp, "/WEB-INF/views/regist_lecture/teacherlist.jsp");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp+"/regist_lecture/list.do?"+query);
		
	}
	
	
	
	
	
	protected void updateLecture(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//강의 수정하기
		LectureDAO dao = new LectureDAO();
		HttpSession session = req.getSession();
		Sessioninfo info = (Sessioninfo)session.getAttribute("member");
		String page = req.getParameter("page");		
		
		try {
			String lecture_code =req.getParameter("lecture_code");
			
			Regist_LectureDTO dto= (Regist_LectureDTO) dao.teacher_lecturelist(lecture_code, lecture_code, page);
			
			if(dto!=null && info.getId().equals(dto.getTeacher_id())) {
				req.setAttribute("dto", dto);
				req.setAttribute("mode", "update");
				
				forward(req, resp, "/WEB-INF/views/teacher/created.jsp");
				return;

			
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String cp= req.getContextPath();
		resp.sendRedirect(cp+"/regist_lecture/teacherlist.do");
	}	
	
	
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//수정확인
		
		LectureDAO dao = new LectureDAO();
		HttpSession session = req.getSession();
		Sessioninfo info = (Sessioninfo)session.getAttribute("member");
		String page = req.getParameter("page");		
		
		try {
			Regist_LectureDTO dto =new Regist_LectureDTO();
			dto.setLecture_code(req.getParameter("lecture_code"));
			dto.setLecture_name(req.getParameter("lecture_name"));
			dto.setLecture_subname(req.getParameter("lecture_subname"));
			dto.setLecture_detail(req.getParameter("lecutre_detail"));
			dto.setTeacher_id(info.getId());
			
			dao.updateLecture(dto, page);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String cp = req.getContextPath();
		resp.sendRedirect(cp+"/teacher/lecturelist?page="+page);
		
		
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
