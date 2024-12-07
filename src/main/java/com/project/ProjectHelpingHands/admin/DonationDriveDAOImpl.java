package com.project.ProjectHelpingHands.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Service
public class DonationDriveDAOImpl  implements DonationDriveDAO{
	  @Autowired
	    private DonationDriveRepository repository; 
	  private static final String UPLOAD_DIR = "src/main/webapp/uploads/";
	  
	 public DonationDrive saveDonationDrive(DonationDrive drive, MultipartFile imageFile) {
	        try {
	            // Save image to the file system
	            if (!imageFile.isEmpty()) {
	                // Generate a unique filename
	                String imageFilename = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
	                Path path = Paths.get(UPLOAD_DIR + imageFilename);
	                Files.copy(imageFile.getInputStream(), path);

	                // Save the path to the image
	                drive.setImageFilePath(imageFilename);
	            }

	            // Save the drive to the database
	            return repository.save(drive);  // Make sure repository is correctly injected
	        } catch (IOException e) {
	            e.printStackTrace();
	            return null; // Return null in case of an error
	        }
	    }

	    public List<DonationDrive> getAllDrives() {
	        return repository.findAll();  // Ensure repository is working properly
	    }
	    
	    
	    

	    // Get donation drive by ID
	    public DonationDrive getDriveById(Long id) {
	        Optional<DonationDrive> optionalDrive = repository.findById(id);
	        return optionalDrive.orElse(null);
	    }

	    // Update existing donation drive
	    public DonationDrive updateDonationDrive(Long id, DonationDrive donationDrive, MultipartFile imageFile) {
	        DonationDrive existingDrive = getDriveById(id);
	        if (existingDrive != null) {
	            existingDrive.setEventName(donationDrive.getEventName());
	            existingDrive.setDonationPreferred(donationDrive.getDonationPreferred());
	            existingDrive.setStartDate(donationDrive.getStartDate());
	            existingDrive.setEndDate(donationDrive.getEndDate());
	            existingDrive.setCity(donationDrive.getCity());
	            existingDrive.setStreet(donationDrive.getStreet());
	            existingDrive.setState(donationDrive.getState());
	            existingDrive.setPin(donationDrive.getPin());
	            existingDrive.setDescription(donationDrive.getDescription());

	            // Update image if a new file is provided
	            if (!imageFile.isEmpty()) {
	                String imageFilename = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
	                Path path = Paths.get(UPLOAD_DIR + imageFilename);
	                try {
	                    Files.copy(imageFile.getInputStream(), path);
	                    existingDrive.setImageFilePath(imageFilename);
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }

	            return repository.save(existingDrive);
	        }
	        return null;
	    }

	    // Delete donation drive
	    public void deleteDonationDrive(Long id) {
	        repository.deleteById(id);
	    }
	    
	    @PersistenceContext
	    private EntityManager entityManager;
	    
	    public List<DonationDrive> getDrivesByType(String type) {
	        String query = "SELECT d FROM DonationDrive d WHERE d.type = :type";
	        return entityManager.createQuery(query, DonationDrive.class)
	                .setParameter("type", type)
	                .getResultList();
	    }

	  
	    
}
