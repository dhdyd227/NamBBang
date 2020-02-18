package co.nambbang.app.seller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.sellerDAO;
import co.nambbang.app.dto.sellerDTO;

public class BoardWriteOK implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n = 0;
		sellerDTO dto = new sellerDTO();
		sellerDAO dao = new sellerDAO();
		
		dto.setOpen(request.getParameter("open"));
		dto.setClose(request.getParameter("close"));
		dto.setSname(request.getParameter("sname"));
		dto.setLc(request.getParameter("lc"));
		dto.setName(request.getParameter("name"));
		dto.setNo(request.getParameter("no"));
		dto.setPhoto(request.getParameter("photo"));
		dto.setSns(request.getParameter("sns"));
		dto.setIntrcn(request.getParameter("intrcn"));
		dto.setStatus(request.getParameter("status"));
		dto.setGrade(request.getParameter("grade"));
		
		n = dao.insert(dto);
		
		String path = null;
		if (n != 0) {
			return "redirect:boardlist.do"; // 성공시 목록 보여주기
		} else {
			return "sellerRegi/view/boardinsertfail.jsp"; // 실패시 실패 페이지 보여주기

		}
	

	}

}
