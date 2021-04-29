package com.plan;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/plan/*")
public class PlanServlet extends HttpServlet{
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
		
		if(uri.indexOf("plan.do")!=-1) {
			planForm(req, resp);
		}
	}

	private void planForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;

		String sy = req.getParameter("year");
		String sm = req.getParameter("month");
		
		if(sy!=null) {
			year = Integer.parseInt(sy);
		}
		if(sm!=null) {
			month = Integer.parseInt(sm);
		}
		
		cal.set(year, month-1, 1);
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH)+1;
		
		int lastDate=cal.getActualMaximum(Calendar.DATE);
		int week=cal.get(Calendar.DAY_OF_WEEK);
		
		Calendar preCal = (Calendar)cal.clone();
		preCal.add(Calendar.DATE, -(week-1));
		
		int preDate = preCal.get(Calendar.DATE);
		
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("lastDate", lastDate);
		req.setAttribute("preDate", preDate);
		req.setAttribute("week", week);
		
		forward(req, resp, "/WEB-INF/views/plan/plan.jsp");
		
	}

}
