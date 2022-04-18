package edu.jspiders.contactapplication;

import java.io.Serializable;

public class ContactApp implements Serializable
{
	private String name;
	private String number;
	private String email;
	private String date;
	
	public ContactApp()
	{
		
	}

	@Override
	public String toString() {
		return "ContactApp [name=" + name + ", number=" + number + ", email=" + email + ", date=" + date + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}



