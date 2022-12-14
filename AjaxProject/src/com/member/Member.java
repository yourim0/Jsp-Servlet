package com.member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //기본생성자
@AllArgsConstructor
public class Member {
	private String userid;
	private String userpwd;
}
