package org.kosta.AeyongTown.service;

import org.kosta.AeyongTown.model.vo.MemberVO;

public interface MapService {
	public MemberVO selectMemberLocation(String memberId);
	public void inputUserLocation(String memberId, String code, double lat, double lng, String detail);
	public void updateUserLocation(String memberId, String code, double lat, double lng, String detail);
	public void deleteUserLocation(String memberId);
}
