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
	
	@Test
	public void selectMemberInfo() {
		System.out.println(ms.selectMemberInfo("test2"));
	}
}
