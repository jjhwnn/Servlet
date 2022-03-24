package com.javalec.bbs.homecontroller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.command.BListCommand;
import com.javalec.bbs.command.Bcommand;


@WebServlet("*.do") // .do방식으로 처리하기
public class BFrondController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BFrondController() {
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

	// actionDo 메서드 생성
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 시스템 흐름 파악을 위해 syso 실행
		System.out.println("actionDo");
		request.setCharacterEncoding("utf-8");
		
		String  viewPage = null;
		Bcommand command = null;
		
		String uri = request.getRequestURI(); // 파일이름까지 경로를 나타냄
		String conPath = request.getContextPath(); // 프로젝트 폴더 까지만 경로를 나타냄
		String com = uri.substring(conPath.length()); // conPath길이 인덱스번지부터 뽑아온다**********
		
//		System.out.println(uri);
//		System.out.println(conPath);
//		System.out.println(serPath);
//		System.out.println(com);
		
		switch(com) {
		case ("/list.do"): // 전체 내용 보여주기
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
	
	
	
	
	
	
	
	
	
}
