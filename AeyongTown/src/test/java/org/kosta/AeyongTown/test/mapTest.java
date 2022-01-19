package org.kosta.AeyongTown.test;

import org.junit.jupiter.api.Test;
import org.kosta.AeyongTown.model.mapper.GoodsMapper;
import org.kosta.AeyongTown.model.mapper.MapMapper;
import org.kosta.AeyongTown.service.GoodsService;
import org.kosta.AeyongTown.service.MapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class mapTest {
	@Autowired
	MapMapper mapMapper;
	@Autowired
	MapService mapService;
	@Autowired
	GoodsService goodsService;
	@Autowired
	GoodsMapper goodsMapper;

	//@Test
	public void inputUserLocationTest() {
		String code = "1114055000";
		double lat = 37.566225;
		double lng = 126.980378;
		String detail = "을지로입구역 1-1 출구 앞";
		String memberId = "test2";
		mapService.inputUserLocation(memberId, code, lat, lng, detail);
	}
	
	//@Test
	public void updateUserLocationTest() {
		String code = "1114055000";
		double lat = 37.566033;
		double lng = 126.989408;
		String detail = "";
		String memberId = "testtest";
		mapService.updateUserLocation(memberId, code, lat, lng, detail);
	}
	
	@Test
	public void uploadGoodsLocationTest() {
		String memberId = "testtest";
		String title = "갤럭시 노트8 팝니다"; 
		String info = "디스플레이 맛탱이 갔어요"; 
		int price = 10000;
		goodsMapper.uploadGoodsContents(memberId, 1, title, info, price);
		
		String code = "1114060500";
		double lat = 37.566835;
		double lng = 126.998857;
		String detail = "을지로4가역 6번 출구 앞";
		mapMapper.uploadGoodsLocation(code, lat, lng, detail);
	}
}
