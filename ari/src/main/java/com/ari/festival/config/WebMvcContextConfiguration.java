package com.ari.festival.config;

import org.springframework.context.annotation.Configuration;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcContextConfiguration implements WebMvcConfigurer {

	  @Override
	   public void addResourceHandlers(ResourceHandlerRegistry registry) {
	      registry.addResourceHandler("/imgs/**").addResourceLocations("file:///c:/student_java/upload/");
	   }

}
