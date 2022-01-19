package org.kosta.AeyongTown.service;

import java.util.List;

import org.kosta.AeyongTown.model.vo.AuthoritiesVO;
import org.kosta.AeyongTown.model.vo.MemberVO;

public interface MemberService {
	//회원가입
	public void registerMember(MemberVO memberVO);
	//회원정보조회
	public MemberVO selectMemberInfo(String memberId);
	public MemberVO selectMemberInfoInclueMap(String memberId);
	//아이디찾기
	public String findMemberId(MemberVO memberVO);
	
	public MemberVO findMemberById(String memberId);
	List<AuthoritiesVO> selectAuthorityById(String memberId);
	
	public String idCheck(String memberId);
}
