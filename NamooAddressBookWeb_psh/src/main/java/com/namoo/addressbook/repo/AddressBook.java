package com.namoo.addressbook.repo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.namoo.addressbook.domain.Address;

@Repository
public class AddressBook {
	//
	private Map<String, Address> addressesMap;
	
	//--------------------------------------------------------------------------------
	//constructor
	
	public AddressBook() {
		//
		addressesMap = new HashMap<String, Address>();
		
		//초기데이터 적재
		saveAddress(new Address("010-1111-1111", "박상희", "경기도 안양시"));
		saveAddress(new Address("010-2222-2222", "이주성", "서울시 구로구"));
		saveAddress(new Address("010-3333-3333", "홍길동", "서울시 금천구"));
	}
	//--------------------------------------------------------------------------------
	
	/**
	 * 모든address찾기
	 * @return
	 */
	public List<Address> findAllAddresses() {
		//
		return new ArrayList<Address>(addressesMap.values());
	}
	
	/**
	 * phone으로 address찾기
	 * @param phone
	 * @return
	 */
	public Address findAddress(String phone) {
		//
		return addressesMap.get(phone);
	}
	
	/**
	 * address추가
	 * @param address
	 */
	public void saveAddress(Address address) {
		//
		addressesMap.put(address.getPhone(), address);
	}
	
	/**
	 * address삭제
	 * @param phone
	 */
	public void deleteAddress(String phone) {
		addressesMap.remove(phone);
	}
}
