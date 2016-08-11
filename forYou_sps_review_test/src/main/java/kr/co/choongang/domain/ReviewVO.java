package kr.co.choongang.domain;

import java.util.Date;

public class ReviewVO {

	private int id;
	private String comment;
	private int starCount;
	private String regdate;
	private MemberVO memberVO;
	private TalentBoardVO talentBoardVO;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getStarCount() {
		return starCount;
	}

	public void setStarCount(int starCount) {
		this.starCount = starCount;
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

	public TalentBoardVO getTalentBoardVO() {
		return talentBoardVO;
	}

	public void setTalentBoardVO(TalentBoardVO talentBoardVO) {
		this.talentBoardVO = talentBoardVO;
	}

	@Override
	public String toString() {
		return "ReviewVO [id=" + id + ", comment=" + comment + ", starCount=" + starCount + ", regdate=" + regdate
				+ ", memberVO=" + memberVO + ", talentBoardVO=" + talentBoardVO + "]";
	}

}
