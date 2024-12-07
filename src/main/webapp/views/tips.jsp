<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Emergency Safety Tips</title>
    <style>
    /* Container styling */
.tips-container {
  font-family: Arial, sans-serif;
  padding: 20px;
  background-color: #f7f7f7;
}

/* Title styling */
.title {
  text-align: center;
  color: hotpink;
  margin-bottom: 20px;
}

/* Section styling */
.section {
  margin-bottom: 30px;
}

.section-title {
  text-align: center;
  color: green;
  margin-bottom: 15px;
}

/* Row styling */
.row {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  gap: 20px; /* Horizontal and vertical gap between columns */
}

/* Column styling */
.column {
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); /* Slightly stronger shadow for style */
  padding: 20px;
  text-align: center;
  flex: 1;
  max-width: 30%;
  min-width: 250px;
  margin-bottom: 20px; /* Vertical gap between rows */
  transition: transform 0.3s, box-shadow 0.3s; /* Smooth hover effect */
}

.column:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
}

/* Image styling */
.image {
  width: 100%; /* Ensures the image takes the full width of the container */
  height: 200px; /* Fixed height to maintain uniformity */
  object-fit: cover; /* Ensures the image maintains its aspect ratio and covers the entire area */
  border-radius: 8px;
  margin-bottom: 10px;
}

/* Heading styling */
h3 {
  color: hotpink;
  margin-bottom: 8px;
  font-size: 1.2rem;
}

/* Paragraph styling */
p {
  color: #333;
  font-size: 0.95rem;
  line-height: 1.5;
}
    
    </style>
</head>
<body>
    <div class="tips-container">
        <h1 class="title">Emergency Safety Tips</h1>

        <!-- Section 1: Precautions and Safety Tips -->
        <div class="section">
            <h2 class="section-title">Precautions & Safety Tips</h2>
            <div class="row">
                <div class="column">
                    <img src="images/tsunami.jpg" alt="Tsunami" class="image" />
                    <h3>Tsunami</h3>
                    <p>Move to higher ground immediately. Stay away from the coast and don't return until officials say it is safe.</p>
                </div>
                <div class="column">
                    <img src="images/floods.jpg" alt="Floods" class="image" />
                    <h3>Floods</h3>
                    <p>Avoid walking or driving through flood waters. Move to higher ground and listen to local alerts.</p>
                </div>
                <div class="column">
                    <img src="https://www.earthquakecountry.org/library/Drop_Cover_Hold_On_ENG_Blue_Orange_RGB.png" alt="Earthquake" class="image" />
                    <h3>Earthquake</h3>
                    <p>Drop, cover, and hold on. Stay indoors until the shaking stops. Avoid windows and heavy furniture.</p>
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <img src="images/cyclone.jpg" alt="Cyclone" class="image" />
                    <h3>Cyclone</h3>
                    <p>Secure outdoor items, stay indoors in a windowless room, and avoid low-lying areas to prevent storm surge impact.</p>
                </div>
                <div class="column">
                    <img src="images/wildfire.jpg" alt="Wildfire" class="image" />
                    <h3>Wildfire</h3>
                    <p>Evacuate if advised, close all windows, and turn on all lights to make your home more visible in heavy smoke.</p>
                </div>
                <div class="column">
                    <img src="images/slide.jpg" alt="Landslide" class="image" />
                    <h3>Landslide</h3>
                    <p>Move away from landslide-prone areas, avoid river valleys, and stay alert to unusual sounds like trees cracking.</p>
                </div>
            </div>
        </div>

        <!-- Section 2: First Aid During Emergencies -->
        <div class="section">
            <h2 class="section-title">First Aid Tips</h2>
            <div class="row">
                <div class="column">
                    <img src="images/bloodTip.png" alt="Bleeding" class="image" />
                    <h3>Bleeding</h3>
                    <p>Apply pressure to stop bleeding. Use a clean cloth and elevate the injury above the heart level if possible.</p>
                </div>
                <div class="column">
                    <img src="images/burn.png" alt="Burns" class="image" />
                    <h3>Burns</h3>
                    <p>Cool the burn under running water for at least 10 minutes. Do not apply ice. Cover with a sterile bandage.</p>
                </div>
                <div class="column">
                    <img src="images/cpr.png" alt="CPR" class="image" />
                    <h3>CPR</h3>
                    <p>For unresponsive victims, perform chest compressions at 100-120 compressions per minute until help arrives.</p>
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <img src="images/fracture.png" alt="Fracture" class="image" />
                    <h3>Fracture</h3>
                    <p>Immobilize the affected area, keep it still, and avoid moving the person. Seek medical help immediately.</p>
                </div>
                <div class="column">
                    <img src="images/choking.jpg" alt="Choking" class="image" />
                    <h3>Choking</h3>
                    <p>Perform the Heimlich maneuver by giving quick abdominal thrusts to expel the object causing the blockage.</p>
                </div>
                <div class="column">
                    <img src="images/poisoning.jpg" alt="Poisoning" class="image" />
                    <h3>Poisoning</h3>
                    <p>Do not induce vomiting. Call emergency services and provide details about the substance ingested if possible.</p>
                </div>
            </div>
        </div>

        <!-- Section 3: Helpline Numbers -->
        <div class="section">
            <h2 class="section-title">Helpline Numbers</h2>
            <div class="row">
                <div class="column">
                    <h3>National Emergency</h3>
                    <p>112</p>
                </div>
                <div class="column">
                    <h3>Fire Service</h3>
                    <p>101</p>
                </div>
                <div class="column">
                    <h3>Ambulance</h3>
                    <p>102/108</p>
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <h3>Disaster Management</h3>
                    <p>108</p>
                </div>
                <div class="column">
                    <h3>Police</h3>
                    <p>100</p>
                </div>
                <div class="column">
                    <h3>Women Helpline</h3>
                    <p>181</p>
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <h3>Child Helpline</h3>
                    <p>1098</p>
                </div>
                <div class="column">
                    <h3>Senior Citizen Helpline</h3>
                    <p>14567</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>