package com.GL.CustomerRelationshipMgmt.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.GL.CustomerRelationshipMgmt.Customer;
import com.GL.CustomerRelationshipMgmt.Service.CustomerService;

@Controller
@RequestMapping("/customers")
public class CustomerController {

	@Autowired
	private CustomerService service;

	@GetMapping("/list")
	public String getCustomer(Map<String, List<Customer>> map) {
		map.put("customers", service.findAll());
		return "customerlist";
	}

	@GetMapping("/search")
	public String searchCustomer(@RequestParam(required = false) String firstName,
			@RequestParam(required = false) String lastName, Map<String, List<Customer>> map) {
		List<Customer> customers = this.service.searchBy(firstName, lastName);
		map.put("customers", customers);
		return "customersearch";
	}

	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam int custId) {
		this.service.deleteById(custId);
		return "redirect:list";

	}

	@GetMapping("/add")
	public String addCustomer(Map<String, Customer> map) {

		map.put("Customer", new Customer());
		return "customerform";
	}

	@GetMapping("/update")
	public String updateCustomer(@RequestParam int custId, Map<String, Customer> map) {
		System.out.println("update " + custId);
		Customer customer = this.service.findById(custId);

		map.put("Customer", customer);
		return "customerform";
	}

	@PostMapping("/save")
	public String save(Customer customer) {
		this.service.save(customer);
		return "redirect:list";
	}

}
