package org.kosta.AeyongTown.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.AeyongTown.model.vo.AuthoritiesVO;
import org.kosta.AeyongTown.model.vo.MemberVO;

@Mapper
public interface MemberMapper {

	// 회원가입
	void registerMember(MemberVO memberVO);
	void registerAddAuthority(String memberId);
	String idCheck(String memberId);
	//회원정보조회
	MemberVO selectMemberInfo(String memberId);
	//아이디 찾기
	String findMemberId(MemberVO memberVO);
	
	//시큐리티 세션 정보 주입
	MemberVO findMemberById(String memberId);
	List<AuthoritiesVO> selectAuthorityById(String memberId);
	
	//사용자 프로필 수정
	void modifyNick(String memberId, String nick);
	void modifyNickAndImg(String memberId, String nick, String imgPath);
}
