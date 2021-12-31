package com.GL.CustomerRelationshipMgmt.Service;

import org.springframework.stereotype.Service;

import com.GL.CustomerRelationshipMgmt.Customer;

import java.util.List;

@Service
public interface CustomerService {

	public List<Customer> findAll();

	public Customer findById(int theId);

	public void save(Customer theCust);

	public void deleteById(int theId);

	public List<Customer> searchBy(String firstName, String lastName);
}
