package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MealDaoImpl;

/**
 * Servlet implementation class meal_search
 */
@WebServlet("/meal_search")
public class meal_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public meal_search() {
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
		String meals_search=request.getParameter("meals_search");
	 
		//System.out.print(meals_search);
		//����DAO���󣬽��µ���DAO�еķ���ʵ�ֶ����ݿ�ķ���
		MealDaoImpl dao=new MealDaoImpl();
		//������ת����
	    RequestDispatcher rd = null;
	    try
	    {
	    	request.setAttribute("list", dao.que_meals(meals_search));
    	    rd=request.getRequestDispatcher("meals_search.jsp");
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
