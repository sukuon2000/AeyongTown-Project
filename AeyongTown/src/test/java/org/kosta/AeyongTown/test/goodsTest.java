package org.kosta.AeyongTown.test;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.kosta.AeyongTown.model.mapper.CommentMapper;
import org.kosta.AeyongTown.model.mapper.GoodsMapper;
import org.kosta.AeyongTown.model.vo.CommentVO;
import org.kosta.AeyongTown.model.vo.GoodsVO;
import org.kosta.AeyongTown.model.vo.MemberVO;
import org.kosta.AeyongTown.service.CommentService;
import org.kosta.AeyongTown.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class goodsTest {

	@Autowired
	GoodsService goodsService;
	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	CommentMapper commentMapper;
	@Autowired
	CommentService commentService;
	
	//@Test
	public void goodsListTest() {
		System.out.println(goodsService.getAllGoodsListByRowNumber(1, 5));
	}
	
	//@Test
	public void getGoodsDetailTest() {
		int goodsId = 1;
		GoodsVO goodsVO = goodsMapper.getGoodsDetail(goodsId);
		goodsVO.setImgPath(goodsMapper.getGoodsDetailImg(goodsId));
		MemberVO mvo = goodsMapper.getSellerAddr(goodsId);
		goodsVO.getMemberVO().setMapVO(mvo.getMapVO());
		System.out.println(goodsVO);
		if(goodsVO.getMemberVO().getMapVO() == null) {
			System.out.println(1);
		} else {
			System.out.println(0);
		}
	}
	
	//@Test
	public void getSellerAddrTest() {
		int goodsId = 1;
		MemberVO mvo = goodsMapper.getSellerAddr(goodsId);
		System.out.println(mvo);
	}
	
	@Test
	public void getCommentTest() {
		int goodsId = 21;
		ArrayList<CommentVO> cvo = new ArrayList<CommentVO>();
		cvo = commentMapper.getCommemtByGoodsId(goodsId);
		for(int i=0; i<cvo.size(); i++) {
			if(cvo.get(i).getCommentLevel()==1) {
				System.out.println("Level 1 : " + cvo.get(i).getCommentId() + ", " + cvo.get(i).getContent() + cvo.get(i).getUploadTime());
				
				for(int j=0; j<cvo.size(); j++) {
					if( cvo.get(j).getCommentLevel() > 1 && (cvo.get(i).getCommentId()==cvo.get(j).getParentCommentId()) ) {
						System.out.println("ㄴLevel 2 : " + cvo.get(j).getCommentId() + ", " + cvo.get(j).getContent()  + cvo.get(i).getUploadTime());
					}
				}
				
			}
		}
	}
	
	// 대댓글 갯수를 count한 후, 만약 대댓글이 없을 경우에는 DB에서 삭제, 대댓글이 존재할 경우 delete_at을 Y, delete_date를 sysdate로 설정한다
	//@Test
	public void deleteCommentTest() {
		int commentId = 13;
		int count = commentMapper.countRecomment(commentId);
		
		if(count==0) {
			System.out.println("대댓글이 없어 delete문 실행");
			commentMapper.deleteComment(commentId);
			System.out.println("대댓글이 없어 delete문 실행 완료");
		} else if (count >=1) {
			System.out.println("대댓글이 존재하여 delete_at Y 로 설정");
			commentMapper.setDeleteAtY(commentId);
			System.out.println("대댓글이 존재하여 delete_at Y 로 설정 완료");
		}
	}
}
