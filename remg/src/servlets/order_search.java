package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDaoImpl;

/**
 * Servlet implementation class order_search
 */
@WebServlet("/order_search")
public class order_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public order_search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html,charset=utf-8");
		String orders_search=request.getParameter("orders_search");
	 
		System.out.print(orders_search);
		//����DAO���󣬽��µ���DAO�еķ���ʵ�ֶ����ݿ�ķ���
		OrderDaoImpl dao=new OrderDaoImpl();
		//������ת����
	    RequestDispatcher rd = null;
	    try
	    {
	    	request.setAttribute("list", dao.que_orders(orders_search));
    	    rd=request.getRequestDispatcher("orders_search.jsp");
    	    rd.forward(request, response);
	    }
	    catch(Exception localExcption){}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
