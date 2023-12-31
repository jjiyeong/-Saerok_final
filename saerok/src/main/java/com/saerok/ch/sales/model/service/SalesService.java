package com.saerok.ch.sales.model.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface SalesService {

	BigDecimal findTodaySalesTotal();

	BigDecimal findCurrentMonthSalesTotal();

	BigDecimal findCurrentYearSalesTotal();

	List<Map<String, Object>> findMonthlySalesTotals();

	List<Map<String, Object>> findCurrentMonthBranchSales();

	List<Map<String, Object>> getBranchSales(String searchKeyword, String sortOrder);

	Map<String, Object> getBranchDetailSales(Integer branchNo);

	List<Map<String, Object>> getCurrentMonthSalesByDay(Integer branchNo);

}