package org.kosta.AeyongTown.model.vo;

import java.io.Serializable;

public class AuthoritiesVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8994800699846114647L;
	private String memberId;
	private String authority;
	public AuthoritiesVO() {	}
	public AuthoritiesVO(String memberId, String authority) {
		super();
		this.memberId = memberId;
		this.authority = authority;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "AuthoritiesVO [memberId=" + memberId + ", authority=" + authority + "]";
	}
	
}
