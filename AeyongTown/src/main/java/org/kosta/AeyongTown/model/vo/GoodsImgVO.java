package org.kosta.AeyongTown.model.vo;

public class GoodsImgVO {
	private int goodsId;
	private int imgNo;
	private String imgPath;
	public GoodsImgVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsImgVO(int goodsId, int imgNo, String imgPath) {
		super();
		this.goodsId = goodsId;
		this.imgNo = imgNo;
		this.imgPath = imgPath;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	@Override
	public String toString() {
		return "GoodsImgVO [goodsId=" + goodsId + ", 이미지번호=" + imgNo + ", 경로=" + imgPath + "]";
	}
	
	
}
