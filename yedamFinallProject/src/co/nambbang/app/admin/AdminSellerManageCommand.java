package co.nambbang.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.AdminDao;
import co.nambbang.app.dto.AdminMainDto;

public class AdminSellerManageCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminMainDto dto = new AdminMainDto();
		AdminDao dao = new AdminDao();
		dto = dao.selectAll();
		
		int cancel = dto.getCustomerCnt();
		
		request.setAttribute("cancelCnt", cancel);
		
		
		
		
		String path ="/adminviews/sellerManage.jsp";
		return path;
	}

}
