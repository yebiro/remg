package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ActiDaoImpl;

/**
 * Servlet implementation class acti_main
 */
@WebServlet("/acti_main")
public class acti_main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public acti_main() {
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
		ActiDaoImpl dao=new ActiDaoImpl();
		//������ת����
	    RequestDispatcher rd = null;
	    try
	    {
	    	request.setAttribute("list", dao.main_activities());
    	    rd=request.getRequestDispatcher("activities_main.jsp");
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
