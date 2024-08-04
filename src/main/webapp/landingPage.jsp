<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Home Page</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="homwPageCSS.css" />
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
  border: 3px solid grey;
  font-size: 1.3rem;
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
}

.mainConatiner {
  display: grid;
  grid-template-columns: 2fr 2fr 1fr;
  justify-content: center;
  align-items: center;
  padding: 2rem;
}
.mainConatiner > * {
  padding: 2rem;
}
.mainConatiner > * h1 {
  font-size: 3.7rem;
}
.mainConatiner > * p {
  padding: 1rem;
  font-size: 1.1rem;
}
.mainConatiner .btn {
  color: whitesmoke;
  background-color: green;
  min-height: 3.8rem;
  width: 70%;
  border: none;
  font-size: 1.3rem;
}
.mainConatiner .imageSide {
  transform: translateY(80px);
}
.mainConatiner .imageSide img {
  width: auto;
  height: auto;
  transform: scale(1.3);
  filter: drop-shadow(0.35rem 0.35rem 0.4rem rgba(0, 0, 0, 0.5));
}
.userCount h1 {
  font-size: 1.7rem;
  line-height: 0;
  text-align: center;
}

.userCount p {
  font-size: 1.3rem;
  line-height: 0;
  margin: auto;
  text-align: center;
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
              <a class="nav-link active" href="#">Features</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Debit</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="LogInPage.jsp">Log In</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
          <button class="btn" id="goToLogIn">Open an Account</button>
        </div>
      </div>
    </nav>
    <div class="mainConatiner">
      <div class="infoSide">
        <h1>Digital banking Made for</h1>

        <h1>Digital User's</h1>
        <p>
          Gopay is an all-in-one mobile banking app chock full of all the tools,
          tips, and tricks you need to take control of your finances,
        </p>

        <button class="btn btn-danger">Credit Money Now!</button>
      </div>
      <div class="imageSide">
        <img src="Images/bankHomeImage.png" alt="" />
      </div>
      <div class="userCount">
        <div>
          <h1>Total User's</h1>
          <p>30</p>
        </div>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script>
      let gotoLogInPage = document.getElementById("goToLogIn");
      gotoLogInPage.addEventListener("click", () => {
        window.location.href = "OpenBankAccountPage.jsp";
      });
    </script>
  </body>
</html>
