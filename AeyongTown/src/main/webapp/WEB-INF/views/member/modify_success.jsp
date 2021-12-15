<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<!DOCTYPE html>
<script type="text/javascript">
$(document).ready(function(){
	alert("회원정보가 정상적으로 수정되었습니다");
	alert("정보가 수정되었기 때문에 다시 로그인 해주시기 바랍니다");
	$("#logoutForm").submit();
});
</script>
<form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post" style="display: none">
<sec:csrfInput />
</form>