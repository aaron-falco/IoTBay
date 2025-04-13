<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register</title>
</head>
<body>
  <h2>Create Account</h2>
  <form id="registerForm">
    <label for="firstName">First Name:</label><br />
    <input type="text" id="firstName" required /><br /><br />

    <label for="lastName">Last Name:</label><br />
    <input type="text" id="lastName" required /><br /><br />

    <label for="email">Email:</label><br />
    <input type="email" id="email" required /><br /><br />

    <label for="password">Password:</label><br />
    <input type="password" id="password" required /><br /><br />

    <button type="submit">Register</button>
  </form>

  <br />
  <button onclick="goToLanding()">Back to Login Page</button>

  <script>
    document.getElementById('registerForm').addEventListener('submit', function(e) {
      e.preventDefault();
      const firstName = document.getElementById('firstName').value;
      const lastName = document.getElementById('lastName').value;
      const email = document.getElementById('email').value;
      const password = document.getElementById('password').value;

      localStorage.setItem('firstName', firstName);
      localStorage.setItem('lastName', lastName);
      localStorage.setItem('email', email);
      localStorage.setItem('password', password);

      location.href = 'login.html';
    });

    function goToLanding() {
      location.href = 'landing.html';
    }
  </script>
</body>
</html>
