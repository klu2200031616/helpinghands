package com.project.ProjectHelpingHands;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Donar 
{
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	 	private Long streak = 0L; 

	    private String name;
	    private String email;
	    private String password;
	    private String phoneNumber;
	    private String address;
	    private String donationPreference;
	    
	    private String isAdmin = "false";
	    

	    private String profileImagePath; // New field to store the image path

	    // Getters and setters
	    public String getProfileImagePath() {
	        return profileImagePath;
	    }

	    public void setProfileImagePath(String profileImagePath) {
	        this.profileImagePath = profileImagePath;
	    }
	    
	    
	    public String isAdmin() {
	        return isAdmin;
	    }

	    public void setAdmin(String isAdmin) {
	        this.isAdmin = isAdmin;
	    }
	    
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getPhoneNumber() {
			return phoneNumber;
		}
		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getDonationPreference() {
			return donationPreference;
		}
		public void setDonationPreference(String donationPreference) {
			this.donationPreference = donationPreference;
		}
		

		public Long getStreak() {
			return streak;
		}

		public void setStreak(Long streak) {
			this.streak = streak;
		}

		public void addDonationStreak() {
		    if (this.streak == null) {
		        this.streak = 0L; // Set streak to 0 if null
		    }
		    this.streak += 100; // Increment streak
		}

}
