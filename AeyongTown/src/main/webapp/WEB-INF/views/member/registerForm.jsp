<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
 <script  type="text/javascript">
 alert("이미 로그인 되어 있어 회원가입 폼에 접근하실 수 없습니다");
 location.href="${pageContext.request.contextPath}/home";
 </script>
 </sec:authorize>

<script type="text/javascript">
//아이디 검증 정규식
var userIdCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
//비밀번호 검증 정규식
var userPasswordCheck =  /^[A-Za-z0-9]{8,12}$/;

// 회원가입 버튼 눌렀을 때 다시 검증
$(document).ready(function(){
	let checkResultId="";	
	$("#regForm").submit(function(){
		if(checkResultId==""){
			alert("아이디 중복확인을 하세요");
			return false;
		} else if(!userPasswordCheck.test($("#password").val()) || $("#password").val()!=$("#password2").val()) {
            alert("사용할 수 없는 비밀번호입니다! 다시 한번 확인해 주세요");
            return false;
        };
	}); // submit
//아이디 검증
//spring security 적용시 ajax post 방식은 아래와 같이 beforeSend property에서 csrf 값을 셋팅해야 함 
	$("#idCheck").click(function() {
		let memberId=$("#memberId").val();
		
		// 아이디 생성시 영문자로 시작하고 소문자+숫자로만 6~20자

		if(memberId=="" || memberId==null) {
			alert("아이디를 입력하세요");
			return;
		} else if(userIdCheck.test(memberId)==false) {
			alert("아이디는 영문자(소문자)로만 혹은 영어(소문자) + 숫자로 6~20자 이내에서만 생성할 수 있습니다");
			return;
		}
		/*Spring Security 적용 이후에는 Ajax post 방식을 이용할 때 
		데이터를 전송하기 전에 헤더에 csrf값을 설정한다(보안대책으로 필수적으로 요구)*/
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/user/idCheck",
			dataType: 'json',
			data: {"memberId":memberId},
			beforeSend : function(xhr){   
		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    		},
			success:function(data){
				if(data==1) {
					$("#idCheckView").text("이미 사용하는 유저가 있습니다!").css({background :"red", color:"white", padding:"8px 14px"});
					checkResultId="";
				} else {
					$("#idCheckView").text("사용가능!").css(
							{ background:"green", color:"white", padding:"8px 14px"});		
						checkResultId="1";
				} // else			
			} // success		
		});//ajax
	}) //click
});//ready 

//비밀번호 검증
//공백없이 숫자와 영문자로 8~12자 이내로(특수문자 사용 불가)


$(document).ready(function(){
    $("#password").keyup(function(){
        if(!userPasswordCheck.test($("#password").val())){ 
            $("#pwCheckView").html("비밀번호는 공백없이 숫자와 영문자로 8~12자 이내로 가능합니다");
            $("#pwCheckView").css("color", "orange");
        } else {
            $("#pwCheckView").html("사용가능합니다! 다시 한번 입력하여 주세요!");
            $("#pwCheckView").css("color", "green");
        }
        $("#password2").keyup(function(){
            if($("#password").val()!=$("#password2").val()) {
                $("#pwCheckView").html("비밀번호가 일치하지 않습니다.");
                $("#pwCheckView").css("color", "red");
            } else if(!userPasswordCheck.test($("#password2").val())) {
                $("#pwCheckView").html("비밀번호는 공백없이 숫자와 영문자로 8~12자 이내로 가능합니다");
                $("#pwCheckView").css("color", "orange");
            }else  {
                $("#pwCheckView").html("사용 가능한 비밀번호입니다");
                $("#pwCheckView").css("color", "green");
            }
        })
    });
});
</script>

<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>회원가입</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcumb Area End ##### -->
    <!-- ##### Contact Form Area Start ##### -->
    <div class="contact-area section-padding-0-80">
        <div class="container">

            <div class="row mt-100">
                <div class="col-12">
                    <div class="contact-form-area">
                        <form action="${pageContext.request.contextPath}/user/register" method="post" id="regForm">
                        	<sec:csrfInput />
                            <div class="row mt-70">
                                <div class="col-12 col-lg-7  ml-auto mr-auto mb-30">
                                	아이디
                                    	<input type="text" class="form-control" id="memberId" name="memberId"  placeholder="사용하실 아이디를 입력해주세요" required="required">
                                    	[영문자(소문자)]로만 또는 [영어(소문자) + 숫자]로 6~20자 이내로만 생성 가능
                                    	<button id="idCheck" class="btn btn-outline-success" type="button" style="width:40%">중복확인</button>
                                    	<span id="idCheckView" class="ml-15"></span>
                                </div>
                                
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	비밀번호
                                    <input type="password" class="form-control" id="password" name="password" placeholder="사용하실 패스워드를 입력해주세요" required="required">
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	비밀번호 확인
                                    <input type="password" class="form-control" id="password2" placeholder="입력하신 패스워드를 다시 입력하여주세요" required="required">
                                    <span id="pwCheckView" class="ml-15"></span>
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이름
                                    <input type="text" class="form-control" name="name" placeholder="이름을 넣어주세요" required="required">
                                </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	닉네임
                                    <input type="text" class="form-control" name="nick" placeholder="사용하실 닉네임을 입력해주세요" required="required">
                                </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	전화번호
		                          	<input type="tel" class="form-control" name="tel" placeholder="사용하시는 휴대폰번호를 입력해주세요" required="required">
		                        </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	생년월일
                                    <input type="date" class="form-control" name="birth" placeholder="가입하시는 분의 생년월일을 입력해주세요" required="required">
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이메일
                                    <input type="email" class="form-control" name="email" placeholder="사용하실 이메일을 입력해주세요" required="required">
                                </div>
                                <div class="col-12 col-lg-7 ml-auto mr-auto mb-30">
                                성별
                            		<select name="gender" required="required">
                              			<option value="">성별</option>
                               			<option value="남성">남자</option>
                         		    	<option value="여성">여자</option>
                            		</select>
                        		</div>
                                <div class="col-12 text-center">
                                    <button class="btn delicious-btn mt-30" type="submit">가입하기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>