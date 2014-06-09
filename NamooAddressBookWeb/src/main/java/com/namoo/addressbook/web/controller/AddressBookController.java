package com.namoo.addressbook.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.namoo.addressbook.common.Page;
import com.namoo.addressbook.common.PageCondition;
import com.namoo.addressbook.domain.Address;
import com.namoo.addressbook.repo.AddressBook;

@Controller
public class AddressBookController {
	//
	@Autowired
	private AddressBook addressBook;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String init() {
		//
		return "addressbook";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Page<Address> findAllAddresses(PageCondition pageCondition) {
		//
		return addressBook.findAllAddresses(pageCondition);
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Address saveAddress(Address address) {
		//
		addressBook.saveAddress(address);
		return address;
	}
	
	@RequestMapping(value = "/save2", method = RequestMethod.POST)
	@ResponseBody
	public Address saveAddress2(@RequestBody Address address) {
		//
		addressBook.saveAddress(address);
		return address;
	}

	
}
