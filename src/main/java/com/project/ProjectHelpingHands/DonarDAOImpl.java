package com.project.ProjectHelpingHands;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class DonarDAOImpl implements DonarDAO {
	@Autowired
	private DonarRepository dr;

	@Override
	public String insertDonar(Donar d) {
		
		dr.save(d);
		return "inserted";
	}
	public boolean validateDonar(String email, String password) {
        Donar donar = dr.findByEmailAndPassword(email, password);
        return donar != null;
    }
	  public Donar authenticateUser(String email, String password) {
	        // Replace this with your actual authentication logic
	        // For example, checking the email and password in a database
	        Donar donar = dr.findByEmailAndPassword(email, password);

	        if (donar != null && donar.getPassword().equals(password)) {
	            return donar; // return the Donar object if valid
	        }
	        return null; // return null if invalid
	    }
	  
	  
	  
	  
	  public List<Donar> getAllNonAdminUsers() {
		  List<Donar> users = dr.findByIsAdminFalse();
		   
		    return users;
	    }
	  
	  public void updateDonorStreak(Donar donar) {
		    if (donar.getStreak() == null) {
		        donar.setStreak(0L); // Set streak to 0 if null
		    }
		    donar.addDonationStreak(); // Increment the streak
		    dr.save(donar); // Save the updated Donar object
		}
	  

}
