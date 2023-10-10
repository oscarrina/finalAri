package com.ari.like.model;

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
public class LikeDTO {

	private int idx;
	private int likeType;
	private String userId;
	private String likeYN;
	private String img;
}
