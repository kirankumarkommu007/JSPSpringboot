package com.example.demo;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Students {

	 @Id
	 public Integer id;
	 
	 public String name;
	 
	 public String subject;
	 
}
