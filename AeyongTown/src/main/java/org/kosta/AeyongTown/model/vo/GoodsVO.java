package org.kosta.AeyongTown.model.vo;

import java.util.ArrayList;
import java.util.Date;

public class GoodsVO {

	private int goodsId;
	private MemberVO memberVO;
	private String title;
	private String info;
	private int price;
	private Date uploadDate;
	private int viewCounts;
	private MapVO MapVO;
	private ArrayList<GoodsImgVO> goodsImgVO;
	
	
	public GoodsVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsVO(int goodsId, MemberVO memberVO, String title, String info, int price, Date uploadDate,
			int viewCounts, org.kosta.AeyongTown.model.vo.MapVO mapVO, ArrayList<GoodsImgVO> goodsImgVO) {
		super();
		this.goodsId = goodsId;
		this.memberVO = memberVO;
		this.title = title;
		this.info = info;
		this.price = price;
		this.uploadDate = uploadDate;
		this.viewCounts = viewCounts;
		MapVO = mapVO;
		this.goodsImgVO = goodsImgVO;
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
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
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
	public ArrayList<GoodsImgVO> getGoodsImgVO() {
		return goodsImgVO;
	}
	public void setGoodsImgVO(ArrayList<GoodsImgVO> goodsImgVO) {
		this.goodsImgVO = goodsImgVO;
	}

	@Override
	public String toString() {
		return "GoodsVO [goodsId=" + goodsId + ", memberVO=" + memberVO + ", title=" + title + ", info=" + info
				+ ", price=" + price + ", uploadDate=" + uploadDate + ", viewCounts=" + viewCounts + ", MapVO=" + MapVO
				+ ", goodsImgVO=" + goodsImgVO + "]";
	}
	
	
}
