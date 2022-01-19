package org.kosta.AeyongTown.service;

import java.util.ArrayList;

import org.kosta.AeyongTown.model.mapper.CommentMapper;
import org.kosta.AeyongTown.model.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper commentMapper;
	
	@Override
	public ArrayList<CommentVO> getCommentByGoodsId(int goodsId) {
		return commentMapper.getCommemtByGoodsId(goodsId);
	}

	@Override
	public void writeComment(String memberId, int goodsId, String content) {
		commentMapper.writeComment(memberId, goodsId, content);
	}

	@Override
	public void writeRecomment(String memberId, int goodsId, int parentCommentId, String content) {
		commentMapper.writeRecomment(memberId, goodsId, parentCommentId, content);
	}

	@Override
	public void deleteComment(int commentId) {
		// 대댓글 갯수를 세는 쿼리 실행 후 결과값을 count 객체에 넣어줌
		int count = commentMapper.countRecomment(commentId);
		
		// 대댓글 갯수가 0개일 경우 댓글 delete 쿼리문 실행, 대댓글이 하나라도 존재할 경우 delete_at 을 "Y" 로 설정하고 delete_date를 sysdate로 설정
		if(count==0) {
			commentMapper.deleteComment(commentId);
		} else if (count >=1) {
			commentMapper.setDeleteAtY(commentId);
		}
	}

}
