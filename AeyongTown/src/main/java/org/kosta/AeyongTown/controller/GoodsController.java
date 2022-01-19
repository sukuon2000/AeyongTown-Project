package org.kosta.AeyongTown.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kosta.AeyongTown.model.mapper.GoodsMapper;
import org.kosta.AeyongTown.model.vo.CommentVO;
import org.kosta.AeyongTown.model.vo.GoodsVO;
import org.kosta.AeyongTown.model.vo.MemberVO;
import org.kosta.AeyongTown.model.vo.PagingBean;
import org.kosta.AeyongTown.service.CommentService;
import org.kosta.AeyongTown.service.GoodsService;
import org.kosta.AeyongTown.service.MapService;
import org.kosta.AeyongTown.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/goods")
public class GoodsController {
	@Autowired
	MemberService memberService;
	@Autowired
	MapService mapService;
	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	GoodsService goodsService;
	@Autowired
	CommentService commentService;
	
	//게시물 리스트 + 페이징
	@RequestMapping(method = RequestMethod.GET, value = "/list/all/{pageNo}")
	public String goodsListForm(Model model, @PathVariable String pageNo) {
		int totalGoodsCount = goodsMapper.getTotalGoodsCount();
		model.addAttribute("totalGoodsCount", totalGoodsCount);
		
		// paging
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalGoodsCount);
		} else {
			pagingBean = new PagingBean(totalGoodsCount, Integer.parseInt(pageNo));
		}
		
		ArrayList<GoodsVO> goodsList = goodsService.getAllGoodsListByRowNumber(pagingBean.getStartRowNumber(), pagingBean.getEndRowNumber());
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("pagingBean", pagingBean);
		return "goods/goods-list.tiles";
	}
	
	//게시물 작성 폼으로 이동
	@RequestMapping(method = RequestMethod.GET, value="/writeForm")
	public String goodsWriteForm(Model model) {
		MemberVO sessionMvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = sessionMvo.getMemberId();
		MemberVO mvo = mapService.selectMemberLocation(memberId);
		model.addAttribute("mvo", mvo);
		return "goods/goods-write.tiles";
	}
	
	//게시물 작성
	@RequestMapping(method = RequestMethod.POST, value="/write")
	public String goodsWrite(GoodsVO goodsVO, @RequestParam("uploadFile") MultipartFile[] uploadFile, HttpServletRequest request) throws IOException, Exception {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		goodsVO.setMemberVO(mvo);
		// 트랜잭션 처리를 위해 모든 처리는 Service 에서 처리
		goodsService.uploadGoods(goodsVO, uploadFile, request);
		return "redirect:/goods/list/all/1";
	}
	
	// 게시물 상세보기
	@RequestMapping(method = RequestMethod.GET, value = "/{goodsId}")
	public String goodsDetail(Model model, @PathVariable int goodsId) {
		// 상품 정보
		GoodsVO goodsVO = goodsService.getGoodsDetail(goodsId);
		model.addAttribute("goods", goodsVO);
		
		//댓글
		ArrayList<CommentVO> commentList = commentService.getCommentByGoodsId(goodsId);
		model.addAttribute("commentList", commentList);
		return "goods/goods-post.tiles";
	}
	
	//댓글 작성
	@RequestMapping(method = RequestMethod.POST, value = "/writeComment/{goodsId}")
	public String commentWrite(CommentVO commentVO, @PathVariable int goodsId) {
		commentService.writeComment(commentVO.getMemberVO().getMemberId(), goodsId, commentVO.getContent());
		return "redirect:/goods/"+goodsId;
	}
	
	//대댓글 작성
	@RequestMapping(method = RequestMethod.POST, value = "/writeRecomment")
	public String recommentWrite(CommentVO commentVO) {
		int goodsId = commentVO.getGoodsId();
		commentService.writeRecomment(commentVO.getMemberVO().getMemberId(), goodsId, commentVO.getParentCommentId(),commentVO.getContent());
		return "redirect:/goods/"+goodsId;
	}
	
	//댓글 삭제
	@RequestMapping(method = RequestMethod.POST, value = "/deleteComment")
	public String commentDelete(int commentId, int goodsId)  {
		//commentService.deleteComment(commentId);
		System.out.println("commentId : "+commentId);
		System.out.println("goodsId : "+goodsId);
		return "redirect:/goods/"+goodsId;
	}
}
