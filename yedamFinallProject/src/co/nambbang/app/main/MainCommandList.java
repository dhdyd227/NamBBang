package co.nambbang.app.main;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.GoodsSellDao;
import co.nambbang.app.dto.GoodsMainSellDto;

public class MainCommandList implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//메인 화면 상품 리스트 출력
		
		GoodsSellDao Dao = new GoodsSellDao();
		ArrayList<GoodsMainSellDto> list = Dao.mainList();
		
		Double x = Double.parseDouble(request.getParameter("x"));
		Double y = Double.parseDouble(request.getParameter("y"));
		
		HttpSession session = request.getSession();
		session.setAttribute("x", x);
		session.setAttribute("y", y);
		
		System.out.println("x:"+ x);
		System.out.println("y:"+ y);
		
		for (int i = 0; i < list.size(); i++) {
			String imageString = new String(Base64.encodeBase64(list.get(i).getPhotoFile()));
			String changeString ="data:image/jpg;base64, "+ imageString;
			list.get(i).setStringImage(changeString);
			
		}
			
		request.setAttribute("GoodsMain", list);
			return "userviews/index.jsp";
			
	}

}
