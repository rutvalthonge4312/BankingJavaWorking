<%@page import="bank.model.dataSetter"%>
<%@page import="java.sql.Date"%>
<%@page import="bank.doa.InsertDataToQury"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%! 
    java.sql.Date sqlDate;
    	int amount;
    	int transactionID;
    %>  
    <%
    dataSetter dataHere = (dataSetter) session.getAttribute("data");
    %>
    <%
   
    try{
    	InsertDataToQury in =new InsertDataToQury();
        ResultSet rs=in.showTransactionData(); 
        //showTransactionData
        if(rs.next()){
        	amount=rs.getInt("AMOUNT");
        	transactionID=rs.getInt("TRANSACTION_ID");
        	  sqlDate =rs.getDate("TRANSACTION_DATE");
        }
    }
    catch(Exception e){
    	System.out.print(e);
    }
    %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sucess</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <style>
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: rgb(155, 155, 155);
        height: 100vh;
      }
      .container {
        padding: 1rem;
        border-radius: 25px;
      }
      h1,
      h3 {
        color: green;
      }
      .card {
        background-color: rgb(240, 240, 240);
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        border: none;

        display: flex;
        flex-direction: column;
        justify-content: center;

        padding: 2rem;
        border-radius: 25px;
      }
      .backButton {
        text-align: center;
        float: right;
        margin: 1rem auto;
      }
      button {
        border: none;
      }
      .container1 {
        display: flex;
        flex-direction: column;

        font-size: 2rem;
      }
      .header {
        text-align: center;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="card">
        <div class="header">
          <h1>SuccessFully Recharged....</h1>
          <h3>Recharge Will Reflected on Your Mobile Number Soon...</h3>
        </div>
        <div class="container1">
          <p>Date: <strong><%= sqlDate%></strong></p>
          <p>Transaction Id: <strong><%= transactionID %></strong></p>
          <p>Amount: <strong><%=amount %> Rs</strong></p>
        </div>
      </div>
      <div class="backButton">
        <button class="btn btn-success" id="goToUserPage">
          Back To Dashboard
        </button>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script>
      //UserDashBoard.jsp
      let goToUserPage = document.getElementById("goToUserPage");
      goToUserPage.addEventListener("click", () => {
    	  <% 
    	  HttpSession sessionNew=request.getSession();
    	  sessionNew.setAttribute("data",dataHere);
			 //response.sendRedirect("UserDashBoard.jsp");
    	  %>
    	  window.location.href = "UserDashBoard.jsp";
      });
    </script>
  </body>
</html>
