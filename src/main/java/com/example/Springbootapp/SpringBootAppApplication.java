package com.example.Springbootapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@RestController
public class SpringBootAppApplication {

	@RequestMapping("/")
	public String home() {
        return "Hello Kubernetes!";
    }

    public static void main(String[] args) {
       	 SpringApplication.run(SpringBootAppApplication.class, args);
    }

}
