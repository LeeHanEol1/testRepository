package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class PhotoDetailController
 */
@WebServlet("/detail.ph")
public class PhotoDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhotoDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		int result = new BoardService().increaseCount(pno);
		
		if(result>0) { //조회수 증가 성공시 조회해오기
			//게시글정보, 첨부파일 정보 상세조회 - 기존에 있었던 게시글 조회 쿼리문을 left조인을 사용하여 조회해오기			
			Board b = new BoardService().selectBoard(pno);		
			ArrayList<Attachment> list = new BoardService().selectPhotoDetail(pno);
		
			request.setAttribute("b", b);
			request.setAttribute("list", list);

			request.getRequestDispatcher("views/board/photoDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "사진게시글 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
