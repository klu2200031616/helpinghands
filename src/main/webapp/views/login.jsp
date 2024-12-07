<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Login Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
</head>
<body class="flex items-center justify-center min-h-screen" style="background-image: url('images/image6.png'); background-size: cover; background-position: center;">
    <div class="bg-white shadow-md rounded-lg flex w-3/4 max-w-4xl">
        <div class="w-1/2 p-8">
            <h2 class="text-2xl font-semibold mb-6">Welcome back,</h2>
            <form action="/loginPage" method="post">
                <div class="mb-4">
                    <label class="block text-gray-600 text-sm mb-2" for="email">EMAIL</label>
                    <input class="w-full px-3 py-2 border border-gray-300 rounded" id="email" name="email" placeholder="Enter your email" type="email"/>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-600 text-sm mb-2" for="password">PASSWORD</label>
                    <input class="w-full px-3 py-2 border border-gray-300 rounded" id="password" name="password" placeholder="Enter your password" type="password"/>
                </div>
               <!--  <div class="mb-4 text-right">
                    <a class="text-sm text-gray-500" href="#">Forgot password?</a>
                </div> -->
                <div class="mb-4">
                    <button class="w-full bg-yellow-500 text-white py-2 rounded hover:bg-yellow-600">SIGN IN</button>
                </div>
                <!--< div class="mb-4">
                    <button class="w-full bg-white border border-gray-300 text-gray-700 py-2 rounded flex items-center justify-center hover:bg-gray-100">
                        <i class="fab fa-facebook-f mr-2"></i>Connect with <span class="font-semibold ml-1">Facebook</span>
                    </button>
                </div> -->
            </form>
        </div>
        <div class="w-1/2 relative">
            <img alt="Colorful buildings along a street" class="absolute inset-0 w-full h-full object-cover rounded-r-lg" src="https://storage.googleapis.com/a1aa/image/Pe3kcHj1QyV9cy4Jeq6O7vBr8Z2fKRKB91LOYLAT8kWwnf4OB.jpg"/>
            <div class="absolute inset-0 bg-black opacity-50 rounded-r-lg"></div>
            <div class="absolute inset-0 flex flex-col items-center justify-center text-white p-8">
                <h2 class="text-2xl font-semibold mb-4">New here?</h2>
                <p class="mb-4 text-center">Sign up and discover a great amount of new opportunities!</p>
                <a href="registration">
                    <button class="bg-transparent border border-white text-white py-2 px-4 rounded hover:bg-white hover:text-black transition-all duration-300">
                        SIGN UP
                    </button>
                </a>
            </div>
        </div>
    </div>

    <%-- JavaScript to display alert if error or success message is present --%>
    <%
        String errorMessage = (String) request.getAttribute("error");
        String successMessage = (String) request.getAttribute("message");
        if (errorMessage != null) {
    %>
        <script>
            alert("<%= errorMessage %>");
        </script>
    <%
        }
        if (successMessage != null) {
    %>
        <script>
            alert("<%= successMessage %>");
        </script>
    <%
        }
    %>
</body>
</html>
