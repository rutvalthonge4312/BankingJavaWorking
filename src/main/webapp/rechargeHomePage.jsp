<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@import bank.model %>
    <%
    String data = request.getParameter("data");
    // Process the data as needed
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Rechrge Home Page</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"
    />
    <style>
      .material-symbols-outlined {
        font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 24;
      }
    </style>
    <style>
      body {
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

      .mainBody {
        display: flex;
        flex-direction: row;

        justify-content: center;
        align-items: center;
        padding: 3rem;
      }
      .mainBody > * {
        height: 500px;
        width: 700px;
        padding: 2rem;
        display: flex;
        flex-direction: column;

        justify-content: center;
      }
      form {
        display: flex;
        flex-direction: column;
        justify-content: center;
      }
      .imageBody img {
        object-fit: contain;
        overflow: hidden;
      }
      .mainBody > * input,
      select {
        width: 100%;
      }

      .info {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 1rem;
      }
      .btn {
        display: flex;
        flex-direction: row;
        justify-content: center;

        text-align: center;
        border: 1px solid rgb(181, 181, 181);
        padding: 1rem;
      }
      .btn > * {
        align-items: center;
        margin: auto;
      }
      .btn:hover {
        background-color: rgb(67, 67, 187);
        color: white;
        transform: scale(1.01);
      }
      svg {
        height: 70px;
        width: 70px;
      }
      form input {
        margin: 1rem;
      }
      .form-control,
      .form-select {
        border: none;
        border-bottom: 1px solid black;
        border-radius: 0px;
      }
      #searchPlan {
        background-color: rgb(67, 67, 187);
        padding: 1rem;
        margin: auto;
        margin-top: 2rem;
        font-size: 1.3rem;
        width: 70%;
        border-radius: 25px;
      }
      #username {
        display: none;
      }
      #backButtton {
        width: 15%;
        background-color: rgb(226, 130, 130);
        color: white;
        border: none;
        font-size: 1.3rem;
        margin: 1rem auto;
        box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
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
          <p><%=data %></p>
        </div>
      </div>
    </nav>
    <div class="mainBody">
      <div class="formBody">
        <div class="info">
          <svg
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
            color="#000093"
          >
            <path
              d="M18 8h-2.09a6 6 0 00-1.45-3H18a1 1 0 100-2H6a1 1 0 000 2h4a4 4 0 013.86 3H6a1 1 0 000 2h7.86A4 4 0 0110 13H6.92a.651.651 0 00-.2 0l-.18.06-.15.11a1 1 0 00-.15.14l-.06.06v.09a.91.91 0 00-.18.44v.1a.24.24 0 000 .08.65.65 0 000 .2c.015.061.036.122.06.18l.11.15.14.15.06.06 10 7A1 1 0 0017 22a1 1 0 00.57-1.82L10.16 15a6 6 0 005.75-5H18a1 1 0 100-2z"
              fill="currentColor"
            ></path>
          </svg>
          <h1>Recharge</h1>
          <p>Enter your details to find the best prepaid plans.</p>
          <div class="btn">
            <span class="material-symbols-outlined"> smartphone </span>
            <p>Mobile Recharge</p>
          </div>
        </div>
        <form id="formSubmit">
          <div>
            <div class="form-floating">
              <input
                type="number"
                class="form-control"
                id="mobileNumber"
                name="mobileNumber"
                placeholder="98XXXXXXXX"
                required
              />
              <label for="floatingInput">Mobile Number</label>
            </div>
            <div class="form-floating">
              <input
                type="text"
                class="form-control"
                id="username"
                name="username"
                value=<%=data %>
                required
              />
              <label for="floatingInput">Mobile Number</label>
            </div>
            <div class="form-floating">
              <select
                class="form-select"
                id="serviceProvoider"
                name="serviceProvoider"
                required
              >
                <option selected disabled value="">
                  Select Service Provoider
                </option>
                <option>Jio</option>
                <option>Idea</option>
                <option>Aritel</option>
              </select>
              <label for="floatingPassword">Service Provoider</label>
            </div>
          </div>
          <button type="button" class="btn btn-primary" id="searchPlan">
            Search Plan
          </button>
        </form>
      </div>

      <div class="imageBody">
        <img src="Images/Remove background project.png" alt="" />
      </div>
    </div>
    <button onclick="history.back()" class="btn" id="backButtton">
      Go Back
    </button>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script>
      let mobileNumber = document.getElementById("mobileNumber");
      let searchPlan = document.getElementById("searchPlan");
      let serviceProvoider = document.getElementById("serviceProvoider");
      let formSubmit = document.getElementById("formSubmit");
   
      searchPlan.addEventListener("click", () => {
    
        event.preventDefault();

        if (mobileNumber.value.length == 10 && serviceProvoider.value != "") {
        
        	if (serviceProvoider.value == "Jio") {
                formSubmit.action = "recharge.jsp";
                formSubmit.submit();
              } else if (serviceProvoider.value == "Idea") {
                formSubmit.action = "ideaRecharge.jsp";
                formSubmit.submit();
              }
        } else {
          if (mobileNumber.value.length != 10) {
            alert("Check The Mobile Number");
            mobileNumber.style.border = "1px solid red";
          }

          if (serviceProvoider.value == "") {
            alert("Please Select Service Provoider");
            serviceProvoider.style.border = "1px solid red";
          }
        }
      });
    </script>
  </body>
</html>
