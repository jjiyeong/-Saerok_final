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

<link
	href="https://cdn.datatables.net/v/dt/dt-1.13.8/datatables.min.css"
	rel="stylesheet" />

<script
	src="https://cdn.datatables.net/v/dt/dt-1.13.8/datatables.min.js">
	
</script>

<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="" value="전자결재리스트" />
</jsp:include>



<!-- 전체 리스트 -->

<div class="container-fluid">


	<div class="card shadow mb-4">

		<div class="card-header py-3">
			<button class="btn btn-facebook btn-block col-1"
				onclick="location.assign('${path}/approval/basicForm');">작성하기</button>
			<ul class="nav nav-tabs mb-3">
				<li class="nav-item"><a href="#board" data-toggle="tab"
					aria-expanded="true" class="nav-link active"> <i
						class="mdi mdi-home-variant d-lg-none d-block mr-1"></i> <span
						class="d-none d-lg-block  font-weight-bold">내 문서</span>
				</a></li>
				<li class="nav-item"><a href="#proceeding" data-toggle="tab"
					aria-expanded="false" class="nav-link"> <i
						class="mdi mdi-account-circle d-lg-none d-block mr-1"></i> <span
						class="d-none d-lg-block  font-weight-bold">결재중 문서</span>
				</a></li>
				<li class="nav-item"><a href="#complete" data-toggle="tab"
					aria-expanded="false" class="nav-link"> <i
						class="mdi mdi-account-circle d-lg-none d-block mr-1"></i> <span
						class="d-none d-lg-block  font-weight-bold">완료 문서</span>
				</a></li>
			</ul>
			<!-- 나의 문서  -->
			<div class="tab-content">
				<div class="tab-pane active" id="board">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>결재번호</th>
									<th>제목</th>
									<th>기안자</th>
									<th>신청일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
				<!--결재 문서  -->
				<div class="tab-pane" id="proceeding">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>결재번호</th>
									<th>제목</th>
									<th>기안자</th>
									<th>기안일</th>
									<th>진행상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="a" items="${list}">
									<tr>
										<%--  <td><c:out value="${a.appSeq}" /></td> 
										<td><c:out value="제목" /></td>
										 <td><c:out value="${a.empName}" /></td> 
										<td><c:out value="${a.appWriteDate}" /></td>
										<td><c:out value="${a.appCheck}" /></td> --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 완료 문서 -->
				<div class="tab-pane" id="complete">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>결재번호</th>
									<th>제목</th>
									<th>기안자</th>
									<th>기안일</th>
									<th>진행상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<script>
	$(document).ready(function() {

		new DataTable('#dataTable', {
			info : false,
			ordering : true,
			paging : true
		});
	});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />