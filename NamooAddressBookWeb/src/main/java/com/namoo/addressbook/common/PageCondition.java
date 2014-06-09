package com.namoo.addressbook.common;

public class PageCondition {

	private static final int DEFAULT_PAGE = 1;
	private static final int DEFAULT_COUNT_PER_PAGE = 10;

	private int currentPage;
	private int countPerPage;
	
	public PageCondition() {
		//
		this.currentPage = DEFAULT_PAGE;
		this.countPerPage = DEFAULT_COUNT_PER_PAGE;
	}
	
	public PageCondition(int currentPage, int countPerPage) {
		//
		this.currentPage = currentPage;
		this.countPerPage = countPerPage;
	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	public static int getDefaultPage() {
		return DEFAULT_PAGE;
	}
	public static int getDefaultCountPerPage() {
		return DEFAULT_COUNT_PER_PAGE;
	}
	
	
}
