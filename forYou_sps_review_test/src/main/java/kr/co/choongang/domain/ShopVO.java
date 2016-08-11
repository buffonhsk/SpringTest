package kr.co.choongang.domain;

public class ShopVO {

	private int id;
	private String title;
	private int price;
	private MemberVO memberVO;
	private TalentBoardVO talentBoardVO;

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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
		return "ShopVO [id=" + id + ", title=" + title + ", price=" + price + ", memberVO=" + memberVO
				+ ", talentBoardVO=" + talentBoardVO + "]";
	}

}
