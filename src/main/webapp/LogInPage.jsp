<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Log In Page</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <style>
      body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background: linear-gradient(
          90deg,
          rgba(2, 0, 36, 1) 0%,
          rgba(23, 136, 59, 0.47111344537815125) 0%,
          rgba(0, 212, 255, 0) 95%
        );
      }
      .container {
        display: grid;
        grid-template-columns: 1fr 1fr;

        padding: 2rem;
        border-radius: 15px;
      }
      .btn-primary {
        background-color: green;
        border: none;
        width: 100%;
      }
      .container > * {
        display: flex;
        justify-content: center;
        align-items: center;
        border: 5px solid green;
        border-radius: 5px 45px 5px;
        background-color: rgb(244, 244, 244);
      }
      .form-check {
        float: right;
      }
      .form-check a {
        text-decoration: none;
        color: grey;
      }
      .logInpart {
        width: 100%;
        background: transparent;
      }
      form {
        padding: 1rem;
        width: 100%;
        background: transparent;
      }
      .form-control {
        background: transparent;
        border: 1px solid green;
      }
      form input {
        background: transparent;
      }
      .imagePart {
        overflow: hidden;
        transform: translateY(70px);
      }
      .imagePart img {
        width: 100%;
        object-fit: contain;
      }
      #backButtton {
        transform: translateY(45px);
        background-color: green;
        color: white;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="logInpart">
        <form action="LogInController">
          <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label"
              >Email address</label
            >
            <input
              type="email"
              class="form-control"
              id="username"
              name="username"
              aria-describedby="emailHelp"
            />
            <div id="emailHelp" class="form-text">
              We'll never share your email with anyone else.
            </div>
          </div>
          <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label"
              >Password</label
            >
            <input
              type="password"
              class="form-control"
              id="password"
              name="password"
              name="password"
            />
          </div>
          <div class="mb-3 form-check">
            <a href="#">Open Bank Account</a>
          </div>
          <button type="submit" class="btn btn-primary" id="goToDash">
            Log In
          </button>
        </form>
      </div>
      <div class="imagePart">
        <img
          src="Images/bankingImage.jpg"
          alt="image Not found"
        />
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
      
    </script>
  </body>
</html>
