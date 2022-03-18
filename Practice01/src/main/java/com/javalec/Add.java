package com.javalec;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Add() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
			out.print("<head>");
			out.print("</head>");	
			out.print("<body>");
	
				for(int i = 2; i <=5; i++) {
					out.print(i + " + " +  1 + " = " + add(i,1) + "<br>");			
				}

			out.print("</body>");		
		out.print("</html>");
		
	}

	public int add(int num1, int num2) {
		return num1 + num2;
	}

}
