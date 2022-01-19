package org.kosta.AeyongTown.service;

import javax.annotation.Resource;

import org.kosta.AeyongTown.model.mapper.MapMapper;
import org.kosta.AeyongTown.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MapServiceImpl implements MapService {
	
	@Resource
	private MapMapper mapMapper;
	
	@Override
	public MemberVO selectMemberLocation(String memberId) {
		return mapMapper.selectMemberLocation(memberId);
	}
	@Override
	public void inputUserLocation(String memberId, String code, double lat, double lng, String detail) {
		mapMapper.inputUserLocation(memberId, code, lat, lng, detail);
	}

	@Override
	public void updateUserLocation(String memberId, String code, double lat, double lng, String detail) {
		mapMapper.updateUserLocation(memberId, code, lat, lng, detail);
	}
	
	@Override
	public void deleteUserLocation(String memberId) {
		mapMapper.deleteUserLocation(memberId);
	}

}
