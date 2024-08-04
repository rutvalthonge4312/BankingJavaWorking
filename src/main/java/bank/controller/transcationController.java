package bank.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bank.doa.InsertDataToQury;
import bank.model.dataSetter;
import bank.model.dataTransaction;

/**
 * Servlet implementation class transcationController
 */
@WebServlet("/transcationController")
public class transcationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public transcationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        System.out.println(request.getParameter("usernameInModal"));
        int amount = Integer.parseInt(request.getParameter("amountInModal"));
        String username = request.getParameter("usernameInModal");
        String password = request.getParameter("passwordInModal");
        long mobileNumber = Long.parseLong(request.getParameter("mobileNumberInModal"));
        PreparedStatement ps;
      

        LocalDate date = LocalDate.now(); // Create a date object

        

        dataSetter data1 = new dataSetter(username, password);

        try {
            InsertDataToQury in = new InsertDataToQury();
            ps = in.getRecordData(data1);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int currentAmount = rs.getInt("AMOUNT");
                try {
                    if (amount > currentAmount) {
                        PrintWriter pw = response.getWriter();
                        pw.print("Insufficient Bank Balance!");
                    } else {
                        dataSetter dataHere = new dataSetter((currentAmount - amount), username, password);
                        dataSetter data2 = new dataSetter(rs.getString("NAME"), username, password, (currentAmount - amount), rs.getInt("ACCOUNT_NUMBER"));
                        dataTransaction data = new dataTransaction(amount, date, mobileNumber, rs.getInt("ACCOUNT_NUMBER"));
                        ps = in.updateAmountData(dataHere);
                        if (ps.executeUpdate() > 0) {
                            System.out.println(1);
                            try {
                                ps = in.insertTransactionData(data);
                                if (ps.executeUpdate() > 0) {
                                    System.out.println("Added");
                                    HttpSession session = request.getSession();
                                    session.setAttribute("data", data2);
                                    response.sendRedirect("recipt.jsp");
                                } else {
                                    System.out.println("Problem");
                                    PrintWriter pw = response.getWriter();
                                    pw.print(" Fail!");
                                }
                                ps.close();
                            } catch (Exception e) {
                                System.out.println(e);
                                // TODO: handle exception
                            }
                           
                            ps.close();
                        } else {
                            System.out.println(0);
                            PrintWriter pw = response.getWriter();
                            pw.print("Authentication Fail!");
                            ps.close();
                        }
                    }
                } catch (Exception e) {
                    // TODO: handle exception
                    System.out.println(e);
                }
            }
            ps.close(); // close the ResultSet and PreparedStatement
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
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
