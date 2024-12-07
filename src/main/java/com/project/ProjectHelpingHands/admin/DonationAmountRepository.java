package com.project.ProjectHelpingHands.admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DonationAmountRepository extends JpaRepository<DonationAmount, Long> {

    // Query method to find DonationAmount by DonationDrive ID
    DonationAmount findByDonationDriveId(Long driveId);
}