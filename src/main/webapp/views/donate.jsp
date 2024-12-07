<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donate</title>
    <style>
        /* Body Styling */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('https://your-image-url.com/background.jpg'); /* Replace with your background image URL */
            background-size: cover;
            background-position: center;
            font-family: 'Arial', sans-serif;
        }

        /* Container to center the form */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        /* Form container styling */
        .form-container {
            background: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        /* Title Styling */
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
        }

        /* Label Styling */
        label {
            display: block;
            margin-bottom: 10px;
            font-size: 18px;
            color: #555;
            text-align: left;
        }

        /* Input Styling */
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
        }

        /* Button Styling */
        button {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        /* Button Hover Effect */
        button:hover {
            background-color: #218838;
        }

        button:active {
            background-color: #1e7e34;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .form-container {
                width: 90%;
                padding: 30px;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="form-container">
            <h1>Make a Donation</h1>
            <form id="donationForm" action="/processDonation" method="post" onsubmit="multiplyAmount()">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                <br><br>
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" required>
                <br><br>
                <label for="currency">Currency:</label>
                <select id="currency" name="currency">
                    <option value="INR">INR</option>
                </select>
                <br><br>
                <button type="submit">Place Order</button>
            </form>
        </div>
    </div>

    <script>
        function multiplyAmount() {
            var amountInput = document.getElementById('amount');
            var amount = amountInput.value;
            amountInput.value = amount * 100; // Multiply amount by 100
        }
    </script>

</body>

</html>
