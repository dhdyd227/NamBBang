package co.nambbang.app.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nambbang.app.dto.GoodsMainSellDto;

public class GoodsSellDao extends DAO {
	// 메인화면 전체 상품 리스트
	public ArrayList<GoodsMainSellDto> mainList(Double x, Double y) {
		ArrayList<GoodsMainSellDto> list = new ArrayList<>();
//		String sql="select c.sle_id SLE_ID,a.GOODS_NAME GOODS_NAME,"
//				+ "c.sle_qy SLE_QY,c.SLE_PC SLE_PC,c.SLE_BEGIN_TIME SLE_BEGIN_TIME,"+
//				"c.SLE_END_TIME SLE_END_TIME,a.GOODS_CL GOODS_CL,a.NETPRC NETPRC"+
//				",(select photo_file from photo_stre where photo_group_id = a.PHOTO_GROUP_ID and rownum = 1 ) as PHOTO_NAME"+
//				" from GOODS_REGIST a, goods_sle c "+
//				" where a.GOODS_ID = c.GOODS_ID " +
//				" order by c.SLE_BEGIN_TIME desc ";
		String sql = "SELECT c.sle_id sle_id,\r\n" + "  a.goods_name goods_name,\r\n" + "  c.sle_qy sle_qy,\r\n"
				+ "  c.sle_pc sle_pc,\r\n" + "  c.sle_begin_time sle_begin_time,\r\n"
				+ "  c.sle_end_time sle_end_time,\r\n" + "  a.goods_cl goods_cl,\r\n" + "  a.netprc netprc,\r\n"
				+ "  i.mtlty_lc mtlty_lc,\r\n" + "  i.cmpnm cmpnm,\r\n" + "  (SELECT photo_file\r\n"
				+ "  FROM photo_stre\r\n" + "  WHERE photo_group_id = a.photo_group_id\r\n"
				+ "  AND ROWNUM           = 1\r\n" + "  ) AS photo_name,\r\n" + "  i.DSTNC\r\n"
				+ "FROM goods_regist a,\r\n" + "  goods_sle c,\r\n"
				+ "  (select s.* , round(DSTNC_CALC_FU(l.la,l.lo,3,2),10) as DSTNC\r\n" + "  from seler s,\r\n"
				+ "  seler_lcinfo l\r\n" + "  where s.seler_id = l.seler_id) i\r\n"
				+ "WHERE a.goods_id = c.goods_id\r\n" + "AND a.seler_id   = i.seler_id\r\n"
				+ " ORDER BY i.DSTNC";
	
		
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, x);
			pstmt.setDouble(2, y);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				if (rs.getBlob("PHOTO_NAME") == null) {
				} else {
					GoodsMainSellDto dto = new GoodsMainSellDto();
					dto.setSleId(rs.getString("SLE_ID"));
					dto.setGoodsName(rs.getString("GOODS_NAME"));
					dto.setSleBeginTime(rs.getTimestamp("SLE_BEGIN_TIME"));
					dto.setSleEndTime(rs.getTimestamp("SLE_END_TIME"));
					dto.setSlePc(rs.getInt("SLE_PC"));
					dto.setSleQy(rs.getInt("SLE_QY"));
					dto.setNetPrc(rs.getInt("NETPRC"));
					dto.setGoodsCl(rs.getString("GOODS_CL"));
					dto.setMtlty_lc(rs.getNString("MTLTY_LC"));
					dto.setCmpnm(rs.getString("CMPNM"));
					dto.setDstnc(rs.getDouble("DSTNC"));
					Blob blob = rs.getBlob("PHOTO_NAME");
					dto.setPhotoFile(blob.getBytes(1, (int) blob.length()));
					list.add(dto);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

}
