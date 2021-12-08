package org.kosta.AeyongTown.controller;

import org.kosta.AeyongTown.model.vo.MemberVO;
import org.kosta.AeyongTown.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//로그인폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm.tiles";
	}
	
	//회원가입폼
	@RequestMapping("/user/registerForm")
	public String registerForm() {
		return "member/registerForm.tiles";
	}
	
	//이것을 Rest만 쓸 컨트롤러글 생성할 경우 @Controller 어노테이션 대신 @RestController 를 명시하는 방법도 가능
	//@RestController를 명시할 경우 @ResponseBody를 명시하지 않아도 된다
	@RequestMapping(method = RequestMethod.POST, path = "/user/idCheck")
	@ResponseBody
	public String idCheckAjax(String memberId) {
		return memberService.idCheck(memberId);
	}
	
	@RequestMapping(method = RequestMethod.POST, path = "/user/register")
	public String register (MemberVO memberVO) {
		System.out.println("회원가입 정보 : " + memberVO);
		memberService.registerMember(memberVO);
		return "redirect:/user/register-result";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/register-result")
	public String registerResult() {
		return "member/register_result.tiles";
	}
}
