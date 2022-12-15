package com.nonage.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nonage.dao.ProductDAO;
import com.nonage.dto.ProductVO;

public class ProductKindAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="product/productKind.jsp";
		
		String kind = request.getParameter("kind").trim();
		//1. DAO를 이용한 데이터 처리
		ProductDAO productDAO = ProductDAO.getInstance();
		ArrayList<ProductVO> productKindList = productDAO.listKindProduct(kind);
		
		request.setAttribute("productKindList", productKindList);
		
		//2. view 페이지 지정(.jsp) 및 페이지 이동
		
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);		
	
	
	}

	
}
