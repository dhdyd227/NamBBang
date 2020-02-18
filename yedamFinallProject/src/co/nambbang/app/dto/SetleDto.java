package co.nambbang.app.dto;

import java.sql.Date;

public class SetleDto {
	private int setleNo;
	private String orderMn;
	private String setleConfmCode;
	private int setleAmount;
	private int mlgUseAmount;
	private Date setleDe;
	private int orderGroupNo;

	public int getSetleNo() {
		return setleNo;
	}

	public void setSetleNo(int setleNo) {
		this.setleNo = setleNo;
	}

	public String getOrderMn() {
		return orderMn;
	}

	public void setOrderMn(String orderMn) {
		this.orderMn = orderMn;
	}

	public String getSetleConfmCode() {
		return setleConfmCode;
	}

	public void setSetleConfmCode(String setleConfmCode) {
		this.setleConfmCode = setleConfmCode;
	}

	public int getSetleAmount() {
		return setleAmount;
	}

	public void setSetleAmount(int setleAmount) {
		this.setleAmount = setleAmount;
	}

	public int getMlgUseAmount() {
		return mlgUseAmount;
	}

	public void setMlgUseAmount(int mlgUseAmount) {
		this.mlgUseAmount = mlgUseAmount;
	}

	public Date getSetleDe() {
		return setleDe;
	}

	public void setSetleDe(Date setleDe) {
		this.setleDe = setleDe;
	}

	public int getOrderGroupNo() {
		return orderGroupNo;
	}

	public void setOrderGroupNo(int orderGroupNo) {
		this.orderGroupNo = orderGroupNo;
	}

	public SetleDto(int setleNo, String orderMn, String setleConfmCode, int setleAmount, int mlgUseAmount, Date setleDe,
			int orderGroupNo) {
		super();
		this.setleNo = setleNo;
		this.orderMn = orderMn;
		this.setleConfmCode = setleConfmCode;
		this.setleAmount = setleAmount;
		this.mlgUseAmount = mlgUseAmount;
		this.setleDe = setleDe;
		this.orderGroupNo = orderGroupNo;
	}

	public SetleDto() {
		super();
	}

}
