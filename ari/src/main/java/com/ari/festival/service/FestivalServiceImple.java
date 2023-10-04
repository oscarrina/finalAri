package com.ari.festival.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.FestivalMapper;

@Service
public class FestivalServiceImple implements FestivalService {

	@Autowired
	private FestivalMapper mapper;
}
