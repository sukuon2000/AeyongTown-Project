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
	@Test
	public void idCheckTest() {
		String memberId = "test2";
		System.out.println("<idCheck Test> memberId : " + ms.idCheck(memberId));
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
}

