package bank.controller;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank.doa.InsertDataToQury;
import bank.model.dataSetter;

/**
 * Servlet implementation class deleteAccountController
 */
@WebServlet("/deleteAccountController")
public class deleteAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		dataSetter data=new dataSetter( username, password);
		PreparedStatement ps;
		InsertDataToQury in=new InsertDataToQury();
		try {
			ps=in.deleteAccountData(data);
			if(ps.executeUpdate()>0) {
				System.out.println(1);

				 HttpSession session=request.getSession();
				// session.setAttribute("data",data);
				 response.sendRedirect("landingPage.jsp");
			}
			else {
				System.out.println(0);
			}
			ps.close();
		}
		catch (Exception e) {
			// TODO: handle exception
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
