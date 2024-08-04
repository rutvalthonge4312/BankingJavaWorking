package bank.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class QueryClass {
	
	  connectionClass c=new connectionClass();
	  Connection con=c.connectionMeathod();
		public PreparedStatement insert() {
			PreparedStatement ps;
			try {
				ps = con.prepareStatement("insert into bank (name,password,amount,USERNAME) values (?,?,?,?)");
				return ps;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		public PreparedStatement authenticate() {
			PreparedStatement ps;
			try {
				ps = con.prepareStatement("select * from bank where username=? and password=?");
				return ps;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
		public PreparedStatement updateAmount() {
			PreparedStatement ps;
			try {
				ps = con.prepareStatement("");
				return ps;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
}
