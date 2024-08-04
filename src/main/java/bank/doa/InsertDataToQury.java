package bank.doa;

import java.sql.PreparedStatement;

import bank.model.dataSetter;

public class InsertDataToQury {
	QueryClass query=new QueryClass();
	
	PreparedStatement ps;
	public PreparedStatement insertData(dataSetter data) {
		try {
			ps=query.insert();
			ps.setString(1, data.getName());
			ps.setString(2, data.getPassword());
			ps.setInt(3, data.getAmount());
			ps.setString(4, data.getUsername());
			return ps;
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return null;
		
	}
	
	public PreparedStatement authenticateData(dataSetter data) {
		try {
			ps=query.authenticate();
			ps.setString(1, data.getUsername());
			ps.setString(2, data.getPassword());
			
			return ps;
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return null;
		
	}
}
