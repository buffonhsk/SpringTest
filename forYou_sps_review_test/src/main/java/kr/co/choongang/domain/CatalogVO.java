package kr.co.choongang.domain;

public class CatalogVO {

	private int id;
	private String type;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "CatalogVO [id=" + id + ", type=" + type + "]";
	}

}
