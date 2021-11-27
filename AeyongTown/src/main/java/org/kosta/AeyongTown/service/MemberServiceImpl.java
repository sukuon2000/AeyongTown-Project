package org.kosta.AeyongTown.service;

import javax.annotation.Resource;

import org.kosta.AeyongTown.model.mapper.MemberMapper;
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
		String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPassword);
		System.out.println("MemberService : " + memberVO);
		memberMapper.registerMember(memberVO);
		
		//AuthoritiesVO authority = new AuthoritiesVO(memberVO.getMemberId(),"user");
		
	}

	@Override
	public MemberVO selectMemberInfo(String memberId) {
		return memberMapper.selectMemberInfo(memberId);
	}

	@Override
	public String findMemberId(MemberVO memberVO) {
		return memberMapper.findMemberId(memberVO);
	}
}
