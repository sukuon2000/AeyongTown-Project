package org.kosta.AeyongTown.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.AeyongTown.model.vo.MemberVO;

@Mapper
public interface MapMapper {
	MemberVO selectMemberLocation(String memberId);
	
	void inputUserLocation(String memberId, String code, double lat, double lng, String detail);
	void updateUserLocation(String memberId, String code, double lat, double lng, String detail);
	void deleteUserLocation(String memberId);
	
	void uploadGoodsLocation(String code, double lat, double lng, String detail);
}
