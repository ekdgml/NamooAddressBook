package com.namoo.addressbook.domain;

public class Address {
	//
	private String phone;
	private String name;
	private String address;
	
	//----------------------------------------------------------------------
	//constructor
	public Address() {
		//
	}
	
	public Address(String phone, String name, String address) {
		//
		this.phone = phone;
		this.name = name;
		this.address = address;
	}
	
	//----------------------------------------------------------------------
	//getter, setter
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
