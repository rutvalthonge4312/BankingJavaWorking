package bank.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank.doa.InsertDataToQury;
import bank.model.dataSetter;

/**
 * Servlet implementation class LogInController
 */
@WebServlet("/LogInController")
public class LogInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		dataSetter data=new dataSetter( username, password);
		
		PreparedStatement ps;
		InsertDataToQury in=new InsertDataToQury();
		
		ps=in.authenticateData(data);
		try {
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				System.out.println("Hi");
				//String name, String username, String password, int amount,int accountNumber 
				dataSetter data1=new dataSetter(rs.getString("name"), username, password,rs.getInt("amount"),rs.getInt("ACCOUNT_NUMBER"));
				 HttpSession session=request.getSession();
				 session.setAttribute("data",data1);
				 response.sendRedirect("UserDashBoard.jsp");
			}
			else {
				System.out.println("No Data Found");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
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
