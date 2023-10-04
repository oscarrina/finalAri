package com.ari.banner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.banner.model.BannerDTO;
import com.ari.mapper.BannerMapper;

@Service
public class BannerServiceImple implements BannerService {

	@Autowired
	private BannerMapper mapper;
	
	@Override
	public List<BannerDTO> bannerList() throws Exception {
		List<BannerDTO> lists=mapper.bannerList();
		return lists;
		
	}@Override
	public int bannerUpload(BannerDTO dto) throws Exception {
		int result=mapper.bannerUpload(dto);
		return result;
	}
}
