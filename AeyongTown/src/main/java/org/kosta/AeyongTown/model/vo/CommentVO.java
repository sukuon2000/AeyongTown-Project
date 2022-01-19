package org.kosta.AeyongTown.model.vo;

public class CommentVO {
	private int goodsId;
	private int commentId;
	private int parentCommentId;
	private int commentLevel;
	private MemberVO memberVO;
	private String content;
	private String deleteAt;
	private String uploadTime;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(int goodsId, int commentId, int parentCommentId, int commentLevel, MemberVO memberVO,
			String content, String deleteAt, String uploadTime, String createDate, String updateDate,
			String deleteDate) {
		super();
		this.goodsId = goodsId;
		this.commentId = commentId;
		this.parentCommentId = parentCommentId;
		this.commentLevel = commentLevel;
		this.memberVO = memberVO;
		this.content = content;
		this.deleteAt = deleteAt;
		this.uploadTime = uploadTime;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.deleteDate = deleteDate;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getParentCommentId() {
		return parentCommentId;
	}
	public void setParentCommentId(int parentCommentId) {
		this.parentCommentId = parentCommentId;
	}
	public int getCommentLevel() {
		return commentLevel;
	}
	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDeleteAt() {
		return deleteAt;
	}
	public void setDeleteAt(String deleteAt) {
		this.deleteAt = deleteAt;
	}
	public String getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	@Override
	public String toString() {
		return "CommentVO [goodsId=" + goodsId + ", commentId=" + commentId + ", parentCommentId=" + parentCommentId
				+ ", commentLevel=" + commentLevel + ", memberVO=" + memberVO + ", content=" + content + ", deleteAt="
				+ deleteAt + ", uploadTime=" + uploadTime + ", createDate=" + createDate + ", updateDate=" + updateDate
				+ ", deleteDate=" + deleteDate + "]";
	}
	
}
