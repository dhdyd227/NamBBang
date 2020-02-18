package co.nambbang.app.dto;

import java.util.Date;

public class GoodsMainSellDto {
	private String sleId;//판매ID
	private String goodsName;//상품이름
	private int sleQy; //판매수량
	private int slePc; //판매가격
	private Date sleBeginTime; //판매시작시간
	private Date sleEndTime; //판매종료 시간
	private String goodsCl; //카테고리
	private int netPrc;  //빵판매가격
	
	//빵이미지 가져오기
	private byte[] photoFile;
	private String stringPhotoFile;
	
	
	public String getStringImage() {
		return stringPhotoFile;
	}
	public void setStringImage(String stringPhotoFile) {
		this.stringPhotoFile = stringPhotoFile;
	}
	public String getSleId() {
		return sleId;
	}
	public void setSleId(String sleId) {
		this.sleId = sleId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getSleQy() {
		return sleQy;
	}
	public void setSleQy(int sleQy) {
		this.sleQy = sleQy;
	}
	public int getSlePc() {
		return slePc;
	}
	public void setSlePc(int slePc) {
		this.slePc = slePc;
	}
	public Date getSleBeginTime() {
		return sleBeginTime;
	}
	public void setSleBeginTime(Date sleBeginTime) {
		this.sleBeginTime = sleBeginTime;
	}
	public Date getSleEndTime() {
		return sleEndTime;
	}
	public void setSleEndTime(Date sleEndTime) {
		this.sleEndTime = sleEndTime;
	}
	public String getGoodsCl() {
		return goodsCl;
	}
	public void setGoodsCl(String goodsCl) {
		this.goodsCl = goodsCl;
	}
	public int getNetPrc() {
		return netPrc;
	}
	public void setNetPrc(int netPrc) {
		this.netPrc = netPrc;
	}
	public byte[] getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(byte[] photoFile) {
		this.photoFile = photoFile;
	}


	
}
