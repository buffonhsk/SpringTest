package kr.co.choongang.command;

public class LoginCommand {
	
	private int bNo;
	
	private String userid;

	private String userpw;

	private boolean rememberUserid;
	

	
	
	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public boolean isRememberUserid() {
		return rememberUserid;
	}

	public void setRememberUserid(boolean rememberUserid) {
		this.rememberUserid = rememberUserid;
	}

}
