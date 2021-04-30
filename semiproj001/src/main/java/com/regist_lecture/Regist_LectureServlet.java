package com.regist_lecture;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.Sessioninfo;
import com.util.MyUtil;

@WebServlet("/regist_lecture/*")
public class Regist_LectureServlet extends HttpServlet{


	private static final long serialVersionUID = 1L;

	String pathname;
	
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
		
		HttpSession session = req.getSession();
		Sessioninfo info = (Sessioninfo)session.getAttribute("member"); 
		if(info==null) {
			String cp = req.getContextPath();
			resp.sendRedirect(cp+"/member/login.do");
			return;
		}
		
		if(uri.indexOf("regist_lecturelist.do")!=-1) {
			lecturelist(req, resp);
		}else if(uri.indexOf("regist_teacher_lecturelist.do")!=-1) {
			teacher_lecturelist(req,resp);
			
		} else if(uri.indexOf("regist_admin_lecturelist.do")!=-1) {
			admin_lecturelist(req,resp);
		} 
	}	
		
	//학생 강의 리스트
	protected void lecturelist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp= req.getContextPath();
		
		Regist_LectureDAO dao = new Regist_LectureDAO();
		MyUtil util = new MyUtil();

		//파라미터로 넘어온 페이지 
		//번호 페이지가 없을 수도, 페이지만 넘어올 수도, 조건이랑 키워드까지 넘어올수도..		
		String page = req.getParameter("page");
		int current_page = 1;
		if(page !=null) {
			current_page = Integer.parseInt(req.getParameter(page));
		}		

		HttpSession session = req.getSession();
		Sessioninfo info = (Sessioninfo)session.getAttribute("member"); 
		String member_id = info.getId();
		
		//전체 데이터 개수
		int dataCount =dao.dataCount();

		//전체 페이지 수
		int rows=6;
		int total_page=util.pageCount(rows, dataCount);
		if(current_page >total_page) {
			current_page=total_page;
		}
		
		int offset = (current_page -1) *rows;
		if(offset <0) offset =0; //ex ) 건너뛰기 10개씩
		
		
		
		List<Regist_LectureDTO> list =dao.lecture_list(offset, rows, member_id);
		
		//페이징처리
		String listUrl=cp+"/regist_lecture/list.do";
		//String articleUrl = cp+"/regist_lecture/list.do?page="+current_page;
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		//list.jsp에 넘겨줄 데이터
		req.setAttribute("list", list);
		
		req.setAttribute("paging", paging);
		req.setAttribute("page", current_page);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("total_page", total_page);
		//req.setAttribute("articleUrl", articleUrl);
		//req.setAttribute("condition", condition);
		//req.setAttribute("keyword", keyword);		
		
		forward(req, resp, "/WEB-INF/views/regist_lecture/list.jsp");
		
		
	}		
	
	//선생강의리스트
	protected void teacher_lecturelist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		String cp= req.getContextPath();
		
		Regist_LectureDAO dao = new Regist_LectureDAO();
		MyUtil util = new MyUtil();
		
		HttpSession session = req.getSession();
		Sessioninfo info = (Sessioninfo)session.getAttribute("member"); 
		String name = info.getMember_name();
		
		String page = req.getParameter("page");
		int current_page = 1;
		if(page !=null) {
			current_page = Integer.parseInt(req.getParameter(page));
		}		

		//전체 데이터 개수
		int dataCount =dao.dataCount();
		//전체 페이지 수
		int rows=6;
		int total_page=util.pageCount(rows, dataCount);
		if(current_page >total_page) {
			current_page=total_page;
		}
		
		int offset = (current_page -1) *rows;
		if(offset <0) offset =0; //ex ) 건너뛰기 10개씩
		
		List<Regist_LectureDTO> list =dao.teacher_lecturelist(offset, rows, name);
		
		String listUrl=cp+"/regist_lecture/teacherlist.do";
		
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		//list.jsp에 넘겨줄 데이터
		req.setAttribute("list", list);
		
		req.setAttribute("paging", paging);
		req.setAttribute("page", current_page);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("total_page", total_page);		
		
		forward(req, resp, "/WEB-INF/views/regist_lecture/teacherlist.jsp");
	}
	
	//관리자 강의리스트
	protected void admin_lecturelist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		String cp= req.getContextPath();
		
		Regist_LectureDAO dao = new Regist_LectureDAO();
		MyUtil util = new MyUtil();
		
		String page = req.getParameter("page");
		int current_page = 1;
		if(page !=null) {
			current_page = Integer.parseInt(req.getParameter(page));
		}		

		//전체 데이터 개수
		int dataCount =dao.dataCount();
		//전체 페이지 수
		int rows=6;
		int total_page=util.pageCount(rows, dataCount);
		if(current_page >total_page) {
			current_page=total_page;
		}
		
		int offset = (current_page -1) *rows;
		if(offset <0) offset =0; //ex ) 건너뛰기 10개씩
		List<Regist_LectureDTO> list =dao.adminLecturelist(offset, rows);
		String listUrl=cp+"/regist_lecture/admin_lecturelist.do";
		
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		//list.jsp에 넘겨줄 데이터
		req.setAttribute("list", list);
		
		req.setAttribute("paging", paging);
		req.setAttribute("page", current_page);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("total_page", total_page);		
		
		forward(req, resp, "/WEB-INF/views/regist_lecture/admin_lecturelist.jsp");
	}	
		
}
