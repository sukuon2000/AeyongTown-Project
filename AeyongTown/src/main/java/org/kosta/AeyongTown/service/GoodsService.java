package org.kosta.AeyongTown.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kosta.AeyongTown.model.vo.GoodsVO;
import org.springframework.web.multipart.MultipartFile;

public interface GoodsService {
	void uploadGoods(GoodsVO goodsVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception, IOException;
	ArrayList<GoodsVO> getAllGoodsListByRowNumber(int startRowNumber, int endRowNumber);
	GoodsVO getGoodsDetail(int goodsId);
}
