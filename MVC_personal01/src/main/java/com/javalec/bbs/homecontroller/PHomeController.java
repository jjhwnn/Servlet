package com.javalec.bbs.homecontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.command.PCommand;
import com.javalec.bbs.command.PDeleteCommand;
import com.javalec.bbs.command.PListCommand;
import com.javalec.bbs.command.PWriteCommand;

@WebServlet("*.do")
public class PHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PHomeController() {
        super();

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
		
		PCommand command = null;
		
		String uri = request.getRequestURI(); 
		String conPath = request.getContextPath(); 
		String com = uri.substring(conPath.length()); 

		// execute : 실행하다
		switch(com) {
		
		case ("/list.do"): // 전체 내용 보여주기, page가 list.do 일때 
			command = new PListCommand();	// Bcommand 인터페이스 상속의 BListCommand 객체를 생성
			command.execute(request, response);	// dao를 통해 db정보를 담은 arrayList 가 담긴 execute()메서드를 호출
			viewPage = "list.jsp"; 
			break;
			
		case ("/write_view.do"):
			viewPage = "write_view.jsp";
			break;
			
		case ("/write.do"):
			command = new PWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
			
		case ("/delete.do"):
			command = new PDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;	
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}