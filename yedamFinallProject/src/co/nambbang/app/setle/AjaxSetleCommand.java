package co.nambbang.app.setle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.SetleDAO;
import co.nambbang.app.dto.SetleDto;

public class AjaxSetleCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SetleDAO dao = new SetleDAO();
		SetleDto dto = new SetleDto();
		int setleNo = (Integer.parseInt(request.getParameter("merchant_uid"))); //결제번호
		String orderMn = request.getParameter("pay_method");	//결제수단
		String setleConfmCode = request.getParameter("imp_uid"); //결제승인코드
		int setleAmount = (Integer.parseInt(request.getParameter("paid_amount"))); //결제금액
		int mlgUseAmount = (Integer.parseInt(request.getParameter("mlg_use_amount")));	//마일리지 사용금액
		String orderTelno = request.getParameter("order_Telno");	//주문전화번호
		int orderGroupNo = (Integer.parseInt(request.getParameter("order_group_no")));	//주문그룹 번호
		
		dto.setSetleNo(setleNo);
		dto.setOrderMn(orderMn);
		dto.setSetleConfmCode(setleConfmCode);
		dto.setSetleAmount(setleAmount);
		dto.setMlgUseAmount(mlgUseAmount);
		dto.setOrderGroupNo(orderGroupNo);
		dto.setOrderTelno(orderTelno);
		
		request.setAttribute("result", dao.insertSetle(dto));
		
		return "setle/setle.jsp";
	}
}
