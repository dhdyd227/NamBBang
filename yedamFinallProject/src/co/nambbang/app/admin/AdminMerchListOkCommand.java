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
import co.nambbang.app.dto.AdminMerchListDto;
import co.nambbang.app.dto.AdminPagingDto;

public class AdminMerchListOkCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		AdminMerchListDto dto = new AdminMerchListDto();
		AdminPagingDto pDto = new AdminPagingDto();
		AdminDao dao = new AdminDao();
				
	
		
//		System.out.println(name);
		
		String name = request.getParameter("search_word");
		String sTime = request.getParameter("rTime");
		String eTime = request.getParameter("eTime");
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		 
		
		if(sTime != null && sTime.equals("시간 선택")) {
			sTime = null;
		}
		if(eTime != null && eTime.equals("시간 선택")) {
			eTime = null;
		}
		if(sDate != null && sDate.equals("")) {
			sDate = null;
		}
		if(eDate != null && eDate.equals("")) {
			eDate = null;
		}
		
		
		dto.setmCtg(request.getParameter("category"));		
		dto.setsDate(sDate);
		dto.seteDate(eDate);
		dto.setsTime(sTime);
		dto.seteTime(eTime);
		dto.setmStat(request.getParameter("chk"));
		dto.setSort(request.getParameter("sort"));
		System.out.println(request.getParameter("sort"));
		
		//페이징 변수  + 처리 
		int p = 1;
		String pa = request.getParameter("page");
		if(pa != null) {
			 p = Integer.parseInt(pa);
		}		
		int pageunit = Integer.parseInt(request.getParameter("pageCnt"));
		int start = (p-1) * pageunit + 1; // 1 -> 1, 3
		int end = start + pageunit - 1;  // 2-> 4, 6
		pDto.setStart(start);
		pDto.setEnd(end);
		pDto.setPageUnit(pageunit);
		
		int totalrecord = dao.MerchListPageCnt(dto, name);
		
		int lastPage = totalrecord / pageunit + ((totalrecord % pageunit > 0) ? 1: 0);
		
		pDto.setLastPage(lastPage);
		pDto.setTotalCnt(totalrecord); // 검색 결과 총 몇건인지 전달할 Dto
		
		request.setAttribute("pDto", pDto);		 // 페이징 값 전달 Dto
		request.setAttribute("sDto", dto);		 // 검색 조건 전달 Dto 
		request.setAttribute("name", name);		 // 검색 조건 전달 Dto
		
		list = dao.selectMerchList(dto, name, pDto);		
//		System.out.println(dto);
//		System.out.println("--------------"+lastPage);
		request.setAttribute("list", list);     // 검색 결과 전달 List

		
		String path = "/AdminMerchList.ad";
		
		return path;
	}

}
