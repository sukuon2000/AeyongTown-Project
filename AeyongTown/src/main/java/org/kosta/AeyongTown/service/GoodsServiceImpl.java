package org.kosta.AeyongTown.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;
import org.kosta.AeyongTown.model.mapper.GoodsMapper;
import org.kosta.AeyongTown.model.mapper.MapMapper;
import org.kosta.AeyongTown.model.vo.GoodsVO;
import org.kosta.AeyongTown.model.vo.MapVO;
import org.kosta.AeyongTown.model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	MapMapper mapMapper;

	/** * 썸네일을 생성합니다. * 250 x 150 크기의 썸네일을 만듭니다. */ 
	private void makeThumbnail(String filePath, String fileName, String fileExtension) throws Exception { 
		// 저장된 원본파일로부터 BufferedImage 객체를 생성 
		System.out.println("[썸네일 생성 전 파일 불러오기]" + filePath + fileName);
		BufferedImage srcImg = ImageIO.read(new File(filePath + fileName)); 
		// 썸네일의 너비와 높이
		int dw = 250, dh = 150; 
		// 원본 이미지의 너비와 높이. 
		int ow = srcImg.getWidth(); 
		int oh = srcImg.getHeight(); 
		
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산함 
		int nw = ow; 
		int nh = (ow * dh) / dw; 
		// 계산된 높이가 원본보다 높다면 crop이 안되므로 
		// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산함 
		if(nh > oh) { 
			nw = (oh * dw) / dh; nh = oh; 
		} 
		// 계산된 크기로 원본이미지를 가운데에서 crop  
		BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh); 
		// crop된 이미지로 썸네일을 생성 
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh); 
		// 썸네일을 저장. 이미지 이름 앞에 "THUMB_" 를 붙여 표시 
		String thumbName = filePath + "THUMB_" + fileName; 
		File thumbFile = new File(thumbName); 
		String fileExt = fileExtension.substring(1).toUpperCase();
		
		System.out.println("[썸네일 생성 파일 타입] " + fileExtension.toUpperCase());
		System.out.println("[substring] " + fileExt);
		// 파일 생성
		ImageIO.write(destImg, fileExt, thumbFile); 
	}
	

	
	@Transactional
	@Override
	public void uploadGoods(GoodsVO goodsVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception, IOException {
		// TODO Auto-generated method stub
		System.out.println(goodsVO);
		// DB에 컨텐츠 내용 저장
		goodsMapper.uploadGoodsContents(goodsVO.getMemberVO().getMemberId(), 
					goodsVO.getCategoryVO().getCategoryId(), goodsVO.getTitle(), goodsVO.getInfo(), goodsVO.getPrice());
		// DB에 지도데이터 저장
		MapVO mapVO = goodsVO.getMapVO();
		mapMapper.uploadGoodsLocation(mapVO.getCode(), mapVO.getLat(), mapVO.getLng(), mapVO.getDetail());
		String filePath = request.getServletContext().getRealPath("upload/");
		String originalFile;
		String originalFileExtension;
		String saveFileName;
		ArrayList<String> imgPath = new ArrayList<String>();
		
		// input file 에 null이 있으면 에러발생중 (if문으로 비어있으면 넘겨버리는 작업 해야할듯)
		for(int i=0; i<6; i++) {
			MultipartFile inputFile = uploadFile[i];
			// 1번이미지를 제외한 이미지 input 칸이 null일 경우 (2번 이미지가 비어있고 3번에 넣어도 오류가 안나게끔)
			if(inputFile == null || inputFile.isEmpty()) {
				continue;
			} else if(inputFile != null || !inputFile.isEmpty()) {
				//원본 파일 명을 받는다
				originalFile = inputFile.getOriginalFilename();
				System.out.println("원본파일명 : " + originalFile);
				// 확장자명을 잘라낸다 (.jpg, .png 등등)
				originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
				// UUID를 통해 랜덤으로 파일명을 생성하고 잘라낸 확장자 명을 더한다 (c15a3617-99c6-4ce9-8fb2-b5b8d4f2063c.png)
				saveFileName = UUID.randomUUID() + originalFileExtension;
				imgPath.add(saveFileName);
				goodsVO.setImgPath(imgPath);
				
				//파일 생성
				File file = new File(filePath + saveFileName);
				System.out.println("[파일 절대 경로]" + file.getAbsolutePath());
				System.out.println("[파일 저장 경로]" + filePath + saveFileName);
				inputFile.transferTo(file);
				
				// 썸네일 생성
				if(i==0) {
					makeThumbnail(filePath, saveFileName, originalFileExtension);
				}
				
				// DB에 경로 저장
				goodsMapper.uploadGoodsImg(i+1, saveFileName);
			}
		}
		System.out.println(goodsVO);
	}

	@Override
	public ArrayList<GoodsVO> getAllGoodsListByRowNumber(int startRowNumber, int endRowNumber) {
		// TODO Auto-generated method stub
		return goodsMapper.getAllRecipeListByRowNumber(startRowNumber, endRowNumber);
	}



	@Override
	public GoodsVO getGoodsDetail(int goodsId) {
		GoodsVO goodsVO = goodsMapper.getGoodsDetail(goodsId);
		goodsVO.setImgPath(goodsMapper.getGoodsDetailImg(goodsId));
		// 판매자 위치 받아오기
		MemberVO mvo = goodsMapper.getSellerAddr(goodsId);
		goodsVO.getMemberVO().setMapVO(mvo.getMapVO());
		return goodsVO;
	}
}
