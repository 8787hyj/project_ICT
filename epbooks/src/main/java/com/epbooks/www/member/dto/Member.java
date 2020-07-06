package com.epbooks.www.member.dto;

import org.springframework.lang.Nullable;

public class Member {
	private String memberid;
	private String password;
	private String name;
	@Nullable
	private String address;
	private String email;
	private String phone;
	private int point;
	private String kakaoid;

	public Member(String memberid, String password, String name, String email, String phone, int point) {
		this.memberid = memberid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.point = 2000; // 멤버객체가 생성될때마다 알아서 2000포인트씩 입력된다.
	}

	public Member(String memberid, String password, String name, String email, String phone, int point,String kakaoid) {
		this.memberid = memberid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.point = 2000; // 멤버객체가 생성될때마다 알아서 2000포인트씩 입력된다.
		this.kakaoid=kakaoid;
	}
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	
	public String getKakaoid() {
		return kakaoid;
	}

	public void setKakaoid(String kakaoid) {
		this.kakaoid = kakaoid;
	}
	
	public boolean matchPassword(String password) { // 로그인시 비밀번호 체크를 하기 위한 메소드
		return this.password.equals(password);
	}

	@Override
	public String toString() {
		return "Member [memberid=" + memberid + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", email=" + email + ", phone=" + phone + ", point=" + point + "]";
	}
	
}
