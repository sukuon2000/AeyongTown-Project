package org.kosta.AeyongTown.model.vo;

public class MapVO {
	private String code;
	private double lat;
	private double lng;
	private String sido;
	private String sigungu;
	private String dong;
	private String detail;
	public MapVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MapVO(String code, double lat, double lng, String sido, String sigungu, String dong, String detail) {
		super();
		this.code = code;
		this.lat = lat;
		this.lng = lng;
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
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
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
		return "MapVO [code=" + code + ", lat=" + lat + ", lng=" + lng + ", sido=" + sido + ", sigungu=" + sigungu
				+ ", dong=" + dong + ", detail=" + detail + "]";
	}
}
