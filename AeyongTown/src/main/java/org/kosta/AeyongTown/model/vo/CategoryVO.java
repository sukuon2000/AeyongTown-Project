package org.kosta.AeyongTown.model.vo;

public class CategoryVO {
	private int categoryId;
	private String categoryName;
	
	public CategoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryVO(int categoryId, String categoryName) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}

	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "CategoryVO [categoryId=" + categoryId + ", categoryName=" + categoryName + "]";
	}
	
	
}
