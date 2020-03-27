package co.nambbang.app.goods;

public class SellLogDTO {
	private String gName;
    private String gId;
    private String sleId;
    private int orderQy;
    private String userId;
    private String setle_de;
    private int setle_amount;
    
    
    
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getSleId() {
		return sleId;
	}
	public void setSleId(String sleId) {
		this.sleId = sleId;
	}
	public int getOrderQy() {
		return orderQy;
	}
	public void setOrderQy(int orderQy) {
		this.orderQy = orderQy;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSetle_de() {
		return setle_de;
	}
	public void setSetle_de(String setle_de) {
		this.setle_de = setle_de;
	}
	public int getSetle_amount() {
		return setle_amount;
	}
	public void setSetle_amount(int setle_amount) {
		this.setle_amount = setle_amount;
	}
	@Override
	public String toString() {
		return "SellLogDTO [gName=" + gName + ", gId=" + gId + ", sleId=" + sleId + ", orderQy=" + orderQy + ", userId="
				+ userId + ", setle_de=" + setle_de + ", setle_amount=" + setle_amount + "]";
	}
    
    
}
