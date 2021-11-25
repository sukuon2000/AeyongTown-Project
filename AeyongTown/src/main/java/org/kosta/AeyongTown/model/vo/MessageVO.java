package org.kosta.AeyongTown.model.vo;

import java.util.Date;

public class MessageVO {
	private MemberVO memberVO;
	private GoodsVO goodsVO;
	private String message;
	private Date sendDate;
	
	public MessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MessageVO(MemberVO memberVO, GoodsVO goodsVO, String message, Date sendDate) {
		super();
		this.memberVO = memberVO;
		this.goodsVO = goodsVO;
		this.message = message;
		this.sendDate = sendDate;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public GoodsVO getGoodsVO() {
		return goodsVO;
	}
	public void setGoodsVO(GoodsVO goodsVO) {
		this.goodsVO = goodsVO;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	@Override
	public String toString() {
		return "MessageVO [memberVO=" + memberVO + ", goodsVO=" + goodsVO + ", message=" + message + ", sendDate="
				+ sendDate + "]";
	}
}
