package com.saerok.jj.apv.model.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AppLetter {
	private String letterSeq; //품의서 고유번호
	private String basicForm;
	private int appSeq; //전자결재번호
	private String loginEmp;
	private String appEmpName; //결재신청자
	private String letterTitle; //품의서 제목
	private String letterDetail; //상세내용
	private String letterStatus; //문서상태
	private String oriFileName; //원본파일명
	private String reFileName;//수정파일명
	
}
