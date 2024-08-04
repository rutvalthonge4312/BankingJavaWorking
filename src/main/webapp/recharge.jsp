<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bank.doa.InsertDataToQury"%>
<%@page import="bank.model.dataTransaction"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 <%! long mobileNumber; String username;	ArrayList<dataTransaction> tableData = new ArrayList<dataTransaction>();%> 
 <%
 long mobileNumber=Long.parseLong(request.getParameter("mobileNumber"));
 String username=request.getParameter("username");
 %>
 <%	
 ResultSet ps=null;
 	try{
 		
 	 	dataTransaction dataSet=new dataTransaction(mobileNumber);
 	 	InsertDataToQury in=new InsertDataToQury();
 	 	ps=in.showRechargeForMobileNumberData(dataSet);
 	 
 	 	//dataTransaction dataNew =new dataTransaction()
 	 			//int amount, LocalDate date,long mobileNumber,int accountNUmber
 	 			int amount;
 	 			LocalDate date;
 	 			Long mobileNumberNew;
 	 			int accountNumber;
 	 			dataTransaction dataSetNew;
 	 			while(ps.next()){	
 	 				System.out.println("Rutval");
 	 				 amount=ps.getInt("AMOUNT");
 	 				 date=LocalDate.ofInstant(ps.getDate("TRANSACTION_DATE").toInstant(), ZoneId.systemDefault());
 	 				 mobileNumberNew=ps.getLong("MOBILENUMBER");
 	 				 accountNumber=ps.getInt("PAYMENT_ACC_NUMBER");
 	 				 dataSetNew=new dataTransaction(amount,date,mobileNumberNew,accountNumber);
 	 				tableData.add(dataSetNew);
 	 			}
 	 	
 		}catch(Exception e){
 			System.out.print("HHHH");
	 		System.out.print(e);
 		}
 		finally {
	    // Make sure to close the ResultSet, statement, and connection if used
	    if (ps != null) {
	        try {
	            ps.close();
	        } catch (Exception e) {
	        	System.out.print("Problem");
	            e.printStackTrace(); // Or handle the exception appropriately
	        }
	    }
	}
 	
 %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Show Plan</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <style>
      body {
        background-color: rgb(241, 241, 241);
        background: linear-gradient(to right, rgb(214, 214, 214), white);
      }
      .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: transparent;
        font-size: 1.3rem;
        margin-top: 1rem;
      }
      .navbar .btn {
        min-height: 3.8rem;
        width: 15%;
        border-radius: 15px;

        font-size: 1.3rem;
      }
      .navbar .btn {
        text-decoration: underline;
      }
      .navbar,
      .navbar-expand-lg,
      .bg-body-tertiary {
        background: transparent;
      }
      .navbar-nav {
        justify-content: center;
        flex-grow: 1; /* This makes the ul take up all available space */
      }

      .navbar-brand {
        margin-right: auto; /* Push the image to the left corner */
      }
      .mobileNumberInfo .card {
        font-size: 1.3rem;
        width: 30%;
        padding: 1rem;
      }
      .mobileNumberInfo .card .form-control {
        background: transparent;
      }
      .containerBody {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        padding: 2rem;
      }
      .card {
        background-color: rgba(232, 235, 247, 255);
        background: transparent;
        margin: 1rem;
        border: none;

        border-radius: 15px;
        box-shadow: rgba(17, 17, 26, 0.1) 0px 8px 24px,
          rgba(17, 17, 26, 0.1) 0px 16px 56px,
          rgba(17, 17, 26, 0.1) 0px 24px 80px;
      }
      .card a {
        text-decoration: none;
      }
      .card .btn {
        color: white;
        background-color: rgb(67, 67, 187);
        margin: 1rem auto;
        width: 80%;
        border-radius: 25px;
        box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
          rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
      }
      .header {
        display: flex;
        flex-direction: row;

        justify-content: center;
        align-items: center;
        padding: 1rem;
      }
      .header > * {
        margin: 0rem 2rem;
      }
      .middle {
        display: flex;
        flex-direction: row;

        justify-content: center;
        align-items: center;
        padding: 1rem;
      }
      .middle > * {
        margin: 0rem 2rem;
      }
      .card .btn:hover {
        animation: buttonAnimation 0.5s 1;
      }
      #backButtton{
      	text-align:"center"
      }
      .backButtonDiv{
     display: flex;
        flex-direction: row;
		margin:1rem;
		padding:1rem;
        justify-content: center;
        align-items: center;
      
      }
        .mobileNumberInfo {
        display: flex;
        flex-direction: row;
      }
      @keyframes buttonAnimation {
        0% {
          width: 100%;
        }

        50% {
          width: 50%;
        }
        100% {
          width: 80%;
        }
      }
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <img
          src="Images/bankLogo.png"
          alt=""
          class="navbar-brand"
          href="#"
          style="height: 60px; width: 60px"
        />

        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#">Credit</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="#">Debit</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="landingPage.jsp">Log_Out</a>
            </li>
          </ul>

          <img
            src="Images/userImage.png"
            alt="User image"
            style="height: 50px; width: 50px"
          />
          <p><%=username%> </p>
        </div>
      </div>
    </nav>
    <div class="mobileNumberInfo">
      <div class="card">
        <p>
          Mobile Number:
          <strong> <%= request.getParameter("mobileNumber") %> </strong>
        </p>
        <input
          type="number"
          class="form-control"
          disabled
          name="amount"
          id="amount"
        />
      </div>
      <div class="card">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">Tr. ID</th>
              <th scope="col">Amount</th>
              <th scope="col">Date</th>
            </tr>
          </thead>
           <tbody id="tableBody">
          
         	<c:forEach var="data" items="${tableData}">
    			<tr>
        			
        			<td>${data.getMobileNumber()}</td>
        			<td>${data.getAmount()}</td>
        			<td>${data.getMobileNumber()}</td>
    			</tr>
			</c:forEach>
			
           		
           </tbody>
        </table>
      </div>
    </div>
    <div class="containerBody">
      <div class="card">
        <div class="header">
          <div class="price">
            <h1>₹ 666</h1>
            <a href="#">View Details</a>
          </div>
          <img src="Images/5g_Tag.svg" alt="" />
        </div>
        <div class="middle">
          <div>
            <h3>VALIDITY</h3>
            <p>84 DAYS</p>
          </div>
          <div>
            <h3>DATA</h3>
            <p>1.5GB/DAY</p>
          </div>
        </div>

        <button
          class="btn"
          value="666"
          name="666"
          data-bs-toggle="modal"
          data-bs-target="#exampleModal"
          onclick="getData(this)"
        >
          Recharge
        </button>
      </div>
      <div class="card">
        <div class="header">
          <div class="price">
            <h1>₹ 719</h1>
            <a href="#">View Details</a>
          </div>
          <img src="Images/5g_Tag.svg" alt="" />
        </div>
        <div class="middle">
          <div>
            <h3>VALIDITY</h3>
            <p>84 DAYS</p>
          </div>
          <div>
            <h3>DATA</h3>
            <p>2GB/DAY</p>
          </div>
        </div>

        <button
          class="btn"
          value="719"
          name="719"
          data-bs-toggle="modal"
          data-bs-target="#exampleModal"
          onclick="getData(this)"
        >
          Recharge
        </button>
      </div>
      <div class="card">
        <div class="header">
          <div class="price">
            <h1>₹ 239</h1>
            <a href="#">View Details</a>
          </div>
          <img src="Images/5g_Tag.svg" alt="" />
        </div>
        <div class="middle">
          <div>
            <h3>VALIDITY</h3>
            <p>28 DAYS</p>
          </div>
          <div>
            <h3>DATA</h3>
            <p>1.5GB/DAY</p>
          </div>
        </div>

        <button
          class="btn"
          value="239"
          name="239"
          data-bs-toggle="modal"
          data-bs-target="#exampleModal"
          onclick="getData(this)"
        >
          Recharge
        </button>
      </div>
      <div class="card">
        <div class="header">
          <div class="price">
            <h1>₹ 719</h1>
            <a href="#">View Details</a>
          </div>
          <img src="Images/5g_Tag.svg" alt="" />
        </div>
        <div class="middle">
          <div>
            <h3>VALIDITY</h3>
            <p>28 DAYS</p>
          </div>
          <div>
            <h3>DATA</h3>
            <p>2GB/DAY</p>
          </div>
        </div>

        <button
          class="btn"
          value="719"
          name="719"
          data-bs-toggle="modal"
          data-bs-target="#exampleModal"
          onclick="getData(this)"
        >
          Recharge
        </button>
      </div>
      <div class="card">
        <div class="header">
          <div class="price">
            <h1>₹ 3662</h1>
            <a href="#">View Details</a>
          </div>
          <img src="Images/5g_Tag.svg" alt="" />
        </div>
        <div class="middle">
          <div>
            <h3>VALIDITY</h3>
            <p>365 DAYS</p>
          </div>
          <div>
            <h3>DATA</h3>
            <p>2GB/DAY</p>
          </div>
        </div>

        <button
          class="btn"
          value="3662"
          name="3662"
          data-bs-toggle="modal"
          data-bs-target="#exampleModal"
          onclick="getData(this)"
        >
          Recharge
        </button>
      </div>
    </div>
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">
              Submit Details
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form action="transcationController">
            <label for="usernameInModal" class="form-label">Username</label>
            <input
              type="email"
              id="usernameInModal"
               name="usernameInModal"
               readonly ="true"
              class="form-control"
              aria-describedby="passwordHelpBlock"
            />
            <label for="passwordInModal" class="form-label">Password</label>
            <input
              type="password"
              id="passwordInModal"
              name="passwordInModal"
              class="form-control"
              required
              aria-describedby="passwordHelpBlock"
            />
            <label for="amountInModal" class="form-label">Amount</label>
            <input
              type="number"
              id="amountInModal"
               name="amountInModal"
               readonly ="true"
              class="form-control"
              aria-describedby="passwordHelpBlock"
            />
            <label for="mobileNumberInModal" class="form-label">Mobile Number</label>
            <input
              type="number"
              id="mobileNumberInModal"
               name="mobileNumberInModal"
              readonly ="true"
              class="form-control"
              aria-describedby="passwordHelpBlock"
            />
            <button class="btn btn-primary" id="makePaymentButton" type="submit">Make Payment</button></form>
          </div>
        </div>
      </div>
    </div>
	<div class="backButtonDiv">
		 <button onclick="history.back()" class="btn btn-danger" id="backButtton" >
      Go Back
    </button>
	</div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script>
      let amount = document.getElementById("amount");
      let tableBody=document.getElementById("tableBody");
      
   
      let data;
      function getData(ele) {
    	  
        event.preventDefault();
        let amountInModal=document.getElementById("amountInModal");
        let mobileNumberInModal=document.getElementById("mobileNumberInModal");
        let usernameInModal=document.getElementById("usernameInModal");
        amount.setAttribute("value", ele.value);
        amountInModal.setAttribute("value",ele.value);
        usernameInModal.setAttribute("value","<%=username%>" );
        mobileNumberInModal.setAttribute("value",<%=mobileNumber %> );
        

      }
    </script>
  </body>
</html>
