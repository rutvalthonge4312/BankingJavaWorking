package bank.model;

public class dataSetter {
	private String name;
	 private String username;
	 private String password;
	 private int amount;
	 private int accountNumber;
	  
	 public dataSetter(String name, String username, String password, int amount) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.amount = amount;
	}
	 public dataSetter(String name, String username, String password, int amount,int accountNumber ) {
			super();
			this.name = name;
			this.username = username;
			this.password = password;
			this.amount = amount;
			this.accountNumber=accountNumber;
		}
	 public dataSetter(String username, String password) {
			super();
			
			this.username = username;
			this.password = password;
			
		}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccountNumber() {
		return name;
	}
	public void setAccountNumber(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	

}
