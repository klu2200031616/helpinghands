package com.project.ProjectHelpingHands.admin;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.ProjectHelpingHands.Donar;

public interface ItemsDonatedRepository extends JpaRepository<ItemsDonated, Long> {
	
	 List<ItemsDonated> findByDonarId(Long donarId); 
}