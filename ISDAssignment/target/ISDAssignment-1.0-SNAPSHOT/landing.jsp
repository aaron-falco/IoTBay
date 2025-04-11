<%-- 
    Document   : landing
    Created on : 28 Mar 2025, 2:19:40 pm
    Author     : Nur Fatini Jamla Norlijam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
<title>Landing Page</title>
<style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #ff758c, #6a82fb);
            color: white;
        }
 
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 60px;
            background-color: rgba(0, 0, 0, 0.4);
        }
 
        .logo {
            font-weight: bold;
            font-size: 1.5em;
        }
 
        nav a {
            margin: 0 15px;
            color: white;
            text-decoration: none;
            font-weight: 500;
        }
 
        nav a:hover {
            text-decoration: underline;
        }
 
        .hero {
            text-align: center;
            padding: 100px 20px;
        }
 
        .hero h1 {
            font-size: 48px;
            margin-bottom: 10px;
        }
 
        .hero p {
            font-size: 18px;
            max-width: 600px;
            margin: 0 auto 30px;
        }
 
        .hero .button {
            padding: 12px 24px;
            background: white;
            color: #2b1055;
            border: none;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            text-decoration: none;
        }
 
        .hero .button:hover {
            background: #ddd;
        }
</style>
</head>
<body>
<header>
<div class="logo">IOTBay Assignment</div>
<nav>
<a href="#">Home</a>
<a href="#">Menu</a>
<a href="#">Catalogue</a>
<a href="#">Staff</a>
<a href="#">Contact</a>
</nav>
<a href="register.jsp" class="button">Register</a>
<!-- Add Login Button  -->
</header>
 
    <div class="hero">
<h1>Hello everyone!</h1>
<p>Welcome! Start your journey here – click below to register and begin exploring.</p>
<a class="button" href="registration2.jsp">Get Started</a>
</div>
</body>
</html>
