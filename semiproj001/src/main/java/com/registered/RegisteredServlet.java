package com.registered;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet	("/registered")
public class RegisteredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		registeredMember(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		registeredMember(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	protected void registeredMember(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String opened_code = req.getParameter("opened_code");
		
		RegisteredDAO dao = new RegisteredDAO();
		List<RegisteredDTO> list = dao.readRegistered(opened_code);
		String lecture = dao.readLecture(opened_code);
		
		int dataCount = dao.dataCount(list);
		int totalCount = dao.totalCount(opened_code);
		
		int listNum=1, n=0;
		for(RegisteredDTO dto:list) {
			dto.setListNum(listNum+n);
			n++;
		}
		
		req.setAttribute("list", list);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("lecture", lecture);
		req.setAttribute("opened_code", opened_code);
		
		forward(req, resp, "/WEB-INF/views/layout/registeredList.jsp");
	}


	
	

}
