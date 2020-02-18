package co.nambbang.app.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nambbang.app.dto.GoodsMainSellDto;

public class GoodsSellDao extends DAO {
	//메인화면 전체 상품 리스트
	public ArrayList<GoodsMainSellDto> mainList(){
		ArrayList<GoodsMainSellDto> list = new ArrayList<>();
		String sql="select c.sle_id SLE_ID,a.GOODS_NAME GOODS_NAME,"
				+ "c.sle_qy SLE_QY,c.SLE_PC SLE_PC,c.SLE_BEGIN_TIME SLE_BEGIN_TIME,"+
				"c.SLE_END_TIME SLE_END_TIME,a.GOODS_CL GOODS_CL,a.NETPRC NETPRC"+
				",(select photo_file from photo_stre where photo_group_id = a.PHOTO_GROUP_ID and rownum = 1 ) as PHOTO_NAME"+
				" from GOODS_REGIST a, goods_sle c "+
				" where a.GOODS_ID = c.GOODS_ID";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GoodsMainSellDto dto = new GoodsMainSellDto();
				dto.setSleId(rs.getString("SLE_ID"));
				dto.setGoodsName(rs.getString("GOODS_NAME"));
				dto.setSleBeginTime(rs.getDate("SLE_BEGIN_TIME"));
				dto.setSleEndTime(rs.getDate("SLE_END_TIME"));
				dto.setSlePc(rs.getInt("SLE_PC"));
				dto.setSleQy(rs.getInt("SLE_QY"));
				dto.setNetPrc(rs.getInt("NETPRC"));
				dto.setGoodsCl(rs.getString("GOODS_CL"));
				
				Blob blob = rs.getBlob("PHOTO_NAME");
				dto.setPhotoFile(blob.getBytes(1, (int)blob.length()));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}

	
}
