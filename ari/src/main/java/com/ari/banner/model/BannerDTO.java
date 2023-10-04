package com.ari.banner.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BannerDTO {
	
	private int bannerIdx;
	private String bannerName;
	private String bannerImg;
	
	public BannerDTO(String bannerName, String bannerImg) {
        this.bannerName = bannerName;
        this.bannerImg = bannerImg;
    }
}
