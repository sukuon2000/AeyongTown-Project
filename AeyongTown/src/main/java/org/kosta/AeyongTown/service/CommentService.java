package org.kosta.AeyongTown.service;

import java.util.ArrayList;

import org.kosta.AeyongTown.model.vo.CommentVO;

public interface CommentService {

	ArrayList<CommentVO> getCommentByGoodsId(int goodsId);
	void writeComment(String memberId, int goodsId, String content);
	void writeRecomment(String memberId, int goodsId, int parentCommentId, String content);
	
	void deleteComment(int commentId);
}
