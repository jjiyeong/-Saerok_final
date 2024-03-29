<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.datatables.net/v/dt/dt-1.13.8/datatables.min.css" rel="stylesheet" />
<script src="https://cdn.datatables.net/v/dt/dt-1.13.8/datatables.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="ato-success">
    <div class="container-fluid page-wrapper">
        <div class="card shadow mb-4" style="display: block">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">ATO 사원리스트</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center">사번</th>
                                <th scope="col" class="text-center">이름</th>
                                <th scope="col" class="text-center">부서</th>
                                <th scope="col" class="text-center">직책</th>
                                <th scope="col" class="text-center">전화번호</th>
                                <th scope="col" class="text-center">이메일</th>
                                <th scope="col" class="text-center">주소</th>
                                <th scope="col" class="text-center">상세주소</th>
                                <th scope="col" class="text-center">재직여부</th>
                                <th scope="col" class="text-center">ATO사원수정</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty empList}">
                                <c:forEach var="employee" items="${empList}">
                                    <tr>
                                        <td><c:out value="${employee.empNo}" /></td>
                                        <td><c:out value="${employee.empName}" /></td>
                                        <td value="${employee.deptCode}"><c:out value="${employee.deptName}" /></td>
                                        <td value="${employee.jobCode}"><c:out value="${employee.jobName}" /></td>
                                        <td><c:out value="${employee.empPhone}" /></td>
                                        <td><c:out value="${employee.empEmail}" /></td>
                                        <td><c:out value="${employee.empAddr}" /></td>
                                        <td><c:out value="${employee.empDetailAddr}" /></td>
                                        <td>
                                       <%-- 	<c:if test="${employee.workYn eq 'Y'}">
                                        재직중
                                        </c:if>
                                        <c:if test="${employee.workYn eq 'N' }">
                                        퇴사
                                        </c:if>
                                         --%>
                                        <c:choose>
                                        	<c:when test="${employee.workYn eq 'Y' }">
                                        		재직
                                        	</c:when>
                                        	<c:otherwise>
                                        		퇴사
                                        	</c:otherwise>
                                        </c:choose>
                                        </td>
                                       
                                        <td>
                                            <button class="btn btn-outline-primary listupdatebtn" type="button"
                                                data-toggle="modal" data-target="#updateModal">수정하기</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 수정하기 Modal-->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">ATO 사원수정</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <br>
                <form class="selectempList" id="updateempForm" action="${path}/human/selectemp" method="post">
                    <div class="container">
                        <div class="col-md-8">
                            <label for="inputNo" class="form-label">사번</label>
                            <input type="text" class="form-control" value="${loginEmployee.empNo}" name="empNo"
                                disabled>
                        </div>
                        <br>
                        <div class="col-md-8">
                            <label for="inputName" class="form-label">이름</label>
                            <input type="hidden" value="${loginEmployee.empNo}" name="empNo">
                            <input type="text" class="form-control" value="${loginEmployee.empName}" name="empName"
                                disabled>
                        </div>
                        <br>
                        <div class="col-sm-8">
                            <label for="inputdeptCode" class="form-label">부서</label>
                            <select name="deptCode" class="form-select form-select-sm rounded"
                                aria-label="Small select example" style="height: 40px; width: 100%;">
                                <option selected>부서</option>
                                <option value="100">인사팀</option>
                                <option value="200">관리팀</option>
                                <option value="300">영업팀</option>
                                <option value="400">지점</option>
                            </select>
                        </div>
                        <br>
                        <div class="row" style="padding-left:13px;">
                            <div class="col-12">
                                <p>직책</p>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="jobCode" value="10" checked>
                                    <label class="form-check-label" for="flexRadioDefault1">부장</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="jobCode" value="20">
                                    <label class="form-check-label" for="flexRadioDefault2">대리</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="jobCode" value="30">
                                    <label class="form-check-label" for="flexRadioDefault3">사원</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="jobCode" value="40">
                                    <label class="form-check-label" for="flexRadioDefault4">지점장</label>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-6" style="padding-bottom:20px;">
                            <label for="inputdeptCode" class="form-label">재직여부</label> <br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="workYn" value="Y">
                                <label class="form-check-label" for="flexRadioDefault3">재직</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="workYn" value="N">
                                <label class="form-check-label" for="flexRadioDefault3">퇴사</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-outline-primary" id="updatebtn" type="button">수정하기</button>
                            <button class="btn btn-outline-danger" id="deletebtn" type="button">삭제하기</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script>
$(document).ready(function() {
    $(".listupdatebtn").click(function() {
        var empNo = $(this).closest('tr').find('td:eq(0)').text();
        var empName = $(this).closest('tr').find('td:eq(1)').text();
        var deptName = $(this).closest('tr').find('td:eq(2)').attr("value");
        var jobName = $(this).closest('tr').find('td:eq(3)').attr("value");
        var workYn = $(this).closest('tr').find('td:eq(8)').text();

        $("#updateModal").find(".modal-title").text("ATO 사원수정");
        $("#updateModal").find("[name=empNo]").val(empNo);
        $("#updateModal").find("[name=empName]").val(empName);
        $("#updateModal").find("[name=deptCode]").val(deptName);
        $("#updateModal").find("[value=" + jobName + "]").prop("checked", true);
        $("#updateModal").find("[value=" + workYn + "]").prop("checked", true);

        $("#updateModal").modal('show');
    });
});

$("#updatebtn").hide();
$("#deletebtn").hide();

$(document).ready(function() {
    new DataTable('#dataTable', {
        info: false,
        ordering: true,
        paging: true
    });
});

var userDeptCode = "${loginEmployee.deptCode}";
var userJobCode = "${loginEmployee.jobCode}";

if (userDeptCode === '100' && userJobCode === '10') {
    $("#updatebtn").show();
    $("#deletebtn").show();
}
</script>

<!-- 수정하기 ajax로 보내기 -->

<script>
$("#updatebtn").click(function(event) {
    event.preventDefault();

    var formData = {
        empNo: $("[name='empNo']").val(),
        empName: $("[name='empName']").val(),
        deptCode: $("[name='deptCode']").val(),
        jobCode: $("input[name='jobCode']:checked").val(),
        workYn: $("input[name='workYn']:checked").val()
    }

    $.ajax({
        method: "POST",
        url: "${path}/human/updateemp",
        data: JSON.stringify(formData),
        contentType: 'application/json',
        success: function(data) {
            alert(data);
            $("#updateModal").modal("hide");
            location.replace("${path}/human/selectemp");
        },
        error: function(error) {
            console.error("수정 중 에러발생!!:", error);
            alert("수정 중 에러가 발생했습니다.");
        }
    });
});

$("#deletebtn").click(function(event) {
    event.preventDefault();
    
     var formData2 = {
        empNo: $("[name='empNo']").val(),
    }

    $.ajax({
        method: "POST",
        url: "${path}/human/deleteemp",
        data: JSON.stringify(formData2),
        contentType: 'application/json',
        success: function (data) {
            alert(data);
            $("#updateModal").modal("hide");
            location.replace("${path}/human/selectemp");
        },
        error: function (error) {
            console.error("삭제 중 에러발생!!:", error);
            alert("삭제 중 에러가 발생했습니다.");
        }
    });
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />