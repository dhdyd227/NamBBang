package co.nambbang.app.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.AdminDao;
import co.nambbang.app.dto.AdminMlgDto;


public class AdminMlgManageOkCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		AdminMlgDto dto = new AdminMlgDto();		
		AdminDao dao = new AdminDao();
		
		dto.setmName(request.getParameter("s_word1"));
		dto.setsDate(request.getParameter("startDate"));
		dto.seteDate(request.getParameter("endDate"));
		
		list = dao.AdminMlgManageSelect(dto);
		
		
		
		
		
		
		request.setAttribute("list", list);
		
		String path ="/AdminMlgManage.ad";
		return path;
	}

}
