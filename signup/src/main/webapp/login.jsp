<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Sign Up Form</title>

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    />

    

    <!-- Iconic Fonts -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"
    />

   
  </head>
  <body>
    <div class="container">
      <div class="row justify-content-center align-items-center">
        <div class="col-md-4">
          <div class="text-center">
            <img src="signup.jpg" alt="Sign up image"/>
            <a
              href="registration.jsp"
              class="signup-image-link fs-6 d-block mt-2"
              >Create an account</a
            >
          </div>
        </div>
        <div class="col-md-4">
          <div class="text-center">
            <h2 class="form-title mt-4 mb-4">Sign In</h2>
            <form method="post" action="login" class="register-form">
              <div class="mb-3">
                <label for="username" class="visually-hidden">Username</label>
                <div class="input-group">
                  <div class="input-group-prepend my-auto me-2">
                    <span class="input-group-text"
                      ><i class="zmdi zmdi-account material-icons-name"></i
                    ></span>
                  </div>
                  <input
                    class="form-control"
                    type="text"
                    name="username"
                    id="username"
                    placeholder="Enter Email"
                  />
                </div>
              </div>
              <div class="mb-3 mt-4">
                <label for="password" class="visually-hidden">Password</label>
                <div class="input-group">
                  <div class="input-group-prepend me-2 my-auto">
                    <span class="input-group-text"
                      ><i class="zmdi zmdi-lock"></i
                    ></span>
                  </div>
                  <input
                    class="form-control"
                    type="password"
                    name="password"
                    id="password"
                    placeholder="Password"
                  />
                </div>
              </div>

              <div class="form-group">
                <input
                  type="submit"
                  name="signin"
                  id="signin"
                  class="btn btn-primary"
                  value="Log in"
                />
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>

    <% String successMessage=(String)session.getAttribute("loginstatus");
    if(successMessage != null && successMessage.equals("failed")) { %>
    <script>
      swal("Sorry", "Wrong username or Password!", "error");
    </script>
    <% } %>
  </body>
</html>
