package com.lectureList;

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

import com.util.MyUtil;

@WebServlet("/lectureList/*")
public class LectureListServlet extends HttpServlet {

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
		
		
		if(uri.indexOf("lectureList.do")!=-1) {
			list(req, resp);
		} else if (uri.indexOf("lectureDetailed.do")!=-1) {
			lecture_detailed(req, resp);
		}
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LectureListDAO dao = new LectureListDAO();
		MyUtil util = new MyUtil();
		String cp = req.getContextPath();
		
		String page = req.getParameter("page");
		int current_page = 1; 
		
		if(page!=null) {
			current_page= Integer.parseInt(page);
		}
		
		String condition = req.getParameter("condition");
		String keyword = req.getParameter("keyword");
		if(condition==null) {
			condition = "all";
			keyword="";
		}
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword= URLDecoder.decode(keyword, "utf-8");
		}
		
		int dataCount;
		if(keyword.length()==0) {
			dataCount = dao.dataCount();
		} else {
			dataCount = dao.dataCount(condition, keyword);
		}
		
		int rows = 10;
		int total_page = util.pageCount(rows, dataCount);
		
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset = (current_page -1 ) * rows;
		if(offset <0) offset = 0;
		
		List<LectureListDTO> list = null;
		if(keyword.length()==0) {
			list=dao.listLecture(offset, rows);
		}else {
			list=dao.listLecture(offset, rows, condition, keyword);
		}
		
		int curnum, n=0;
		for(LectureListDTO dto: list) {
			curnum = dataCount - (offset+n);
			dto.setCurnum(curnum);
			n++;
		}
		
		String query = "";
		if(keyword.length()!=0) {
			query="condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		String listUrl = cp +"lectureList/lectureList.do";
		String articleUrl = cp+"lectureList/lectureDetailed.do?page="+current_page;
		if(query.length()!=0) {
			listUrl+="?"+query;
			articleUrl+="&"+articleUrl;
		}
		String paging = util.paging(current_page, total_page, listUrl);
		
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
		req.setAttribute("page", current_page);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("total_page", total_page);
		req.setAttribute("articleUrl", articleUrl);
		req.setAttribute("condition", condition);
		req.setAttribute("keyword", keyword);
		
		forward(req, resp, "/WEB-INF/views/lectureList/lectureList.jsp");
		
	}
	
	protected void lecture_detailed(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LectureListDAO dao = new LectureListDAO();
		String cp = req.getContextPath();
		String page= req.getParameter("page");
		String query= "page="+page;
		
		try {
			String code= req.getParameter("opened_code");
			
			String condition = req.getParameter("condition");
			String keyword = req.getParameter("keyword");
			
			if(condition == null) {
				condition = "all";
				keyword = "";
			}
			keyword = URLDecoder.decode(keyword, "utf-8");
			
			if(keyword.length()!=0) {
				query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
			}
			
			LectureListDTO dto = dao.readLecutreList(code);
			if(dto==null) {
				resp.sendRedirect(cp+"/lectureList/lecturelist.do?"+query);
				return;
			}
			dto.setLecture_detail(dto.getLecture_detail().replace("\n", "<br>"));
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("query", query);
			
			forward(req, resp, "/WEB-INF/views/lectureList/lectureDetailed.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}