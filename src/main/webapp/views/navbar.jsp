<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    margin: 0;
    font-family: 'Roboto', sans-serif;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    background-color: #ffffff; /* White background */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

.navbar .logo img {
    height: 40px;
    width: auto;
}

.navbar .nav-links a {
    text-decoration: none;
    color: #333333; /* Default link color */
    margin: 0 15px;
    font-size: 16px;
    position: relative;
}

.navbar .nav-links a:hover {
    color: #007bff; /* Blue color on hover */
}

.navbar .nav-links .button {
    padding: 10px 20px;
    border: 1px solid #333333;
    border-radius: 20px;
    background-color: #ffffff; /* White background for the button */
    color: #333333;
    font-weight: bold;
    text-decoration: none;
}

.navbar .nav-links .button:hover {
    background-color: #007bff; /* Blue background on hover */
    color: #ffffff; /* White text on hover */
    border-color: #007bff;
}

</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="navbar">
    <div class="logo">
        <img alt="Helping Hands logo" height="60" src="images/image2.jpg" width="80" />
    </div>
    <div class="nav-links">
        <a href="/tips">Tips</a>
        <a href="/aboutus">About</a>
       
        <a class="button" href="login">Login</a>
    </div>
</div>

</body>
</html>