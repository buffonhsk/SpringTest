package kr.co.choongang.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


public class TalentBoardVO {

	private int id;
	private MultipartFile image_1;
	private String image;
	private String title;
	private int price;
	private String contents;
	private String regdate;
	private MemberVO memberVO;
	private int cnt;
	private CatalogVO catalogVO;
	private String imageName;
	private int avgStar;
	
	public int getAvgStar() {
		return avgStar;
	}

	public void setAvgStar(int avgStar) {
		this.avgStar = avgStar;
	}

	public MultipartFile getImage_1() {
		return image_1;
	}

	public void setImage_1(MultipartFile image) {
		this.image_1 = image;
	}

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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public CatalogVO getCatalogVO() {
		return catalogVO;
	}

	public void setCatalogVO(CatalogVO catalogVO) {
		this.catalogVO = catalogVO;
	}

	

	@Override
	public String toString() {
		return "TalentBoardVO [id=" + id + ", image_1=" + image_1 + ", image=" + image + ", title=" + title + ", price="
				+ price + ", contents=" + contents + ", regdate=" + regdate + ", memberVO=" + memberVO + ", cnt=" + cnt
				+ ", catalogVO=" + catalogVO + ", imageName=" + imageName + ", avgStar=" + avgStar + "]";
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
