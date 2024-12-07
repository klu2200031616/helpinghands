<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Home</title>
 <script src="https://cdn.tailwindcss.com">
  </script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
<style>

.text-image-section {
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
    align-items: center;
    gap: 20px;
    padding: 40px;
    background-color: lightblue;
}

.text-container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.image-container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.image-container img {
    max-width: 100%;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}
.text-container.left-text h2 {
    font-size: 22px;
    color: #2c3e50;
    margin-bottom: 10px;
    font-weight: bold;
    transition: color 0.3s ease;
}

.text-container.left-text p {
    font-size: 16px;
    color: #7f8c8d;
    margin-bottom: 20px;
    line-height: 1.6;
    transition: color 0.3s ease;
}

.text-container.left-text:hover h2 {
    color: #27ae60; /* Change text color on hover */
}

.text-container.left-text:hover p {
    color: #2c3e50; /* Change paragraph color on hover */
}

.know-more-button {
    background-color: #27ae60;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
}

.know-more-button:hover {
    background-color: #1e8449;
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Adding a subtle shadow on hover */
}

.know-more-button:active {
    transform: scale(0.95);
}



.text-container.right-text h2 {
    font-size: 22px;
    color: #2c3e50;
    margin-bottom: 10px;
    font-style: italic;
    font-weight: 500;
    transition: color 0.3s ease, transform 0.3s ease;
}

.text-container.right-text p {
    font-size: 16px;
    color: #7f8c8d;
    margin-bottom: 20px;
    transition: color 0.3s ease, transform 0.3s ease;
}

.text-container.right-text:hover h2 {
    color: #e74c3c; /* Change heading color on hover */
    transform: translateX(5px); /* Slight horizontal shift on hover */
}

.text-container.right-text:hover p {
    color: #2c3e50; /* Change paragraph color on hover */
    transform: translateY(3px); /* Slight vertical shift on hover */
}

.donate-button {
    background-color: #e74c3c;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
}

.donate-button:hover {
    background-color: #c0392b;
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Adding a subtle shadow on hover */
}

.donate-button:active {
    transform: scale(0.95);
}




  .card-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 40px auto;
            gap: 20px;
        }

        .motto-card {
            background-color: #f4f4f4;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            width: 300px;
            margin: 0 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
             align-items: center;
            justify-content: space-between;
        }

        .large-card {
            height: 500px; /* Height of the center card */
        }

        .small-card {
            height: 300px; /* Height of the smaller cards */
        }

.motto-card img {
            width: 120px;
            height: 120px;
            border-radius: 50%; /* Circular image */
            object-fit: cover;
            margin-bottom: 20px;
        }



.motto-card p {
    font-size: 16px;
    color: #7f8c8d;
    margin-bottom: 20px;
    line-height: 1.6;
}

.motto-card button {
    background-color: hotpink;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.motto-card button:hover {
    background-color: #c0392b;
    transform: scale(1.05);
}

.motto-card button:active {
    transform: scale(0.95);
}

.motto-card.large-card {
    flex: 2;
    max-width: 600px;
    background-color: #f9f9f9;
    padding: 30px;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
}

.motto-card.large-card h2 {
    font-size: 24px;
    font-weight: bold;
    color: #2c3e50;
    margin-bottom: 15px;
}

.card-container:hover .motto-card {
    transform: translateY(-5px); /* Slightly lift the card on hover */
}





h2 {
    font-size: 24px;
    color: #333;
}

p {
    font-size: 16px;
    color: #666;
    line-height: 1.6;
}
</style>
</head>
<body>
<jsp:include page="donarnav.jsp" />
<section class="text-image-section">
    <div class="text-container left-text">
    <h2>About Helping Hands</h2>
    <p>Helping Hands is dedicated to supporting communities in need. Together, we strive to make the world a better place by providing care, resources, and hope to those who need it most.</p>
    <a href="/aboutus">
  <button class="know-more-button">Know More</button>
</a>

</div>

    <div class="image-container">
        <img src="images/donarhomemain.png" alt="Placeholder Image">
    </div>
   <div class="text-container right-text">
    <h2>"Making a difference, one step at a time"</h2>
    <p>Your support can bring light to someone's life. Join us in making the world a better place.</p>
     <a href="/donation/listDonations">
    <button class="donate-button">Donate Now</button>
    </a>
</div>

</section>

<div class="text-center py-12">
   <h2 class="text-2xl font-bold">
    Our process
   </h2>
   <p class="text-gray-600 mt-4">
    At Helping Hands, we make it easy for you to make a difference. Here's how our process works:
   </p>
   <div class="flex justify-center mt-8 space-x-8">
    <div class="text-center">
     <i class="fas fa-hand-holding-heart text-4xl text-yellow-500">
     </i>
     <h3 class="text-xl font-bold mt-2">
      Identify Needs
     </h3>
    </div>
    <div class="text-center">
     <i class="fas fa-donate text-4xl text-yellow-500">
     </i>
     <h3 class="text-xl font-bold mt-2">
      Collect Donations
     </h3>
    </div>
    <div class="text-center">
     <i class="fas fa-hands-helping text-4xl text-yellow-500">
     </i>
     <h3 class="text-xl font-bold mt-2">
      Distribute Aid
     </h3>
    </div>
    <div class="text-center">
     <i class="fas fa-smile text-4xl text-yellow-500">
     </i>
     <h3 class="text-xl font-bold mt-2">
      Share Impact
     </h3>
    </div>
   </div>
  </div>



<div class="card-container">
    <!-- Left Small Card -->
    <div class="motto-card small-card">
        <img src="images/logo.png" alt="Helping Hands">
        <p>
            "Your small act of kindness can create a ripple of hope in a world that needs it most."
        </p>
       <a href="/donation/listDonations">
    <button class="donate-button">Donate Now</button>
    </a>
    </div>

    <!-- Center Large Card -->
    <div class="motto-card large-card">
        <h2>How You Can Help</h2>
        <img src="images/logo.png" alt="Helping Hands Logo">
        <p>
            "By donating today, you help us provide emergency relief, medical aid, and long-term recovery to those in need. Your support will help save lives and rebuild communities affected by disasters."
        </p>
       <a href="/donation/listDonations">
    <button class="donate-button">Donate Now</button>
    </a>
    </div>

    <!-- Right Small Card -->
    <div class="motto-card small-card">
        <img src="images/logo.png" alt="Helping Hands">
        <p>
            "Together, we can make a difference. Every contribution brings us closer to a brighter tomorrow."
        </p>
        <a href="/donation/listDonations">
    <button class="donate-button">Donate Now</button>
    </a>
    </div>
</div>



</body>
</html>