package org.kosta.AeyongTown.model.vo;

public class MapVO {
	private String code;
	private float lat;
	private float lnt;
	private String sido;
	private String sigungu;
	private String dong;
	private String detail;
	public MapVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MapVO(String code, float lat, float lnt, String sido, String sigungu, String dong, String detail) {
		super();
		this.code = code;
		this.lat = lat;
		this.lnt = lnt;
		this.sido = sido;
		this.sigungu = sigungu;
		this.dong = dong;
		this.detail = detail;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLnt() {
		return lnt;
	}
	public void setLnt(float lnt) {
		this.lnt = lnt;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "MapVO [행정구역 코드=" + code + ", 위도=" + lat + ", 경도=" + lnt + ", (시,도=" + sido + "), (시군구=" + sigungu
				+ "), (동=" + dong + "), (상세주소=" + detail + ")]";
	}
	
	
}
