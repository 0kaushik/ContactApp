package edu.jspiders.contactapplication;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ContactDataBase 
{
	private final static String Driver_Class = "com.mysql.jdbc.Driver";
	private final static String Db_Url = "jdbc:mysql://localhost:3306/contactfile?user=root&password=root";

	Statement stm = null;
	PreparedStatement pstm = null;
	Connection con = null;
	ResultSet res = null;
	
	@SuppressWarnings("deprecation")
	public ContactApp searchName(ContactApp app)
	{
		ContactApp ap = new ContactApp();
		try
		{
			// 1. load the driver
			Class.forName(Driver_Class);
			
			//2. get conn via drivers
			con = DriverManager.getConnection(Db_Url);
			
			//3. execute query
			String query = "select * from contact where name = ?;";
			pstm = con.prepareStatement(query);
			
			pstm.setString(1, app.getName());
			
			res = pstm.executeQuery();
			
			while(res.next())
			{
				ap.setName(res.getString(1));
				ap.setNumber(res.getString(2));		
				ap.setEmail(res.getString(3));
				/*Date d  = res.getDate(4);
				ap.setDate(d.getDate());*/
				ap.setDate(res.getDate(4).toString());
			}
			return ap;
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			try
			{
				if(con != null)
				{
					con.close();
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			try
			{
				if(res != null)
				{
					res.close();
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			try
			{
				if(pstm != null)
				{
					pstm.close();
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		return null;
	}
	public boolean insertData(ContactApp app)
	{
		
		try
		{
			// 1. load the driver
			Class.forName(Driver_Class);
						
			//2. get con via drivers
			con = DriverManager.getConnection(Db_Url);
						
			//3. execute query
			String query = "insert into contact values(?,?,?,?)";
			pstm = con.prepareStatement(query);
			
			pstm.setString(1, app.getName());
			pstm.setString(2, app.getNumber());
			pstm.setString(3, app.getEmail());
			pstm.setString(4, app.getDate());
			
			if(pstm.executeUpdate() > 0)
			{
				return true;
			}
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			try
			{
				if(con != null)
				{
					con.close();
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			try
			{
				if(pstm != null)
				{
					pstm.close();
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		
		return false;
	}
	public List<ContactApp> displayAll()
	{
		List<ContactApp> ll = new ArrayList<ContactApp>();
		ContactApp ap = new ContactApp();
		
		try
		{
			// 1. load the driver
			Class.forName(Driver_Class);
			
			//2. get conn via drivers
			con = DriverManager.getConnection(Db_Url);
			
			//3. execute query
			String query = "select * from contact";
			stm = con.createStatement();
			res = stm.executeQuery(query);
			while(res.next())
			{
				ap.setName(res.getString(1));
				ap.setNumber(res.getString(2));
				ap.setEmail(res.getString(3));
				ap.setDate(res.getDate(4).toString());
				
				ll.add(ap);
			 ap = new ContactApp();
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			try
			{
				if(con != null)
				{
					con.close();
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			try
			{
				if(res != null)
				{
					res.close();
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			try
			{
				if(stm != null)
				{
					stm.close();
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
	
		return ll;
	}
}
