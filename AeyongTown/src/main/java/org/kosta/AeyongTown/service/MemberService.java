package org.kosta.AeyongTown.service;

import org.kosta.AeyongTown.model.vo.MemberVO;

public interface MemberService {
	//회원가입
	public void registerMember(MemberVO memberVO);
	//회원정보조회
	public MemberVO selectMemberInfo(String memberId);
	//아이디찾기
	public String findMemberId(MemberVO memberVO);
}
