<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>About Us - Helping Hands</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        h2 {
            color: #333;
        }
        .section-title {
            text-align: center;
            font-size: 1.8rem;
            font-weight: bold;
            color: #000;
            margin-bottom: 20px;
        }
        .quote {
            font-style: italic;
            color: #555;
            text-align: center;
            margin: 20px 0;
        }
    </style>
</head>
<body class="bg-white text-gray-800">

    <!-- Header Section -->
    <div class="bg-gray-100 py-12">
        <div class="container mx-auto text-center">
            <h1 class="text-4xl font-bold mb-4">About Us</h1>
            <p class="text-gray-600 text-lg">
                At Helping Hands, we are dedicated to creating meaningful connections between donors, volunteers, and people in need. We believe in the power of collective effort to transform lives and communities.
            </p>
            <p class="quote mt-6">"Together, we can build a brighter future for everyone." – Helping Hands Team</p>
        </div>
    </div>

    <!-- Mission Section -->
    <section class="container mx-auto px-6 py-12">
        <h2 class="section-title">Our Mission</h2>
        <div class="flex flex-wrap items-center">
            <div class="w-full md:w-1/2 px-4">
                <p class="text-gray-700 text-lg">
                    At Helping Hands, our mission is simple yet profound: to provide a platform that makes giving and receiving support accessible, efficient, and impactful. We connect generous donors with individuals and communities who need help, ensuring every contribution makes a difference. From fundraising to donation drives, we are committed to fostering a spirit of care and compassion worldwide.
                </p>
            </div>
            <div class="w-full md:w-1/2 px-4 text-center">
                <img src="images/vol.jpg" alt="Our Mission" class="rounded shadow-md mx-auto" />
            </div>
        </div>
    </section>

    <!-- Vision Section -->
    <section class="bg-gray-50 py-12">
        <div class="container mx-auto px-6">
            <h2 class="section-title">Our Vision</h2>
            <div class="flex flex-wrap items-center">
                <div class="w-full md:w-1/2 px-4 text-center">
                    <img src="images/vision.png" alt="Our Vision" class="rounded shadow-md mx-auto" />
                </div>
                <div class="w-full md:w-1/2 px-4">
                    <p class="text-gray-700 text-lg">
                        We envision a world where no one is left behind—a world where every person has access to essential resources and opportunities to thrive. By promoting kindness, generosity, and collaboration, Helping Hands strives to create a global community driven by empathy and solidarity. Our vision is to inspire a culture of giving, where helping others becomes a shared responsibility.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Our Impact Section -->
    <section class="container mx-auto px-6 py-12">
        <h2 class="section-title">Our Impact</h2>
        <div class="flex justify-center space-x-12">
            <div class="text-center">
                <h3 class="text-3xl font-bold">10,000+</h3>
                <p class="text-gray-600">Lives Touched</p>
            </div>
            <div class="text-center">
                <h3 class="text-3xl font-bold">2,000+</h3>
                <p class="text-gray-600">Volunteers</p>
            </div>
            <div class="text-center">
                <h3 class="text-3xl font-bold">15</h3>
                <p class="text-gray-600">Countries</p>
            </div>
            <div class="text-center">
                <h3 class="text-3xl font-bold">8,000+</h3>
                <p class="text-gray-600">Donations</p>
            </div>
        </div>
    </section>

    <!-- Why Choose Us Section -->
    <section class="bg-gray-50 py-12">
        <div class="container mx-auto px-6">
            <h2 class="section-title">Why Choose Helping Hands?</h2>
            <div class="text-gray-700 text-lg">
                <ul class="list-disc list-inside">
                    <li>We prioritize transparency and accountability in all our operations.</li>
                    <li>We provide direct updates and stories from beneficiaries to donors.</li>
                    <li>Our secure platform ensures safe and seamless transactions.</li>
                    <li>We partner with credible organizations to maximize the impact of every donation.</li>
                    <li>We empower communities by fostering a culture of collaboration and generosity.</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- Quote Section -->
    <div class="quote bg-gray-100 py-12">
        <div class="container mx-auto">
            <p class="text-xl text-gray-800 text-center">
                "The smallest act of kindness is worth more than the grandest intention." – Oscar Wilde
            </p>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="bg-black text-white py-6">
        <div class="container mx-auto text-center">
            <p>&copy; 2024 Helping Hands. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>