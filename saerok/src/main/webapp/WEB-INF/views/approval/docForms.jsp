<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<form class="documentForm" name="basicForm"
	action="${path }/approval/insertAppLetter.do" method="POST"
	enctype="multipart/form-data">
	<input type="hidden" name="loginEmp" value="${loginEmployee.empNo }">
	<div id="documentForm " class="documentForm"
		style="margin: 50px 50px 50px 50px; width: min-content;">
		<div class="basicForm">
			<table border="1" style="display: inline-block; text-align: center;">
				<tr>
					<td rowspan="2" colspan="4"
						style="color: black; font-size: 40px; font-weight: 600;">품의서</td>
					<td rowspan="2" style="color: black; font-size: 20px;"><input
						type="button" id="testBtn2" class="rounded-circle border-0"
						value="결재" /></td>
					<td style="color: black; font-size: 15px;">최초승인자</td>
					<td style="color: black; font-size: 15px;">중간승인자</td>
					<td style="color: black; font-size: 15px;">최종승인자</td>
				</tr>
				<tr>

				</tr>
				<tr>
					<td colspan="2" style="color: black; height: 70px;">수신참조자</td>
					<td colspan="6" id="referContainer" style="height: 70px;"></td>
				</tr>
				<tr>
					<td
						style="color: black; height: 70px; width: 80px; font-size: 15px;">성
						명</td>
					<td><input type="text" name="writerName"
						style="border: none; background: transparent; text-align: center;"
						value="${ loginEmployee.empName }" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">부 서</td>
					<td><input type="text"
						style="border: none; background: transparent; text-align: center;"
						value="${ loginEmployee.deptName }" readonly></td>
					<td style="color: black; width: 80px; font-size: 15px;">직 급</td>
					<td colspan="3"><input type="text"
						style="border: none; background: transparent;"
						value="${ loginEmployee.jobName }" readonly></td>
				</tr>
				<tr>
					<td style="color: black; height: 50px; width: 80px;">제 목</td>
					<td colspan="8"><textarea class="form-control"
							name="letterTitle" id="loaTitle"
							style="width: 100%; height: 50px; resize: none; overflow: hidden;"></textarea></td>
				</tr>
				<tr>
					<td colspan="8" style="height: 90px;">
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="upFile"
								id="upFile1"> <label class="custom-file-label"
								for="upFile1">파일을 선택하세요</label>
						</div>
					</td>
				</tr>
				<tr>
					<td style="color: black; height: 70px; width: 300px;">상세내용</td>


					<td colspan="8"><textarea class="form-control"
							name="letterDetail" id="loaContent" cols="151px" rows="11px"
							style="width: 100%; height: 300px; border: none; resize: none; overflow: hidden; font-size: 25px;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="8"
						style="text-align: center; height: 100px; border-bottom: none;">위와
						같은 품의사유로, 검토 후 결재 바랍니다.</td>
				</tr>
				<tr style="color: black; border-top: none; border-bottom: none;">
					<td colspan="8" style="text-align: center; height: 100px;">
						2024년 &nbsp; 1 월 &nbsp; 31일 &nbsp;</td>
				</tr>
				
				<tr>
					<td colspan="8"
						style="color: black; text-align: right; height: 100px; padding-right: 50px;">
						<input type="button" name="sign" id="sign"
						style="font-size: 15px; width: 70px; height: 30px; border: none; text-align: center; border-radius: 20px; margin-right: 10px"
						value="서명" /> <textArea name="signText" id="signText"
							style="width: 100px; border: none; text-align: center; resize: none; font-size: 24px;"
							readonly="readonly"></textArea>
					</td>
				</tr>
			</table>
		</div>
		<div id="button" style="text-align: center; margin-top: 10px">
			<input type="hidden" name="basicForm" value="품의서">
			<button type="submit" class="btn btn-primary" onclick="">등록</button>
			<!-- ${path}/approval/updateLeave -->
			<input type="text" style="border: none; width: 10px;" disabled>
			<button type="reset" class="btn btn-primary" onclick="">취소</button>
		</div>
	</div>
</form>
