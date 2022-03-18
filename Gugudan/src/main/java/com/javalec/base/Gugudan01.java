package com.javalec.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class Gugudan01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dan =  Integer.parseInt(request.getParameter("dan"));
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		for (int i=1; i<=9; i++) {
			
			out.print(dan + " x " + i + " = " + dan*i + "<br>");
		}
		
	}


}
