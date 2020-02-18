package co.nambbang.app.setle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dto.SetleDto;

public class AjaxSetleCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SetleDto dto = new SetleDto();
		String setleConfmCode = request.getParameter("imp_uid");
		
		int setleNo = (Integer.parseInt(request.getParameter("merchant_uid")));
		String orderMn = request.getParameter("pay_method");
		
		int setleAmount = (Integer.parseInt(request.getParameter("imp_uid")));
		
		
		
		return null;
	}
}
