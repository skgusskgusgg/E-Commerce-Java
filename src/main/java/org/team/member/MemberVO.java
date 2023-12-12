package org.team.member;

import lombok.Data;

@Data
public class MemberVO {
	private Integer id;
	private String user_name;
	private String password;
	private String email;
	private String address;
	private Integer gender;
	private String birth_date;
	private String phone;
	private double point;
	private String join_date;
	private int auth;

}
