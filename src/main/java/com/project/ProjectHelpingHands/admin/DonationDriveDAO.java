package com.project.ProjectHelpingHands.admin;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface DonationDriveDAO {
	 public DonationDrive saveDonationDrive(DonationDrive drive, MultipartFile imageFile);
	 public List<DonationDrive> getAllDrives();
	  public List<DonationDrive> getDrivesByType(String type);
//	  // Method to get a DonationDrive by ID
//	    public DonationDrive getDriveById(Long driveId);
}
