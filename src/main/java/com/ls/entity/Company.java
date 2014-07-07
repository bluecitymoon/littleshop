package com.ls.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "ls_company")
public class Company implements Serializable {

	private static final long serialVersionUID = -6868385772290273229L;

	@Id
	@GeneratedValue
	protected Integer id;
	protected String name;
	protected String contactor;
	protected String email;
	
	@Column(name = "email_src")
	protected String emailSrc;
	protected String phone;

	@Column(name = "phone_src")
	protected String phoneSrc;

	@Column(name = "is_tracked")
	protected Boolean isTracked;

	protected String address;
	
	@ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinTable(name = "ls_company_problem", joinColumns = @JoinColumn(name = "company_id"), inverseJoinColumns = @JoinColumn(name = "problem_id") )
	protected List<Problem> problems;
	
	@Transient
	protected String fEurl;
	
	@Transient
	protected String phoneImgSrc;
	
	@Transient
	protected String publishDate;
	
	public String getPhoneImgSrc() {
		return phoneImgSrc;
	}

	public void setPhoneImgSrc(String phoneImgSrc) {
		this.phoneImgSrc = phoneImgSrc;
	}

	public String getfEurl() {
		return fEurl;
	}

	public void setfEurl(String fEurl) {
		this.fEurl = fEurl;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContactor() {
		return contactor;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setContactor(String contactor) {
		this.contactor = contactor;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailSrc() {
		return emailSrc;
	}

	public void setEmailSrc(String emailSrc) {
		this.emailSrc = emailSrc;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoneSrc() {
		return phoneSrc;
	}

	public void setPhoneSrc(String phoneSrc) {
		this.phoneSrc = phoneSrc;
	}

	public Boolean getIsTracked() {
		return isTracked;
	}

	public void setIsTracked(Boolean isTracked) {
		this.isTracked = isTracked;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Problem> getProblems() {
		return problems;
	}

	public void setProblems(List<Problem> problems) {
		this.problems = problems;
	}
	
	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	@Override
	public String toString() {
		return "Company [id=" + id + ", name=" + name + ", contactor="
				+ contactor + ", email=" + email + ", emailSrc=" + emailSrc
				+ ", phone=" + phone + ", phoneSrc=" + phoneSrc
				+ ", isTracked=" + isTracked + ", address=" + address
				+ ", problems=" + problems + ", fEurl=" + fEurl
				+ ", phoneImgSrc=" + phoneImgSrc + ", publishDate="
				+ publishDate + "]";
	}
}
