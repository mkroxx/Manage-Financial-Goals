package com.mukund.demo;

import org.springframework.data.repository.CrudRepository;

public interface TransactionRepo extends CrudRepository<Transactions, Integer> {

}
