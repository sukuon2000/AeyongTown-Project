package org.kosta.AeyongTown.model.vo;

import java.util.ArrayList;

public class GoodsVO {

	private int goodsId;
	private MemberVO memberVO;
	private String title;
	private String info;
	private int price;
	private CategoryVO categoryVO;
	private String uploadDate;
	private int viewCounts;
	private MapVO MapVO;
	private String goodsThumbnail;
	private ArrayList<String> imgPath;
	public GoodsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsVO(int goodsId, MemberVO memberVO, String title, String info, int price, CategoryVO categoryVO,
			String uploadDate, int viewCounts, org.kosta.AeyongTown.model.vo.MapVO mapVO, String goodsThumbnail,
			ArrayList<String> imgPath) {
		super();
		this.goodsId = goodsId;
		this.memberVO = memberVO;
		this.title = title;
		this.info = info;
		this.price = price;
		this.categoryVO = categoryVO;
		this.uploadDate = uploadDate;
		this.viewCounts = viewCounts;
		MapVO = mapVO;
		this.goodsThumbnail = goodsThumbnail;
		this.imgPath = imgPath;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public CategoryVO getCategoryVO() {
		return categoryVO;
	}
	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public int getViewCounts() {
		return viewCounts;
	}
	public void setViewCounts(int viewCounts) {
		this.viewCounts = viewCounts;
	}
	public MapVO getMapVO() {
		return MapVO;
	}
	public void setMapVO(MapVO mapVO) {
		MapVO = mapVO;
	}
	public String getGoodsThumbnail() {
		return goodsThumbnail;
	}
	public void setGoodsThumbnail(String goodsThumbnail) {
		this.goodsThumbnail = goodsThumbnail;
	}
	public ArrayList<String> getImgPath() {
		return imgPath;
	}
	public void setImgPath(ArrayList<String> imgPath) {
		this.imgPath = imgPath;
	}
	@Override
	public String toString() {
		return "\nGoodsVO [goodsId=" + goodsId + ", memberVO=" + memberVO + ", \ntitle=" + title + ", info=" + info
				+ ", price=" + price + ", categoryVO=" + categoryVO + ", uploadDate=" + uploadDate + ", viewCounts="
				+ viewCounts + ", \nMapVO=" + MapVO + ", goodsThumbnail=" + goodsThumbnail + ", \nimgPath=" + imgPath + "]";
	}
	
	
}
