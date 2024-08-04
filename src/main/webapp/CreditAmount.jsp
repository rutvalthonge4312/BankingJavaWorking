<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bootstrap demo</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
  </head>
  <style>
    body {
      background: linear-gradient(
        90deg,
        rgba(2, 0, 36, 1) 0%,
        rgba(23, 136, 59, 0.47111344537815125) 0%,
        rgba(0, 212, 255, 0) 95%
      );
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

    .btn {
      margin-left: auto; /* Push the button to the right corner */
      background-color: green;
      color: whitesmoke;
      border: none;
    }
    .conatiner {
      height: 50vh;
      padding: 2rem;
      margin: auto auto;
      width: 70%;
    }
    form {
      border-radius: 15px;
      box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
      font-size: 1.3rem;
      border: none;
      margin: auto auto;
      padding: 3rem;
    }
    .form-control {
      border: 2px solid green;
      background: transparent;
    }
    #backButtton {
      float: right;
    }
  </style>
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
              <a class="nav-link active" href="#">Features</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Debit</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">App</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
          <button class="btn" disabled>Open an Account</button>
        </div>
      </div>
    </nav>
    <div class="conatiner">
      <form id="formSubmit">
        <div class="mb-3">
          <label for="exampleInputEmail1" class="form-label">Username</label>
          <input
            type="email"
            class="form-control"
            name="username"
            id="username"
            placeholder="Enter Username"
            required
          />
        </div>
        <div class="mb-3">
          <label for="exampleInputEmail1" class="form-label">Password</label>
          <input
            type="password"
            class="form-control"
            name="password"
            id="password"
            placeholder="Enter Password"
            required
          />
        </div>
        <div class="mb-3">
          <label for="exampleInputEmail1" class="form-label">Amount</label>
          <input
            type="number"
            class="form-control"
            name="amount"
            id="amount"
            placeholder="Enter Amount"
            required
          />
        </div>

        <button type="submit" class="btn btn-primary" id="submitButton">
          Credit Amount
        </button>
      </form>
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
      let amount = document.getElementById("amount");
      let formSubmit = document.getElementById("formSubmit");
      let submitButton = document.getElementById("submitButton");
      let password = document.getElementById("password");
      let username = document.getElementById("username");

      submitButton.addEventListener("click", () => {
       
        if (
          amount.value > 0 &&
          password.value != "" &&
          username.value != "" &&
          password.value.length > 6
        ) {
          let checkSpecialChar = false;
          let checkCapitalLetters = false;
          let checkSmallLetters = false;
          let passwordVal = password.value;
          for (const character of passwordVal) {
            if (
              character === "@" ||
              character === "#" ||
              character === "$" ||
              character === "%"
            ) {
              checkSpecialChar = true;
            } else if (character === character.toUpperCase()) {
              checkCapitalLetters = true;
            } else if (character === character.toLowerCase()) {
              checkSmallLetters = true;
            }
          }
          if (checkCapitalLetters && checkSmallLetters && checkSpecialChar) {
            formSubmit.action = "creaditAmountController";
            formSubmit.submit();
          } else {
            alert(
              "Password Must Contain Capital letters Small letters and Special Character also"
            );
          }
        } else {
          if (amount.value <= 0) {
            alert("Invalid Amount!");
            amount.style.border = "2px solid red";
          } else {
            amount.style.border = "2px solid green";
          }
          if (password.value == "") {
            alert("Invalid Password!");
            password.style.border = "2px solid red";
          } else {
            let checkSpecialChar = false;
            let checkCapitalLetters = false;
            let checkSmallLetters = false;
            let passwordVal = password.value;
            for (const character of passwordVal) {
              if (
                character === "@" ||
                character === "#" ||
                character === "$" ||
                character === "%"
              ) {
                checkSpecialChar = true;
              } else if (character === character.toUpperCase()) {
                checkCapitalLetters = true;
              } else if (character === character.toLowerCase()) {
                checkSmallLetters = true;
              }
            }
            if (checkCapitalLetters && checkSmallLetters && checkSpecialChar) {
              password.style.border = "2px solid green";
            } else {
              alert(
                "Password Must Contain Capital letters Small letters and Special Character also"
              );
            }
          }
          if (username.value == "") {
            alert("Invalid username!");
            username.style.border = "2px solid red";
          } else {
            username.style.border = "2px solid green";
          }
        }
      });
    </script>
  </body>
</html>
