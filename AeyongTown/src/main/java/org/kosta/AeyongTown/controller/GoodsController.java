package org.kosta.AeyongTown.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/goods")
public class GoodsController {
	
	@RequestMapping(method = RequestMethod.GET, value = "/list/all")
	public String goodsListForm() {
		return "goods/goods-list.tiles";
	}
	
	@RequestMapping(method = RequestMethod.GET, value="/write")
	public String goodsWriteForm() {
		return "goods/goods-write.tiles";
	}
}
