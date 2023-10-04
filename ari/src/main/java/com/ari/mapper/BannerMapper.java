package com.ari.mapper;

import java.util.List;

import com.ari.banner.model.BannerDTO;

public interface BannerMapper {

	public List<BannerDTO> bannerList();
	public int bannerUpload(BannerDTO dto);
}
