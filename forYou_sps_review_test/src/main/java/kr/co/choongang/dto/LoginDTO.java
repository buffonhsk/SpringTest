package kr.co.choongang.dto;


//httpsession
public class LoginDTO {

	private int mNo;
	
	private String userid;

	private String username;
	
	private String userpw;

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	@Override
	public String toString() {
		return "LoginDTO [mNo=" + mNo + ", userid=" + userid + ", username=" + username + ", userpw=" + userpw + "]";
	}

	
	
	
	
	


}
