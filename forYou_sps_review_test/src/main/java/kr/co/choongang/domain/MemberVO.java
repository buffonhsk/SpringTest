package kr.co.choongang.domain;

import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberVO {
	
	
	private int mNo;
	@NotEmpty(message = "필수 입력입니다.") @Length(min=4, max=12, message = "4~12자 입력해주세요.")
	private String userid;
	@NotEmpty(message = "필수 입력입니다.") @Length(min=4, max=12, message = "4~12자 입력해주세요.")
	private String userpw;
	@NotEmpty(message = "필수 입력입니다.")
	private String username;
	@NotEmpty(message = "필수 입력입니다.") @Email(message = "이메일 형식이 아닙니다.")  
	private String email;
	
	@NotEmpty(message = "필수 입력입니다.")
	private String contactNum;
	private Date regdate;
	private int grade;
	
	
	public MemberVO() {

	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getUserid() {
		System.out.println("1111");
		return userid;
	}

	public void setUserid(String userid) {
		System.out.println("2222");
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNum() {
		return contactNum;
	}

	public void setContactNum(String contactNum) {
		this.contactNum = contactNum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((contactNum == null) ? 0 : contactNum.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + grade;
		result = prime * result + mNo;
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((userid == null) ? 0 : userid.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		result = prime * result + ((userpw == null) ? 0 : userpw.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVO other = (MemberVO) obj;
		if (contactNum == null) {
			if (other.contactNum != null)
				return false;
		} else if (!contactNum.equals(other.contactNum))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (grade != other.grade)
			return false;
		if (mNo != other.mNo)
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		if (userpw == null) {
			if (other.userpw != null)
				return false;
		} else if (!userpw.equals(other.userpw))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberVO [mNo=" + mNo + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username
				+ ", email=" + email + ", contactNum=" + contactNum + ", regdate=" + regdate + ", grade=" + grade
				+ "]";
	}

}
