package kr.co.choongang.domain;

import java.util.Date;

public class RecomVO {

	private int id;
	private String title;
	private String regdate;
	private MemberVO memberVO;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	
	@Override
	public String toString() {
		return "RecomVO [id=" + id + ", title=" + title + ", regdate=" + regdate + ", memberVO=" + memberVO + "]";
	}

}
