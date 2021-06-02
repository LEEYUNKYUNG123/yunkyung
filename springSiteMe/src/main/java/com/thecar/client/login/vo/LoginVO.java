package com.thecar.client.login.vo;


public class LoginVO extends LoginHistory{
	private String m_id ="";
	private String m_pw ="";
	private String m_name ="";
	private String m_email=""; //아이디,비밀번호 찾기에서 사용
	
	public LoginVO() {
	}

	

	public LoginVO(String m_id, String m_pw, String m_name, String m_email) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
	}


	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	

	public String getM_email() {
		return m_email;
	}



	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	
}
