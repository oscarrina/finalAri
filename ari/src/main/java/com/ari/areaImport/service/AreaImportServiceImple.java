package com.ari.areaImport.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.AreaImportMapper;

@Service
public class AreaImportServiceImple implements AreaImportService {
	@Autowired
	private AreaImportMapper mapper;
	

}
