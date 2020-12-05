package com.hhd.spring.jdbc;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;


@Service("crudService")
public class CommonSpringCrudService {
	
	private static SimpleDateFormat sdf =new SimpleDateFormat();
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public String getDbTime(String pattern){
		sdf.applyPattern(pattern);
		Date dbDate=jdbcTemplate.queryForObject(" select getdate() ", Date.class);
		return sdf.format(dbDate);
	}
	

}
