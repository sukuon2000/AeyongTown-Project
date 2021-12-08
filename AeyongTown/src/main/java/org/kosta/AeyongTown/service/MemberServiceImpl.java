package org.kosta.AeyongTown.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.AeyongTown.model.mapper.MemberMapper;
import org.kosta.AeyongTown.model.vo.AuthoritiesVO;
import org.kosta.AeyongTown.model.vo.MemberVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberMapper memberMapper;
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	//회원가입
	@Transactional
	@Override
	public void registerMember(MemberVO memberVO) {
		// 입력받은 패스워드 암호화
		String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPassword);
		System.out.println("회원가입 Service >" + memberVO);
		//회원가입 + 권한부여
		memberMapper.registerMember(memberVO);
		memberMapper.registerAddAuthority(memberVO.getMemberId());
	}

	@Override
	public MemberVO selectMemberInfo(String memberId) {
		return memberMapper.selectMemberInfo(memberId);
	}

	@Override
	public String findMemberId(MemberVO memberVO) {
		return memberMapper.findMemberId(memberVO);
	}
	// 시큐리티에서 쓰는 메서드 (아이디 비밀번호 조회 후 일치 불일치 판별)
	@Override
	public MemberVO findMemberById(String memberId) {
		return memberMapper.findMemberById(memberId);
	}
	// 시큐리티에서 쓰는 메서드 (권한 조회 후 권한이 1개라도 존재하는지 판별)
	@Override
	public List<AuthoritiesVO> selectAuthorityById(String memberId) {
		return memberMapper.selectAuthorityById(memberId);
	}

	@Override
	public String idCheck(String memberId) {
		return memberMapper.idCheck(memberId);
	}
}
