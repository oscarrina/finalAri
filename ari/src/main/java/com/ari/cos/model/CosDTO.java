package com.ari.cos.model;

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
public class CosDTO {

	private int idx;
	private int cosArea;
	private String cosTitle;
	private int cosLike;
	private int cosRead;
	private String cosImg;
	private String cosContent;
}
