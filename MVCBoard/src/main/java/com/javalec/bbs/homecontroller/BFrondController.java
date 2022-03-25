package com.javalec.bbs.homecontroller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.command.BContentCommand;
import com.javalec.bbs.command.BDeleteCommand;
import com.javalec.bbs.command.BListCommand;
import com.javalec.bbs.command.BModifyCommand;
import com.javalec.bbs.command.BWriteCommand;
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
		// 시스템 흐름 파악을 위해 sysout 실행
		System.out.println("actionDo");
		request.setCharacterEncoding("utf-8");
		
		// 페이지 전송해줄 페이지 주소 문자열 선언
		String  viewPage = null;
		// Command 메서드를 실행시켜줄 Bcommand 인터페이스 객체 생성
		Bcommand command = null;
		
		String uri = request.getRequestURI(); // 파일이름까지 경로를 나타냄
		String conPath = request.getContextPath(); // 프로젝트 폴더 까지만 경로를 나타냄
		String com = uri.substring(conPath.length()); // conPath길이 인덱스번지부터 뽑아온다**********
		
//		System.out.println(uri);
//		System.out.println(conPath);
//		System.out.println(serPath);
//		System.out.println(com);
		
		// execute : 실행하다
		switch(com) {
		
		case ("/list.do"): // 전체 내용 보여주기, page가 list.do 일때 
			command = new BListCommand();	// Bcommand 인터페이스 상속의 BListCommand 객체를 생성
			command.execute(request, response);	// dao를 통해 db정보를 담은 arrayList 가 담긴 execute()메서드를 호출
			viewPage = "list.jsp"; 
			break;
		
		// write 만들기
		// 웹에 write_view.do를 입력하면 write_view.jsp 페이지가 나오게 하기...
		// 새로 입력받을 창으로 따로 받아올 값이 존재하지 않음	
		case ("/write_view.do"):
			viewPage = "write_view.jsp";
			break;
			
		case ("/write.do"): // 일종의 hidden페이지
			command = new BWriteCommand();
			command.execute(request, response); 
			viewPage = "list.do"; // case ("/write_view.do")에서 설정한 viewPage로 이동
			break;
			
		case ("/content_view.do"):
			command = new BContentCommand();
			command.execute(request, response);
			viewPage = "content_view.jsp";
			break;
			
			// 수정 후 수정한 값을 포함한 리스트 출력
		case ("/modify.do"): // 수정 기능의 hidden
			command = new BModifyCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
			
		case ("/delete.do"): // 삭제 기능의 hidden
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		}
		
		// RequestDispatcher
		// 클라이언트로부터 최초에 들어온 요청을 JSP/Servlet 내에서 원하는 자원으로 요청을 넘기는
		// 역할을 수행하거나, 특정 자원에 처리를 요청하고 처리 결과를 얻어오는 기능을 수행하는 클래스
																// switch문에 따른 viewPage호출
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
	
	
	
	
	
	
	
	
	
}
