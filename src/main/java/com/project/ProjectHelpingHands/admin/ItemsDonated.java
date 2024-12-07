package com.project.ProjectHelpingHands.admin;

import com.project.ProjectHelpingHands.Donar;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
@Entity
public class ItemsDonated {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String street;
	    private String city;
	    private String state;
	    private String pin;
	    private String phoneNumber;
	    private String email;
	    private String foodItems; // Store selected food items as a comma-separated string
	    private String educationalSupplies;
	    private String clothes;

	    @ManyToOne
	    
	    private Donar donar; // Optional mapping to the user

	    @ManyToOne
	    private DonationDrive drive;
	    
	    private String status; // Add status field

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

	
		public String getPhoneNumber() {
			return phoneNumber;
		}

		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getFoodItems() {
			return foodItems;
		}

		public void setFoodItems(String foodItems) {
			this.foodItems = foodItems;
		}

		public String getEducationalSupplies() {
			return educationalSupplies;
		}

		public void setEducationalSupplies(String educationalSupplies) {
			this.educationalSupplies = educationalSupplies;
		}

		public String getClothes() {
			return clothes;
		}

		public void setClothes(String clothes) {
			this.clothes = clothes;
		}

		public Donar getDonar() {
			return donar;
		}

		public void setDonar(Donar donar) {
			this.donar = donar;
		}

		public DonationDrive getDrive() {
			return drive;
		}

		public void setDrive(DonationDrive drive) {
			this.drive = drive;
		}

		public String getStreet() {
			return street;
		}

		public void setStreet(String street) {
			this.street = street;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getPin() {
			return pin;
		}

		public void setPin(String pin) {
			this.pin = pin;
		}
}
