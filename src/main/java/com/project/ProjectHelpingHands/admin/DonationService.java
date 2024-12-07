package com.project.ProjectHelpingHands.admin;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ProjectHelpingHands.Donar;

@Service
public class DonationService {

    @Autowired
    private ItemsDonatedRepository itemsDonatedRepository;

    @Autowired
    private DonationDriveRepository donationDriveRepository;

    public void saveDonation(ItemsDonated item, Long driveId, Donar donar) {
        DonationDrive drive = donationDriveRepository.findById(driveId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Drive ID"));

        item.setDrive(drive); // Set the drive object for the donation
        if (donar != null) {
            item.setDonar(donar); // Set the donor if they are logged in
        }

        itemsDonatedRepository.save(item); // Save the item donated to the repository
    }
    
    
    public List<ItemsDonated> getAllPickups() {
        return itemsDonatedRepository.findAll();
    }

    public List<ItemsDonated> getPickupDetailsByDonor(Long donarId) {
        return itemsDonatedRepository.findByDonarId(donarId);
    }

    public ItemsDonated findPickupById(Long pickupId) {
        return itemsDonatedRepository.findById(pickupId)
                .orElseThrow(() -> new RuntimeException("Pickup not found with id: " + pickupId));
    }
    
    
    public void save(ItemsDonated pickup) {
    	itemsDonatedRepository.save(pickup);
    }
    
    
    public boolean cancelPickup(Long pickupId) {
        try {
            ItemsDonated pickup = itemsDonatedRepository.findById(pickupId)
                .orElseThrow(() -> new RuntimeException("Pickup not found"));
            pickup.setStatus("Cancelled");
            itemsDonatedRepository.save(pickup);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
   
}