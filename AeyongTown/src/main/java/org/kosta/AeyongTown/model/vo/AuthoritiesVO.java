package org.kosta.AeyongTown.model.vo;

import java.io.Serializable;

public class AuthoritiesVO implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3928464904307199064L;
	private String memberId;
	private String role;
	public AuthoritiesVO() {	}
	public AuthoritiesVO(String memberId, String role) {
		super();
		this.memberId = memberId;
		this.role = role;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "AuthoritiesVO [memberId=" + memberId + ", role=" + role + "]";
	}
	
	
}
