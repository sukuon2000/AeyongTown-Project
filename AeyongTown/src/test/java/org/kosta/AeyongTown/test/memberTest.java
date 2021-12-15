package org.kosta.AeyongTown.test;

import org.junit.jupiter.api.Test;
import org.kosta.AeyongTown.model.mapper.MemberMapper;
import org.kosta.AeyongTown.model.vo.MemberVO;
import org.kosta.AeyongTown.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class memberTest {
	
	@Autowired
	MemberMapper mm;
	@Autowired
	MemberService ms;
	
	//회원가입
	//@Test
	public void registerMemberTest() {
		MemberVO a = new MemberVO();
		a.setMemberId("test2");
		a.setPassword("1234");
		a.setName("테스트");
		a.setNick("test중");
		a.setTel("01012345678");
		a.setBirth("20000101");
		a.setEmail("test@gmail.com");
		a.setGender("남성");
		System.out.println(a);
		ms.registerMember(a);
	}
	//회원 아이디가 존재하는지 중복체크
	//@Test
	public void idCheckTest() {
		String memberId = "test2";
		if(ms.idCheck(memberId).equals("1")) {
			System.out.println("Exist");
		} else {
			System.out.println("Not Exist");
		}
	}
	
	//회원정보조회
	//@Test
	public void selectMemberInfo() {
		System.out.println(ms.selectMemberInfo("test2"));
	}
	//아이디찾기
	//@Test
	public void findMemberId() {
		MemberVO memberVO = new MemberVO();
		memberVO.setName("테스트");
		memberVO.setBirth("20000101");
		memberVO.setEmail("test@gmail.com");
		
		if(ms.findMemberId(memberVO) != null) {
			System.out.println("찾으시는 아이디는 <" + ms.findMemberId(memberVO) + "> 입니다.");
		} else {
			System.out.println("해당 정보의 아이디가 존재하지 않습니다. 다시 한번 확인해주세요.");
		}
		
	}
	//@Test
	public void findMemberTest() {
		String memberId = "test2";
		System.out.println(ms.findMemberById(memberId));
		System.out.println(ms.selectAuthorityById(memberId));
	}
	
	@Test
	public void memberInfoTest() {
		String id = "testtest";
		MemberVO mvo = mm.findMemberById(id);
		System.out.println(mvo);
		
		// 전화번호
		StringBuilder sbTel = new StringBuilder();
		sbTel.append(mvo.getTel().substring(0, 2)).append("*")
			.append("-")
			.append(mvo.getTel().substring(3, 5)).append("**")
			.append("-")
			.append(mvo.getTel().substring(7, 9)).append("**");
		
		//이메일
		StringBuilder sbEmail = new StringBuilder();
		int at = mvo.getEmail().indexOf("@");
		int dot = mvo.getEmail().indexOf(".");
		
		// ID 앞의 문자 2자
		String Id1 = mvo.getEmail().substring(0, 2);
		// 뒤의 나머지 ID 문자열
		String Id2 = mvo.getEmail().substring(2, at);
		// 뒤의 나머지 ID 문자열 *로 치환
		StringBuilder starId  = new StringBuilder();
		for(int i=0; i < Id2.length(); i++) {
			starId.append("*");
		}
		
		// 도메인 앞 1자
		String addr1 = mvo.getEmail().substring(at + 1, at + 2);
		// 도메인 앞 1자를 제외한 나머지
		String addr2 = mvo.getEmail().substring(at + 2, dot);
		// 도메인 앞 1자를 제외한 나머지 *로 치환
		StringBuilder starAddr = new StringBuilder();
		for(int i=0; i < addr2.length(); i++) {
			starAddr.append("*");
		}
		String domain = mvo.getEmail().substring(dot);
		sbEmail.append(Id1)
				.append(starId)
				.append("@")
				.append(addr1)
				.append(starAddr)
				.append(domain);
		System.out.println("이메일 : " + sbEmail);
		mvo.setTel(sbTel.toString());
		mvo.setEmail(sbEmail.toString());
		System.out.println(mvo);
	}
}

