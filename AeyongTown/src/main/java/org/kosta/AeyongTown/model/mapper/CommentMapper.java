package org.kosta.AeyongTown.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.AeyongTown.model.vo.CommentVO;

@Mapper
public interface CommentMapper {

	ArrayList<CommentVO> getCommemtByGoodsId(int goodsId);
	void writeComment(String memberId, int goodsId, String content);
	void writeRecomment(String memberId, int goodsId, int parentCommentId, String content);
	
	//댓글 삭제
	int countRecomment(int commentId);
	void deleteComment(int commentId);
	void setDeleteAtY(int commentId);
}
