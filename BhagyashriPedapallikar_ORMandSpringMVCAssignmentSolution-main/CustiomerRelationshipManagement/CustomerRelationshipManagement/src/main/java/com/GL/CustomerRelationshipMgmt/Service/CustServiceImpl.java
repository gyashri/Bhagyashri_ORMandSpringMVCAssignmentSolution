package com.GL.CustomerRelationshipMgmt.Service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.GL.CustomerRelationshipMgmt.Customer;

@Repository
public class CustServiceImpl implements CustomerService {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Customer> findAll() {
		Session session = this.sessionFactory.openSession();
		List<Customer> list = session.createQuery("from Customer", Customer.class).list();
		session.close();
		return list;
	}

	@Override
	public Customer findById(int theId) {
		Session session = this.sessionFactory.openSession();
		Customer customer = session.get(Customer.class, theId);
		session.close();
		return customer;
	}

	@Override
	public void save(Customer theCust) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(theCust);
		tx.commit();
		session.close();

	}

	@Override
	public void deleteById(int theId) {
		Session session = this.sessionFactory.openSession();

		Customer customer = findById(theId);
		if (customer != null) {
			Transaction tx = session.beginTransaction();
			session.delete(customer);
			tx.commit();
		}
		session.close();

	}

	@Override
	public List<Customer> searchBy(String firstName, String lastName) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String query = "";
		if (firstName.length() != 0 && lastName.length() != 0)
			query = "from Customer where firstName like '%" + firstName + "%' or lastName like '%" + lastName + "%'";
		else if (firstName.length() != 0)
			query = "from Customer where firstName like '%" + firstName + "%'";
		else if (lastName.length() != 0)
			query = "from Customer where lastName like '%" + lastName + "%'";
		else
			System.out.println("Cannot search without input data");

		List<Customer> customers = session.createQuery(query, Customer.class).list();

		tx.commit();
		session.clear();
		return customers;
	}

}
