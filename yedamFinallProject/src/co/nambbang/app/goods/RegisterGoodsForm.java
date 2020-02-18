package co.nambbang.app.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nambbang.app.common.Command;

public class RegisterGoodsForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("======== RegisterGoodsForm 진입!!!");
		
		return "/sellviews/regGoods.jsp";
		}

}
