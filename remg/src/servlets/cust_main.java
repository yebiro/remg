package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustDaoImpl;

/**
 * Servlet implementation class cust_main
 */
@WebServlet("/cust_main")
public class cust_main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cust_main() {
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
	    
		//����DAO���󣬽��µ���DAO�еķ���ʵ�ֶ����ݿ�ķ���
		CustDaoImpl dao=new CustDaoImpl();
		//������ת����
	    RequestDispatcher rd = null;
	    try
	    {
	    	request.setAttribute("list", dao.main_customers());
    	    rd=request.getRequestDispatcher("customers_main.jsp");
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
