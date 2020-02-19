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
			List<SetleFormDTO> list = new ArrayList<SetleFormDTO>();
//			String id = request.getParameter("userId");
//			int groupno = (Integer.parseInt(request.getParameter("orderGroupNo")));
			
			SetleDAO dao = new SetleDAO();
			
			list = dao.getSetleForm("bkTEFE996082", 579 );
	
			request.setAttribute("list", list);
			request.setAttribute("groupno", 579);  //("groupno", groupno);
			
			
			HttpSession session = request.getSession();
			session.setAttribute("mlg", 2300);
			
		return "setle/setle.jsp";
	}

}
