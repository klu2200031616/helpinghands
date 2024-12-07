package com.project.ProjectHelpingHands;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DonarRepository  extends JpaRepository<Donar, Long>{
	 Donar findByEmailAndPassword(String email, String password);
	  List<Donar> findByIsAdminFalse();
}
