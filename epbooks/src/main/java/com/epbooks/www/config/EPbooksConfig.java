package com.epbooks.www.config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class EPbooksConfig {
	@Autowired
	DataSource dataSource;
	
}
