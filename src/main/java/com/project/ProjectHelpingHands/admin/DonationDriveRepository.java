package com.project.ProjectHelpingHands.admin;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DonationDriveRepository extends JpaRepository<DonationDrive, Long> {

	List<DonationDrive> findByType(String type);
	
}