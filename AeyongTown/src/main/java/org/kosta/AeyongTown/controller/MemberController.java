package org.kosta.AeyongTown.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.kosta.AeyongTown.model.mapper.MemberMapper;
import org.kosta.AeyongTown.model.vo.MapVO;
import org.kosta.AeyongTown.model.vo.MemberVO;
import org.kosta.AeyongTown.service.MapService;
import org.kosta.AeyongTown.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private MapService mapService;

	
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
	
	@RequestMapping(method = RequestMethod.GET, value = "/user/my-info")
	public String myInfo(Model model) {
		MemberVO sessionMvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = sessionMvo.getMemberId();
		//세션에는 비밀번호까지 담겨있기 때문에 비밀 번호를 뺀 쿼리문을 돌린다
			MemberVO mvo = memberService.selectMemberInfoInclueMap(memberId);
			// 전화번호			
			StringBuilder tel = new StringBuilder();
			tel.append(mvo.getTel().substring(0, 2)).append("*-")
				.append(mvo.getTel().substring(3, 5)).append("**-")
				.append(mvo.getTel().substring(7, 9)).append("**");
			 	
			//이메일
			StringBuilder email = new StringBuilder();
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
			email.append(Id1)
					.append(starId)
					.append("@")
					.append(addr1)
					.append(starAddr)
					.append(domain);
			mvo.setTel(tel.toString());
			mvo.setEmail(email.toString());
		
		model.addAttribute("mvo", mvo);
		return "member/member_info.tiles";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/user/modifyForm")
	public String modifyMyProfileForm(Model model) {
		MemberVO sessionMvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//세션에는 비밀번호까지 담겨있기 때문에 비밀 번호를 뺀 쿼리문을 돌린다
		String memberId = sessionMvo.getMemberId();
		MemberVO mvo = memberService.selectMemberInfo(memberId);
		model.addAttribute("mvo", mvo);
		return "member/modify_member_profile.tiles";
	}
	
	@RequestMapping(value = "/user/modify")
	public String modifyMyProfile(
			@RequestParam("profileImg") MultipartFile profileImg,
			@RequestParam("nick") String nick,
			HttpServletRequest request) throws IllegalStateException, IOException {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = mvo.getMemberId();
		
		//파일 업로드 한 것이 없을 경우 (닉네임만 수정)
		if(profileImg.isEmpty() && (nick==null || nick=="")) {
			return "redirect:/user/modifyFail";
		} else if(profileImg.isEmpty()) {
			memberMapper.modifyNick(memberId, nick);
			return "redirect:/user/modifySuccess";
		} else {
			// 파일이 저장될 경로
			String filePath = request.getServletContext().getRealPath("profile/");
			// 선택한 원래 파일명
			String originalFile = profileImg.getOriginalFilename();
			//파일명에서 확장자만 추출 (png, jpeg 등등)
			String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
			//저장될 파일명
			String beSavedFileName = UUID.randomUUID() + originalFileExtension;
			
			//파일 저장
			File file = new File(filePath + beSavedFileName);
			profileImg.transferTo(file);
			memberMapper.modifyNickAndImg(memberId, nick, beSavedFileName);
			return "redirect:/user/modifySuccess";
		}
	}
	
	@RequestMapping("/user/modifySuccess")
	public String modifyResult_Success() {
		return "member/modify_success";
	}
	
	@RequestMapping("/user/modifyFail")
	public String modifyResult_Fail() {
		System.out.println("[error] 잘못된 경로로 접근한 회원이 존재합니다");
		return "auth/accessDeniedView";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("/user/map/inputForm")
	public String inputLocationForm() {
		return "map/input_location_member.tiles";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("/user/map/modifyForm")
	public String modifyLocationForm(Model model) {
		MemberVO sessionMvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = sessionMvo.getMemberId();
		MemberVO mvo = new MemberVO();
		mvo = mapService.selectMemberLocation(memberId);
		model.addAttribute("mvo", mvo);
		return "map/modify_location_member.tiles";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/user/map/input")
	public String inputUserLocation(MapVO mapVO) {
		System.out.println("[회원 지도 정보] 지도 정보 삽입 시작");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = mvo.getMemberId();
		
		System.out.println("[회원 지도 정보] 삽입 데이터 ID =" + memberId + ", " +  mapVO);
		mapService.inputUserLocation(memberId, mapVO.getCode(), mapVO.getLat(), mapVO.getLng(), mapVO.getDetail());
		
		System.out.println("[회원 지도 정보] 지도 정보 삽입 완료");
		return "redirect:/user/my-info";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/user/map/update")
	public String updateUserLocation(MapVO mapVO) {
		System.out.println("[회원 지도 정보] 지도 정보 수정 시작");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = mvo.getMemberId();
		
		System.out.println("[회원 지도 정보] 삽입 데이터 ID =" + memberId + ", " +  mapVO);
		System.out.println("detail : " + mapVO.getDetail().equals(""));
		mapService.updateUserLocation(memberId, mapVO.getCode(), mapVO.getLat(), mapVO.getLng(), mapVO.getDetail());
		
		System.out.println("[회원 지도 정보] 지도 정보 수정 완료");
		return "redirect:/user/my-info";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/user/map/delete")
	public String deleteUserLocation() {
		System.out.println("[회원 지도 정보] 지도 정보 삭제 시작");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = mvo.getMemberId();
		
		mapService.deleteUserLocation(memberId);
		System.out.println("[회원 지도 정보] 지도 정보 삭제 완료");
		return "redirect:/user/my-info";
	}
}
