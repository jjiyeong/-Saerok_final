package com.saerok.jj.apv.model.dto;

import java.sql.Date;

import com.saerok.jh.employee.model.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApvWriter {
	private String apvState;
	private Approval apvNo;
	private Employee apvEmpNo;
	private Date apvEmpTime;
	private String returnReason;
}
