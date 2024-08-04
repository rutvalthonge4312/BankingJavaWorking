package bank.model;

import java.sql.Date;
import java.time.LocalDate;

public class dataTransaction {
	private int amount;
	private LocalDate date;
	private long mobileNumber;
	private int accountNUmber;
	/*
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public LocalDate getFirstDate() {
		return date;
	}
	public void setFirstDate(LocalDate firstDate) {
		this.date = date;
	}
	public dataTransaction(int amount, LocalDate date) {
		super();
		this.amount = amount;
		this.date = date;
	} 
	*/
	public int getAmount() {
		return amount;
	}
	
	
	public int getAccountNUmber() {
		return accountNUmber;
	}


	public void setAccountNUmber(int accountNUmber) {
		this.accountNUmber = accountNUmber;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public long getMobileNumber() {
		return mobileNumber;
	}
	
	
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
	public dataTransaction(int amount, LocalDate date,long mobileNumber,int accountNUmber) {
		super();
		this.amount = amount;
		this.date = date;
		this.mobileNumber = mobileNumber;
		this.accountNUmber = accountNUmber;
	}
	public dataTransaction(long mobileNumber) {
		super();
		this.mobileNumber = mobileNumber;
	
	}
	
	
	
	
	
}
