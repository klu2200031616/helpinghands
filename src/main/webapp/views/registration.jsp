<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Donation Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet" />
    <style>
      body {
        font-family: 'Inter', sans-serif;
        background-image: url('https://storage.googleapis.com/a1aa/image/Pe3kcHj1QyV9cy4Jeq6O7vBr8Z2fKRKB91LOYLAT8kWwnf4OB.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
      }

      .form-container {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
      }

      .form-card {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        width: 100%;
      }

      .form-card h2 {
        font-size: 1.75rem;
        margin-bottom: 0.75rem;
      }

      .form-card p {
        font-size: 1rem;
        margin-bottom: 1.25rem;
        color: #4a5568;
      }

      .form-card label {
        font-size: 1rem;
        margin-bottom: 0.5rem;
        color: #4a5568;
      }

      .form-card input,
      .form-card select {
        width: 100%;
        padding: 0.75rem;
        margin-bottom: 1rem;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 1rem;
      }

      .form-card input:focus,
      .form-card select:focus {
        outline: none;
        border-color: #3182ce;
        box-shadow: 0 0 0 2px rgba(49, 130, 206, 0.3);
      }

      .password-field {
        position: relative;
      }

      .password-field input {
        padding-right: 2.5rem;
      }

      .password-toggle {
        position: absolute;
        top: 50%;
        right: 1rem;
        transform: translateY(-50%);
        cursor: pointer;
        color: #4a5568;
      }

      .form-card button {
        background-color: #3182ce;
        color: white;
        padding: 1rem;
        font-size: 1rem;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      .form-card button:hover {
        background-color: #2b6cb0;
      }

      .form-card .error {
        color: red;
        font-size: 0.875rem;
      }

      .password-row {
        display: flex;
        gap: 1rem;
      }

      .password-row .password-field {
        flex: 1;
      }
    </style>
    <script>
      function togglePasswordVisibility(fieldId, iconId) {
        const passwordField = document.getElementById(fieldId);
        const toggleIcon = document.getElementById(iconId);
        if (passwordField.type === "password") {
          passwordField.type = "text";
          toggleIcon.classList.remove("fa-eye");
          toggleIcon.classList.add("fa-eye-slash");
        } else {
          passwordField.type = "password";
          toggleIcon.classList.remove("fa-eye-slash");
          toggleIcon.classList.add("fa-eye");
        }
      }

      function validateForm() {
        var password = document.forms["signupForm"]["password"].value;
        var confirmPassword = document.forms["signupForm"]["confirmPassword"].value;
        var email = document.forms["signupForm"]["email"].value;
        var phoneNumber = document.forms["signupForm"]["phoneNumber"].value;
        var passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        var phonePattern = /^[6789]\d{9}$/;

        if (password !== confirmPassword) {
          alert("Passwords do not match.");
          return false;
        }

        if (!passwordPattern.test(password)) {
          alert("Password must contain at least one capital letter, one number, and one special character.");
          return false;
        }

        if (!emailPattern.test(email)) {
          alert("Please enter a valid email address.");
          return false;
        }

        if (phoneNumber && !phonePattern.test(phoneNumber)) {
          alert("Please enter a valid 10-digit Indian phone number.");
          return false;
        }

        return true;
      }
    </script>
  </head>
  <body>
    <div class="form-container">
      <div class="form-card">
        <h2 class="text-center">Sign Up</h2>
        <p class="text-center text-gray-600">Join us in making a difference</p>

        <c:if test="${not empty errorMessage}">
          <div class="error text-center mb-4">
            <p>${errorMessage}</p>
          </div>
        </c:if>

        <form name="signupForm" action="/addDonar" method="post"  enctype="multipart/form-data"  onsubmit="return validateForm()">
          <div class="mb-3">
            <label class="block">Name</label>
            <input type="text" name="name" placeholder="Name" required />
          </div>
<div class="mb-3">
    <label class="block">Profile Image (optional)</label>
    <input type="file" name="profileImage" accept="image/*" />
</div>

          <div class="mb-3">
            <label class="block">Email</label>
            <input type="email" name="email" placeholder="Email" required />
          </div>

          <div class="password-row mb-3">
            <div class="password-field">
              <label class="block">Password</label>
              <input type="password" id="password" name="password" placeholder="Password" required />
              <i class="fas fa-eye password-toggle" id="togglePassword" onclick="togglePasswordVisibility('password', 'togglePassword')"></i>
            </div>

            <div class="password-field">
              <label class="block">Confirm Password</label>
              <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required />
              <i class="fas fa-eye password-toggle" id="toggleConfirmPassword" onclick="togglePasswordVisibility('confirmPassword', 'toggleConfirmPassword')"></i>
            </div>
          </div>

          <div class="mb-3">
            <label class="block">Phone Number (optional)</label>
            <input type="text" name="phoneNumber" placeholder="Phone Number" />
          </div>

          <div class="mb-3">
            <label class="block">Address</label>
            <input type="text" name="address" placeholder="Address" required />
          </div>

          <div class="mb-3">
            <label class="block">Donation Preferences</label>
            <select name="donationPreference">
              <option>--select--</option>
              <option>Food</option>
              <option>Clothing</option>
              <option>Money</option>
              <option>Educational Supplies</option>
            </select>
          </div>

          <button type="submit" class="w-full">Sign Up</button>
        </form>
      </div>
    </div>
  </body>
</html>
