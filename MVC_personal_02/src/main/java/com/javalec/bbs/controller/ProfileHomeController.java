package com.javalec.bbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.command.ProfileCommand;
import com.javalec.bbs.command.ProfileContentViewCommand;
import com.javalec.bbs.command.ProfileDeleteCommand;
import com.javalec.bbs.command.ProfileListCommand;
import com.javalec.bbs.command.ProfileModifyCommand;
import com.javalec.bbs.command.ProfileSearchCommand;
import com.javalec.bbs.command.ProfileWriteCommand;

@WebServlet("*.do")
public class ProfileHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProfileHomeController() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
		
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doPost");
		actionDo(request, response);
		
	}

	public void actionDo (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String viewPage = null;
		
		ProfileCommand command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		switch(com) {
		
		case("/list.do"):
			command = new ProfileListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;
		
		case("/write_view.do"):
			viewPage = "write_view.jsp";
			break;
		case("/write.do"):
			command = new ProfileWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case("/content_view.do"):
			command = new ProfileContentViewCommand();
			command.execute(request, response);
			viewPage = "content_view.jsp";
			break;
		case("/modify.do"):
			command = new ProfileModifyCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case("/delete.do"):
			command = new ProfileDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		case("/search.do"):
			command = new ProfileSearchCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
}
