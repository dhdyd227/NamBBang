package co.nambbang.app.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nambbang.app.dto.UsersMyPageDto;

public class UsersMyPageDao extends DAO {
	public ArrayList<UsersMyPageDto> myPageList(String id){
		
		ArrayList<UsersMyPageDto> list = new ArrayList<>();
		
		String sql="select PHOTO_NAME,GOODS_NAME,ORDER_QY,SETLE_CODE,ORDER_ID,ORDER_GROUP_NO,imglist.SLE_ID SLE_ID" + 
				" from " + 
				" (select c.sle_id SLE_ID,a.GOODS_NAME GOODS_NAME,c.sle_qy SLE_QY,c.SLE_PC SLE_PC," + 
				" c.SLE_BEGIN_TIME SLE_BEGIN_TIME, c.SLE_END_TIME SLE_END_TIME," + 
				" a.GOODS_CL GOODS_CL,a.NETPRC NETPRC" + 
				" ,(select photo_file from photo_stre where photo_group_id = a.PHOTO_GROUP_ID and rownum = 1 ) as PHOTO_NAME" + 
				" from GOODS_REGIST a, goods_sle c " + 
				" where a.GOODS_ID = c.GOODS_ID) imglist," + 
				" (select order_id,order_qy,sle_id,order_group_no,SETLE_CODE" + 
				" from ORDERS ord,(select se.ORDER_GROUP_NO ORDER_GROUP_NO_1,SETLE_CODE" + 
				"                 from SETLE se, ORDER_GROUP og" + 
				"                 where se.ORDER_GROUP_NO =og.ORDER_GROUP_NO and user_id=?) seog  " + 
				" where ord.ORDER_GROUP_NO = seog.ORDER_GROUP_NO_1) orderlist" + 
				" where imglist.SLE_ID = orderlist.SLE_ID";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				if(rs.getBlob("PHOTO_NAME")==null) {
				}
				else {
					UsersMyPageDto dto = new UsersMyPageDto();
					dto.setGoodsName(rs.getString("GOODS_NAME"));
					dto.setOrderGroupNo(rs.getInt("ORDER_GROUP_NO"));
					dto.setOrderId(rs.getString("ORDER_ID"));
					dto.setOrderQy(rs.getString("ORDER_QY"));
					dto.setSetleCode(rs.getString("SETLE_CODE"));
					dto.setSleId(rs.getString("SLE_ID"));
					Blob blob = rs.getBlob("PHOTO_NAME");
					dto.setPhotoName(blob.getBytes(1, (int)blob.length()));
					list.add(dto);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	
}
