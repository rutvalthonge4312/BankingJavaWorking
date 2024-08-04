package bank.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank.doa.InsertDataToQury;
import bank.model.dataSetter;

/**
 * Servlet implementation class creaditAmountController
 */
@WebServlet("/creaditAmountController")
public class creaditAmountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public creaditAmountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int amount=Integer.parseInt(request.getParameter("amount"));
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		PrintWriter pw=response.getWriter();
		dataSetter data1=new dataSetter( username, password);
		
		PreparedStatement ps;
		InsertDataToQury in=new InsertDataToQury();
			
		int currentAmount;
		try {
			ps=in.getRecordData(data1);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				currentAmount=rs.getInt("AMOUNT");
				try {
					dataSetter data=new dataSetter((amount+currentAmount), username, password);
					//String name, String username, String password, int amount,int accountNumber
					dataSetter data2=new dataSetter(rs.getString("name"),username,password,(amount+currentAmount),rs.getInt("ACCOUNT_NUMBER") );
					ps=in.updateAmountData(data);
					if(ps.executeUpdate()>0) {
						System.out.println(1);
						 HttpSession session=request.getSession();
						 session.setAttribute("data",data2);
						 response.sendRedirect("UserDashBoard.jsp");
						ps.close();
					}
					else {
						System.out.println(0);
						
						pw.print("Authentication Fail!");
						ps.close();
					}
				}
				catch (Exception e) {
					// TODO: handle exception
					System.out.println(e);
				}
			}
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
