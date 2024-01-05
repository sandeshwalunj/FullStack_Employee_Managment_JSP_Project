package com.employeemanagment.model;

public class Address {
private int id;
private String country;
private String state;
private String district;
private int pincode;
private String city;
private String address1;
private String address2;

public Address()
{
	
}

public Address(String country,String state,String district,int pincode,String city,String address1,String address2)
{
	super();
	this.country=country;
	this.state=state;
	this.district=district;
	this.pincode=pincode;
	this.city=city;
	this.address1=address1;
	this.address2=address2;
}

public Address(int id,String country,String state,String district,int pincode,String city,String address1,String address2)
{
	super();
	this.id=id;
	this.country=country;
	this.state=state;
	this.district=district;
	this.pincode=pincode;
	this.city=city;
	this.address1=address1;
	this.address2=address2;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getDistrict() {
	return district;
}
public void setDistrict(String district) {
	this.district = district;
}
public int getPincode() {
	return pincode;
}
public void setPincode(int pincode) {
	this.pincode = pincode;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getAddress1() {
	return address1;
}
public void setAddress1(String address1) {
	this.address1 = address1;
}
public String getAddress2() {
	return address2;
}
public void setAddress2(String address2) {
	this.address2 = address2;
}

}
