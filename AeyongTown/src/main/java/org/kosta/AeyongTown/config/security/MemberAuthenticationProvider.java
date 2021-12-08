package org.kosta.AeyongTown.config.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.AeyongTown.model.vo.AuthoritiesVO;
import org.kosta.AeyongTown.model.vo.MemberVO;
import org.kosta.AeyongTown.service.MemberService;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
@Component
public class MemberAuthenticationProvider implements AuthenticationProvider {
	@Resource
	private MemberService memberService;
	@Resource 
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		if(!supports(authentication.getClass())) {
			return null;
		}
		String memberId = authentication.getName();
		MemberVO member = memberService.findMemberById(memberId);
		String password=(String)authentication.getCredentials();
		// 아이디 조회 후 null이거나 아이디가 조회되어도 비밀번호가 맞지 않는경우
		if(member == null || !passwordEncoder.matches(password, member.getPassword())) {
			throw new BadCredentialsException("회원 정보가 일치하지 않습니다. 다시한번 확인해주세요");
		}
		// 아이디와 비밀번호가 일치하나 아무런 권한이 없을 때
		List<AuthoritiesVO> list = memberService.selectAuthorityById(memberId);
		if(list.size() == 0) {
			throw new UsernameNotFoundException("아무 권한이 없습니다");
		}
		// 권한이 존재하면 SimpleGrantedAuthority에 넣음 (권한을 객체에 리스트형식으로 저장)
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		for(AuthoritiesVO au : list) {
			authorities.add(new SimpleGrantedAuthority(au.getAuthority()));
		}
		// UsernamePasswordAuthenticationToken 발급 후 리턴 (이곳에 아이디, 패스워드, 권한 정보가 들어감)
		// 인증 관리자 역할
		Authentication auth = new UsernamePasswordAuthenticationToken(member, password, authorities);
		return auth;
	}
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}
