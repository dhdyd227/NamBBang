package co.nambbang.app.setle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.SetleDAO;
import co.nambbang.app.dto.SetleFormDTO;

public class SetleFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)			
			throws ServletException, IOException {
			SetleFormDTO dto = new SetleFormDTO();
			List<SetleFormDTO> list = new ArrayList<SetleFormDTO>();
			HttpSession session = request.getSession();
			
//			int groupno = (Integer.parseInt(request.getParameter("orderGroupNo")));
//		   	dto.setGoodsName(request.getParameter("g_name"));
			
			// user id, 판매 id, 구매수량 
			String id = (String)session.getAttribute("id"); 
			dto.setSleId(request.getParameter("s_id"));
		   	dto.setOrderQy(Integer.parseInt(request.getParameter("q_value")));
		   	
			
			
			
			SetleDAO dao = new SetleDAO();
			
			list = dao.getSetleForm("bkTEFE996082", 579 );
	
			request.setAttribute("list", list);
			request.setAttribute("groupno", 579);  //("groupno", groupno);						
			
		return "setle/setle.jsp";
	}

}
