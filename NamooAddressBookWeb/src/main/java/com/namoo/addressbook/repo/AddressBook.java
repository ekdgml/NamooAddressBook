package com.namoo.addressbook.repo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.namoo.addressbook.common.Page;
import com.namoo.addressbook.common.PageCondition;
import com.namoo.addressbook.domain.Address;

@Repository
public class AddressBook {

	private Map<String, Address> addressesMap;

	//--------------------------------------------------------------------------
	
	public AddressBook() {
		//
		addressesMap = new HashMap<String, Address>();
		
		// 초기데이터 적재
		saveAddress(new Address("김현오", "010-3393-2264", "서울 금천구 가산동 두산로"));
		saveAddress(new Address("홍길동", "010-1111-2222", "서울 강남구 역삼동"));
		saveAddress(new Address("이순신", "010-1234-1234", "한양"));
		saveAddress(new Address("김현오", "011-3393-2264", "서울 금천구 가산동 두산로"));
		saveAddress(new Address("홍길동", "012-1111-2222", "서울 강남구 역삼동"));
		saveAddress(new Address("이순신", "013-1234-1234", "한양"));
		saveAddress(new Address("김현오", "014-3393-2264", "서울 금천구 가산동 두산로"));
		saveAddress(new Address("홍길동", "015-1111-2222", "서울 강남구 역삼동"));
		saveAddress(new Address("이순신", "016-1234-1234", "한양"));
		saveAddress(new Address("김현오", "017-3393-2264", "서울 금천구 가산동 두산로"));
		saveAddress(new Address("홍길동", "018-1111-2222", "서울 강남구 역삼동"));
		saveAddress(new Address("이순신", "119-1234-1234", "한양"));
		saveAddress(new Address("이순신", "119-1234-1234", "한양"));
		saveAddress(new Address("이순신", "119-1234-1234", "한양"));
	}
	
	//--------------------------------------------------------------------------
	
	public Page<Address> findAllAddresses(PageCondition condition) {
		//
		List<Address> addresses = new ArrayList<Address>(addressesMap.values());
		
		Page<Address> page = new Page<Address>();
		page.setPageCondition(condition);
		page.setTotal(addresses.size());
		
		// fromIndex = (currentPage - 1) * countPerPage
		// toIndex = fromIndex + countPerPage - 1;
		
		int fromIndex = (page.getCurrentPage() - 1) * page.getCountPerPage();
		int toIndex = fromIndex + page.getCountPerPage() - 1;

		if (addresses.size() <= toIndex) {
			toIndex = addresses.size() - 1;
		}
		
		page.setResults(addresses.subList(fromIndex, toIndex));
		
		return page;
	}
	
	public Address findAddress(String phone) {
		//
		return addressesMap.get(phone);
	}
	
	public void saveAddress(Address address) {
		//
		addressesMap.put(address.getPhone(), address);
	}
	
	public void deleteAddress(String phone) {
		//
		addressesMap.remove(phone);
	}
}
