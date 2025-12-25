package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBConnection;

public class RecoverPassword {

    public boolean UpdatePasswordAdmin(int userId, String password){
		boolean valid = false;
		int count = 0;
		try (Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("update admin_security set password=? where id=?")) {
				ps.setString(1, password);
				ps.setInt(2, userId);
				count = ps.executeUpdate();
			
				if(count>0) {
					valid = true;
				}
				else {
					valid = false;
				}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return valid;
	}
    public boolean UpdatePasswordApplicant(int userId, String password){
		boolean valid = false;
		int count = 0;
		try (Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("update applicant_security set password=? where id=?")) {
				ps.setString(1, password);
				ps.setInt(2, userId);
				count = ps.executeUpdate();
			
				if(count>0) {
					valid = true;
				}
				else {
					valid = false;
				}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return valid;
	}
}
