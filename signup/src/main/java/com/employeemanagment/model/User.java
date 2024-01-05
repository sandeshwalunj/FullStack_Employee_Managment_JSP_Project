package com.employeemanagment.model;

public class User
{
	protected int id;
	protected String firstname;
	protected String middlename;
	protected String lastname;
	protected String gender;
	protected String dob;
	protected String position;
	protected String email;
	
	public User()
	{
		
	}
	
public User(int id,String firstname,String middlename,String lastname,String gender,String dob,String position,String email)
{
	super();
	this.id=id;
	this.firstname=firstname;
	this.email=email;
	this.middlename=middlename;
	this.lastname=lastname;
	this.gender=gender;
	this.dob=dob;
	this.position=position;
	
}
public User(String firstname,String middlename,String lastname,String gender,String dob,String position,String email)
{
	super();
	this.firstname=firstname;
	this.middlename=middlename;
	this.lastname=lastname;
	this.gender=gender;
	this.dob=dob;
	this.position=position;
	this.email=email;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getFirstname() {
	return firstname;
}

public void setFirstname(String firstname) {
	this.firstname = firstname;
}

public String getMiddlename() {
	return middlename;
}

public void setMiddlename(String middlename) {
	this.middlename = middlename;
}

public String getLastname() {
	return lastname;
}

public void setLastname(String lastname) {
	this.lastname = lastname;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public String getDob() {
	return dob;
}

public void setDob(String dob) {
	this.dob = dob;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPosition() {
	return position;
}

public void setPosition(String position) {
	this.position = position;
}


}

