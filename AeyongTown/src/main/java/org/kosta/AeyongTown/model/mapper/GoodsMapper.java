package org.kosta.AeyongTown.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.AeyongTown.model.vo.GoodsVO;
import org.kosta.AeyongTown.model.vo.MemberVO;

@Mapper
public interface GoodsMapper {
	int getTotalGoodsCount();
	void uploadGoodsContents(String memberId, int categoryId, String title, String info, int price);
	void uploadGoodsImg(int index, String imgPath);
	ArrayList<GoodsVO> getAllRecipeListByRowNumber(int startRowNumber, int endRowNumber);
	GoodsVO getGoodsDetail(int goodsId);
	ArrayList<String> getGoodsDetailImg(int goodsId);
	MemberVO getSellerAddr(int goodsId);
}
