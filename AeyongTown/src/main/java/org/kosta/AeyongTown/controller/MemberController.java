package org.kosta.AeyongTown.controller;

import org.kosta.AeyongTown.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/user")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//로그인폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm.tiles";
	}
	
	//회원가입폼
	@RequestMapping("/registerForm")
	public String registerForm() {
		return "member/registerForm.tiles";
	}
	
	//이것을 컨트롤러를 만든다음 컨트롤러 클래스 위에 @RestController 를 명시하는 방법도 가능
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheckAjax(String memberId) {
		return memberService.idCheck(memberId);
	}
}
