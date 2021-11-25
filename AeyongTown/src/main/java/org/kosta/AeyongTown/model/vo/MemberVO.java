package org.kosta.AeyongTown.model.vo;

import java.util.Date;

public class MemberVO {
	private String memberId;
	private String password;
	private String name;
	private String nick;
	private String email;
	private String tel;
	private Date birth;
	private String gender;
	private String status;
	private String imgPath;
	private MapVO mapVO;
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String memberId, String password, String name, String nick, String email, String tel, Date birth,
			String gender, String status, String imgPath, MapVO mapVO) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.name = name;
		this.nick = nick;
		this.email = email;
		this.tel = tel;
		this.birth = birth;
		this.gender = gender;
		this.status = status;
		this.imgPath = imgPath;
		this.mapVO = mapVO;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public MapVO getMapVO() {
		return mapVO;
	}
	public void setMapVO(MapVO mapVO) {
		this.mapVO = mapVO;
	}
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", password=" + password + ", 이름=" + name + ", 닉네임=" + nick
				+ ", 이메일=" + email + ", 전화번호=" + tel + ", 생일=" + birth + ", 성별=" + gender + ", 회원상태=" + status
				+ ", imgPath=" + imgPath + ", mapVO=" + mapVO + "]";
	}
	
	
}

	