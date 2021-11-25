package org.kosta.AeyongTown.service;

import org.kosta.AeyongTown.model.vo.MemberVO;

public interface MemberService {
	public void registerMember(MemberVO memberVO);
	public MemberVO selectMemberInfo(String memberId);
}
