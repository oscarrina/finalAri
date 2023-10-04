package com.ari.banner.service;

import java.util.List;

import com.ari.banner.model.BannerDTO;

public interface BannerService {
	
	public int bannerUpload(BannerDTO dto)throws Exception;
	public List<BannerDTO> bannerList()throws Exception;
}
