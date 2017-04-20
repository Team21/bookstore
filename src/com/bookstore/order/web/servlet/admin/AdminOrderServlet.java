package com.bookstore.order.web.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.order.service.OrderService;

import cn.itcast.servlet.BaseServlet;

public class AdminOrderServlet extends BaseServlet {
	private OrderService orderService = new OrderService();
	
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("orderList", orderService.findAll());
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	public String find1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("orderList", orderService.find1());
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	public String find2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("orderList", orderService.find2());
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	public String find3(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("orderList", orderService.find3());
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	public String find4(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("orderList", orderService.find4());
		return "f:/adminjsps/admin/order/list.jsp";
	}
}
