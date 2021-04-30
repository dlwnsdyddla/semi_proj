package com.qna;

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

@WebServlet("/qna/*")
public class QnaServlet extends HttpServlet{
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
		
		
		if(uri.indexOf("list.do")!=-1) {
			list(req, resp);
		} else if (uri.indexOf("article.do")!=-1) {
			article(req, resp);
		} else if (uri.indexOf("qna_ok.do")!=-1) {
			insertAnswer(req, resp);
		} else if (uri.indexOf("created.do")!=-1) {
			insertQuestionForm(req, resp);
		} else if (uri.indexOf("created_ok.do")!=-1) {
			questionSubmit(req, resp);
		}
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QnaDAO dao = new QnaDAO();
		List<QnaDTO> list = dao.qnaList();
		String cp = req.getContextPath();
		String articleUrl = cp+"/qna/article.do?page=1";
		
		req.setAttribute("list", list);
		req.setAttribute("articleUrl", articleUrl);
		
		forward(req, resp, "/WEB-INF/views/qna/list.jsp");
	}
	
	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QnaDAO dao = new QnaDAO();
		String cp = req.getContextPath();
		String qna_code = req.getParameter("qna_code");
		
		QnaDTO dto = dao.qnaContent(qna_code);
		if(dto==null) {
			resp.sendRedirect(cp+"/qna/list.do");
			return;
		}
		req.setAttribute("dto", dto);
		
		HttpSession session = req.getSession();
		Sessioninfo info = (Sessioninfo) session.getAttribute("member");
		String teacher_id = null;
		try {
			teacher_id = info.getId();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(dto.getAnswer_content() == null && teacher_id != null) {
			if(dao.teacherAnswer(qna_code, teacher_id))
				req.setAttribute("answernull", "yes");
		}
			
		forward(req, resp, "/WEB-INF/views/qna/article.jsp");
	}
	
	protected void insertAnswer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QnaDAO dao = new QnaDAO();
		String cp = req.getContextPath();
		String qna_code = req.getParameter("qna_code");
		
		QnaDTO dto = new QnaDTO();
			dto.setAnswer_id(req.getParameter("answer_id"));
			dto.setAnswer_title(req.getParameter("title"));
			dto.setAnswer_content(req.getParameter("content"));
			
		if(dao.insertAnswer(qna_code, dto) == 0) {
			req.setAttribute("error", "답변 중 에러 발생");
			resp.sendRedirect(cp+"/qna/list.do");
		}
		
		article(req, resp);
		
	}
	
	protected void insertQuestionForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", "created");
		forward(req, resp, "/WEB-INF/views/qna/created.jsp");
		
	}
	
	protected void questionSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		
		HttpSession session = req.getSession();
		Sessioninfo info= (Sessioninfo) session.getAttribute("member");
		QnaDAO dao = new QnaDAO();
		
		
		try {
			QnaDTO dto = new QnaDTO();
			
			dto.setQuestion_id(info.getId());
			
			dto.setQna_code(req.getParameter("qna_code"));
			dto.setQuestion_id(req.getParameter("question_id"));
			dto.setQuestion_name(req.getParameter("question_name"));
			dto.setQuestion_title(req.getParameter("question_title"));
			dto.setQuestion_content(req.getParameter("question_content"));
			
			dao.insertQuestion(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		resp.sendRedirect(cp+"/qna/list.do");
		
	}
}
