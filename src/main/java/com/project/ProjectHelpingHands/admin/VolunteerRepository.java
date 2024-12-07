package com.project.ProjectHelpingHands.admin;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.ProjectHelpingHands.Donar;

import jakarta.persistence.Tuple;

import java.util.List;
import java.util.Optional;

public interface VolunteerRepository extends JpaRepository<Volunteer, Long> {

	 @Query("SELECT v FROM Volunteer v WHERE v.user = :user")
	    List<Volunteer> findByUser(@Param("user") Donar user);
	
}
