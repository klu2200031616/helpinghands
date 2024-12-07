package com.project.ProjectHelpingHands;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = "com.project")

@EnableJpaRepositories(basePackages = "com.project.ProjectHelpingHands")
public class ProjectHelpingHandsApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectHelpingHandsApplication.class, args);
		System.out.println("Hello");
	}

}
