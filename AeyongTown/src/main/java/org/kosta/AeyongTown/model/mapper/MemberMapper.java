package org.kosta.AeyongTown.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.AeyongTown.model.vo.MemberVO;

@Mapper
public interface MemberMapper {

	// 회원가입
	void registerMember(MemberVO memberVO);
	//회원정보조회
	MemberVO selectMemberInfo(String memberId);
	//아이디 찾기
	String findMemberId(MemberVO memberVO);
}
