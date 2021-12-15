package org.kosta.AeyongTown.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

// Spring Framework는 전역 에러를 처리하기 위해 아래의 인터페이스를 제공한다
/*												Interface
 * 		servlet (webmvc)		||		HandlerExceptionResolver
 * 		reactive(webflux)		||		WebExceptionHandler
 */
@Controller
@ControllerAdvice	
// 모든 Controller에 대해 발생한 전역 에러에 대해 처리하는 
//@ExceptionHandler는 @ControllerAdvice와 같이 사용하면 됨
public class ExceptionController {

	@ExceptionHandler
	public String ClassCastExceptionHandler(ClassCastException e) {
		return "auth/accessDeniedView";
	}
// 참고 사이트 : https://luvstudy.tistory.com/74
}
