package com.project.ProjectHelpingHands;

import java.util.List;

public interface DonarDAO
{
	public String insertDonar(Donar d);
	public boolean validateDonar(String email, String password);
	 public Donar authenticateUser(String email, String password);
	  public List<Donar> getAllNonAdminUsers();
	  
}
