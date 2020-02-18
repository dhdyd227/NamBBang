package co.nambbang.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import co.nambbang.app.dto.AdminMainDto;
import co.nambbang.app.dto.AdminMerchListDto;
import co.nambbang.app.dto.AdminPagingDto;
import co.nambbang.app.dto.AdminSetleManageDto;
import co.nambbang.app.dto.AdminUserDto;
import co.nambbang.app.dto.NoticeDto;

public class AdminDao extends DAO {

	public AdminDao() {
		super();
	}
	// 메인 페이지 하단 공지사항 select
	public ArrayList<NoticeDto> NselectAll() { 
		ArrayList<NoticeDto> list = new ArrayList<>();

		String sql = "select notice_no, notice_sj, notice_cn, writng_de, rdcnt"
				+ " from mngr_notice order by notice_no desc";
//		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeDto dto = new NoticeDto();
				dto.setnNo(rs.getInt("notice_no"));
				dto.setnSj(rs.getString("notice_sj"));
				dto.setnCn(rs.getString("notice_cn"));
				dto.setnDe(rs.getDate("writng_de"));
				dto.setnCnt(rs.getInt("rdcnt"));
				list.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public AdminMainDto selectAll() { // 메인 페이지 대시보드 select
		AdminMainDto dto = new AdminMainDto();
		String sql = "select " + "(select count(o.order_id) " + "from goods_sle g, orders o "
				+ "where g.sle_id = o.sle_id "
				+ "and to_char(rgsde, 'rr/mm/dd') = to_char(sysdate, 'rr/mm/dd')) as order_cnt,"
				+ "(select sum(g.sle_pc*o.order_qy) " + "from goods_sle g, orders o " + "where g.sle_id = o.sle_id "
				+ "and to_char(rgsde, 'rr/mm/dd') = to_char(sysdate, 'rr/mm/dd')) as order_sum,"
				+ "(select count(setle_no) " + "from setle "
				+ "where to_char(setle_de, 'rr/mm/dd') = to_char(sysdate, 'rr/mm/dd')) as setle_cnt,"
				+ "(select sum(setle_amount) " + "from setle "
				+ "where to_char(setle_de, 'rr/mm/dd') = to_char(sysdate, 'rr/mm/dd')) as setle_sum,"
				+ "(select count(u.setle_no) " + "from user_refnd u, setle s " + "where u.setle_no = s.setle_no "
				+ "and to_char(s.setle_de,'rr/mm/dd') = to_char(sysdate, 'rr/mm/dd')) as refund_cnt,"
				+ "(select sum(s.setle_amount) " + "from user_refnd u, setle s " + "where u.setle_no = s.setle_no "
				+ "and to_char(s.setle_de,'rr/mm/dd') = to_char(sysdate, 'rr/mm/dd')) as refund_sum,"
				+ "(select count(goods_id) " + "from goods_regist) as goods_cnt," + "(select count(s.seler_id) "
				+ "from goods_sle g, goods_regist r, seler s " + "where g.goods_id = r.goods_id "
				+ "and r.seler_id  = s.seler_id " + "and g.goos_sle_result is null) as selling_seler,"
				+ "(select count(sle_end_time) " + "from goods_sle "
				+ "where sle_end_time between sysdate+1/24/2 and sysdate) as about_over_goods,"
				+ "(select count(user_id) " + "from users) as user_cnt," + "(select count(seler_id) "
				+ "from seler) as seler_cnt," + "(select count(sle_id) " + "from goods_cancl "
				+ "where cancl_de = sysdate) as goods_cancl_cnt," + "(select sum(g.sle_qy*g.sle_pc) "
				+ "from goods_sle g, goods_cancl c " + "where g.sle_id = c.sle_id "
				+ "and c.cancl_de = sysdate) as goods_cancl_sum " + "from dual";
//		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new AdminMainDto();
				dto.setOrderCnt(rs.getInt("order_cnt"));
				dto.setOrderSum(rs.getInt("order_sum"));
				dto.setSelerCnt(rs.getInt("setle_cnt"));
				dto.setSetleSum(rs.getInt("setle_sum"));
				dto.setRefundCnt(rs.getInt("refund_cnt"));
				dto.setRefundSum(rs.getInt("refund_sum"));
				dto.setGoodsCnt(rs.getInt("goods_cnt"));
				dto.setSellingSeler(rs.getInt("selling_seler"));
				dto.setOverGoods(rs.getInt("about_over_goods"));
				dto.setUserCnt(rs.getInt("user_cnt"));
				dto.setSelerCnt(rs.getInt("seler_cnt"));
				dto.setGoodsCanclCnt(rs.getInt("goods_cancl_cnt"));
				dto.setGoodsCanclSum(rs.getInt("goods_cancl_sum"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return dto;
	}

	// 목록관리 페이징 처리
	public int MerchListPageCnt(AdminMerchListDto dto, String name) {
		int lastpage = 0;
		String and = "and 1=1";

		if (dto != null) {
			if (dto.getmCtg().equals("name") && !name.isEmpty()) {
				and += " and g.goods_name like '%'|| ? ||'%' ";
			}
			System.out.println("name is null?======="+ name != null);
			if (dto.getmCtg().equals("id") && !name.isEmpty()) {
				and += " and g.goods_id = ?";
			}
			if (dto.getmCtg().equals("sleId") && !name.isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				and += " and g.rgsde between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')";
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				and += " and g.rgsde between ? and sysdate";
			}
			if (dto.getsTime() != null) {
				and += " and to_char(gs.sle_begin_time,'hh24mi') >= ?";// String type으로 비교
			}
			if (dto.geteTime() != null) {
				and += " and to_char(gs.sle_end_time,'hh24mi') <= ?";// String type으로 비교
			}
			if (dto.getmStat() != null && dto.getmStat().equals("onSale")) {
				and += " and gs.goos_sle_result is null ";
			}
			if (dto.getmStat() != null && dto.getmStat().equals("cancel")) {
				and += " and goos_sle_result = 'C' ";
			}
			if (dto.getmStat() != null && dto.getmStat().equals("complete")) {
				and += " and gs.goos_sle_result is not null ";
			}
			if (dto.getmStat() != null && dto.getmStat().equals("part")) {
				and += " and gs.goos_sle_result = 'P' ";
			}
			if (dto.getmStat() != null && dto.getmStat().equals("soldOut")) {
				and += " and gs.goos_sle_result = 'A' ";
			}
		}
		String sql = "select count(*) cnt " + "from goods_regist g, seler s, goods_sle gs "
				+ "where g.seler_id = s.seler_id " + "and g.goods_id = gs.goods_id " + and + " order by ? ";

		
		int i = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			if (dto.getmCtg().equals("name") && !name.isEmpty()) {
				pstmt.setString(++i, name);
			}
			if (dto.getmCtg().equals("id") && !name.isEmpty()) {
				pstmt.setString(++i, name);
			}
			if (dto.getmCtg().equals("sleId") && !name.isEmpty()) {
				pstmt.setString(++i, name);
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
			}
			if (dto.getsTime() != null) {
				pstmt.setString(++i, dto.getsTime());
			}
			if (dto.geteTime() != null) {
				pstmt.setString(++i, dto.geteTime());
			}
			
			pstmt.setString(++i, dto.getSort());
			System.out.println(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				lastpage = rs.getInt("cnt");
//					System.out.println("lastpage= " + lastpage);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//					close();
		}

		return lastpage;

	}

	/// 물품 목록 관리 페이지 검색
	public List<HashMap<String, Object>> selectMerchList(AdminMerchListDto dto, String name, AdminPagingDto pDto) {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String and = "and 1=1";

		if (dto != null) {
			if (dto.getmCtg().equals("name") && !name.isEmpty()) {
				and += " and g.goods_name like '%'|| ? ||'%' ";
			}
			if (dto.getmCtg().equals("id") && !name.isEmpty()) {
				and += " and g.goods_id = ?";
			}
			if (dto.getmCtg().equals("sleId") && !name.isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				and += " and g.rgsde between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')";
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				and += " and g.rgsde between ? and sysdate";
			}
			if (dto.getsTime() != null) {
				and += " and to_char(gs.sle_begin_time,'hh24mi') >= ?";// String type으로 비교
			}
			if (dto.geteTime() != null) {
				and += " and to_char(gs.sle_end_time,'hh24mi') <= ?";// String type으로 비교
			}
			if (dto.getmStat() != null && dto.getmStat().equals("onSale")) {
				and += " and gs.goos_sle_result is null ";
			}
			if (dto.getmStat() != null && dto.getmStat().equals("cancel")) {
				and += " and goos_sle_result = 'C' ";
			}
			if (dto.getmStat() != null && dto.getmStat().equals("complete")) {
				and += " and gs.goos_sle_result is not null ";
			}
			if (dto.getmStat() != null && dto.getmStat().equals("part")) {
				and += " and gs.goos_sle_result = 'P' ";
			}
			if (dto.getmStat() != null && dto.getmStat().equals("soldOut")) {
				and += " and gs.goos_sle_result = 'A' ";
			}
			
		}
		String sql = "select * from( select rownum rn, a.* from ( " + "select g.goods_info, g.goods_id, g.goods_name, "
				+ "g.rgsde, g.netprc, g.seler_id, s.cmpnm, gs.GOOS_SLE_RESULT "
				+ "from goods_regist g, seler s, goods_sle gs " + "where g.seler_id = s.seler_id "
				+ "and g.goods_id = gs.goods_id " + and + " order by ? " + ") a ) b where rn between ? and ?";
		
		int i = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			if (dto.getmCtg().equals("name") && !name.isEmpty()) {
				pstmt.setString(++i, name);
			}
			if (dto.getmCtg().equals("id") && !name.isEmpty()) {
				pstmt.setString(++i, name);
			}
			if (dto.getmCtg().equals("sleId") && !name.isEmpty()) {
				pstmt.setString(++i, name);
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
			}
			if (dto.getsTime() != null) {
				pstmt.setString(++i, dto.getsTime());
			}
			if (dto.geteTime() != null) {
				pstmt.setString(++i, dto.geteTime());
			}
			
			// sort 컬럼 - 작동안함. ???
			pstmt.setString(++i, dto.getSort());
			
			System.out.println("sort="+dto.getSort());
			// 페이징 변수 넣기	
			pstmt.setInt(++i, pDto.getStart());
			pstmt.setInt(++i, pDto.getEnd());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", rs.getString("goods_id"));
				map.put("name", rs.getString("goods_name"));
				map.put("date", rs.getDate("rgsde"));
				map.put("price", rs.getInt("netprc"));
				map.put("info", rs.getString("goods_info"));
				map.put("selerId", rs.getString("seler_id"));
				map.put("cName", rs.getString("cmpnm"));
				map.put("stat", rs.getString("goos_sle_result"));
				list.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}		
		return list;
	}
	// 결제관리 검색 
	public List<HashMap<String, Object>> selectSetleManage(AdminSetleManageDto dto, AdminPagingDto pDto) {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String and = "and 1=1";

		if (dto != null) {
			if(dto.getsCtg().equals("o_group") && !dto.getName1().isEmpty()) {
				and += " and o.order_group_no = ?";
			}
			if(dto.getsCtg().equals("setleId") && !dto.getName1().isEmpty()) {
				and += " and o.order_id = ?";
			}
			if(dto.getsCtg().equals("uId") && !dto.getName1().isEmpty()) {
				and += " and og.user_id = ?";
			}
			if(dto.getsCtg().equals("amount") && !dto.getName1().isEmpty()) {
				and += " and s.setle_amount = ?";
			}
			if(dto.getsCtg().equals("id") && !dto.getName1().isEmpty()) {
				and += " and gs.goods_id = ?";
			}
			if(dto.getsCtg().equals("name") && !dto.getName1().isEmpty()) {
				and += " and gr.goods_name = ?";
			}
			if(dto.getsCtg().equals("sleId") && !dto.getName1().isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if(dto.getsCtg2().equals("name") && !dto.getName2().isEmpty()) {
				and += " and gr.goods_name = ?";
			}
			if(dto.getsCtg2().equals("id") && !dto.getName2().isEmpty()) {
				and += " and gs.goods_id = ?";
			}
			if(dto.getsCtg2().equals("setleId") && !dto.getName2().isEmpty()) {
				and += " and s.setle_no = ?";
			}
			if(dto.getsCtg2().equals("sleId") && !dto.getName2().isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				and += " and og.order_setlede between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')";
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				and += " and og.order_setlede between ? and sysdate";
			}
			if (dto.getTime() != null) {
				and += " and to_char(og.order_setlede,'hh24mi') >= ?";// String type으로 비교
			}
			if (dto.getStat() != null && dto.getStat().equals("complete")) {
				and += " and s.setle_code = 'SC' ";
			}
			if (dto.getStat() != null && dto.getStat().equals("refund")) {
				and += " and s.setle_code = 'RC' ";
			}
		}
		
		
		String sql ="select * from( select rownum rn, a.* from ( " +  
				"select o.order_id, o.order_group_no, og.user_id, og.order_setlede, to_char(og.order_setlede,'hh24:mi') otime,  o.order_qy, gr.goods_name, s.setle_amount, s.setle_code " + 
				"from order_group og, orders o, setle s, goods_sle gs, goods_regist gr " + 
				"where og.ORDER_GROUP_NO = s.ORDER_GROUP_NO " + 
				"and og.ORDER_GROUP_NO = o.ORDER_GROUP_NO " + 
				"and o.SLE_ID = gs.SLE_ID " + 
				"and gs.GOODS_ID = gr.GOODS_ID " + and + "order by ? " +
				") a ) b where rn between ? and ?";
		int i = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			if(dto.getsCtg().equals("o_group") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("setleId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("uId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("amount") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("id") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("name") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("sleId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg2().equals("name") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("id") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("setleId") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("sleId") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
			}
			if (dto.getTime() != null) {
				pstmt.setString(++i, dto.getTime());
			}
			// sort 컬럼 - 작동안함. ???
			pstmt.setString(++i, dto.getSort());
						
			System.out.println(sql);
						// 페이징 변수 넣기	
			pstmt.setInt(++i, pDto.getStart());
			pstmt.setInt(++i, pDto.getEnd());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("order_id", rs.getString("order_id"));
				map.put("order_group_no", rs.getInt("order_group_no"));
				map.put("user_id", rs.getString("user_id"));
				map.put("order_setlede", rs.getDate("order_setlede"));
				map.put("order_setlede_time", rs.getString("otime")); // 주문시간 추가
				map.put("order_qy", rs.getInt("order_qy"));
				map.put("goods_name", rs.getString("goods_name"));
				map.put("setle_amount", rs.getInt("setle_amount"));
				map.put("setle_code", rs.getString("setle_code"));
				list.add(map);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
		}			
		return list;
	}
	//결제관리페이지 페이지 카운트
	public int SetleManagePageCnt(AdminSetleManageDto dto) {
		int lastpage = 0;
		
		String and = "and 1=1";
//		String minus = "";
		if (dto != null) {
			if(dto.getsCtg().equals("o_group") && !dto.getName1().isEmpty()) {
				and += " and o.order_group_no = ?";
			}
			if(dto.getsCtg().equals("setleId") && !dto.getName1().isEmpty()) {
				and += " and o.order_id = ?";
			}
			if(dto.getsCtg().equals("uId") && !dto.getName1().isEmpty()) {
				and += " and og.user_id = ?";
			}
			if(dto.getsCtg().equals("amount") && !dto.getName1().isEmpty()) {
				and += " and s.setle_amount = ?";
			}
			if(dto.getsCtg().equals("id") && !dto.getName1().isEmpty()) {
				and += " and gs.goods_id = ?";
			}
			if(dto.getsCtg().equals("name") && !dto.getName1().isEmpty()) {
				and += " and gr.goods_name = ?";
			}
			if(dto.getsCtg().equals("sleId") && !dto.getName1().isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if(dto.getsCtg2().equals("name") && !dto.getName2().isEmpty()) {
				and += " and gr.goods_name = ?";
			}
			if(dto.getsCtg2().equals("id") && !dto.getName2().isEmpty()) {
				and += " and gs.goods_id = ?";
			}
			if(dto.getsCtg2().equals("setleId") && !dto.getName2().isEmpty()) {
				and += " and s.setle_no = ?";
			}
			if(dto.getsCtg2().equals("sleId") && !dto.getName2().isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				and += " and og.order_setlede between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')";
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				and += " and og.order_setlede between ? and sysdate";
			}
			if (dto.getTime() != null) {
				and += " and to_char(og.order_setlede,'hh24mi') >= ?";// String type으로 비교
			}
			if (dto.getStat() != null && dto.getStat().equals("complete")) {
				and += " and s.setle_code = 'SC' ";
			}
			if (dto.getStat() != null && dto.getStat().equals("refund")) {
				and += " and s.setle_code = 'RC' ";
			}

			
		}
//		String sql = "select count(*) cnt " + 
//				"from order_group og, orders o, setle s, user_refnd ur, goods_sle gs, goods_regist gr " + 
//				"where og.ORDER_GROUP_NO = s.ORDER_GROUP_NO " + 
//				"and og.ORDER_GROUP_NO = o.ORDER_GROUP_NO " + 
//				"and s.SETLE_NO = ur.SETLE_NO " + 
//				"and o.SLE_ID = gs.SLE_ID " + 
//				"and gs.GOODS_ID = gr.GOODS_ID " + and + " order by ?";
		
		String sql = "select count(*) cnt " +				
				"from order_group og, orders o, setle s, goods_sle gs, goods_regist gr " + 
				"where og.ORDER_GROUP_NO = s.ORDER_GROUP_NO " + 
				"and og.ORDER_GROUP_NO = o.ORDER_GROUP_NO " + 
				"and o.SLE_ID = gs.SLE_ID " + 
				"and gs.GOODS_ID = gr.GOODS_ID " + and + "order by ? ";

//		System.out.println("CntSql============"+ sql);
		try {			
			pstmt = conn.prepareStatement(sql);
			int i = 0;
			if(dto.getsCtg().equals("o_group") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("setleId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("uId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("amount") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("id") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("name") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("sleId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg2().equals("name") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("id") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("setleId") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("sleId") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
			}
			if (dto.getTime() != null) {
				pstmt.setString(++i, dto.getTime());
			}
			// sort 컬럼 - 작동안함. ???
			pstmt.setString(++i, dto.getSort());
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				lastpage = rs.getInt("cnt");
			}
						
		} catch (SQLException e) {
 
			e.printStackTrace();
		} finally {
			
		}			
		return lastpage;
	}
			
	
	//환불 검색 
	public List<HashMap<String, Object>> selectRefundInfo(AdminSetleManageDto dto, AdminPagingDto pDto) {			
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String and = "and 1=1";
		
		if (dto != null) {			
			if(dto.getsCtg().equals("setleId") && !dto.getName1().isEmpty()) {
				and += " and o.order_id = ?";
			}
			if(dto.getsCtg().equals("uId") && !dto.getName1().isEmpty()) {
				and += " and og.user_id = ?";
			}			
			if(dto.getsCtg().equals("id") && !dto.getName1().isEmpty()) {
				and += " and gs.goods_id = ?";
			}
			if(dto.getsCtg().equals("name") && !dto.getName1().isEmpty()) {
				and += " and gr.goods_name = ?";
			}
			if(dto.getsCtg().equals("sleId") && !dto.getName1().isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if(dto.getsCtg2().equals("name") && !dto.getName2().isEmpty()) {
				and += " and gr.goods_name = ?";
			}
			if(dto.getsCtg2().equals("id") && !dto.getName2().isEmpty()) {
				and += " and gs.goods_id = ?";
			}
			if(dto.getsCtg2().equals("setleId") && !dto.getName2().isEmpty()) {
				and += " and o.order_id = ?";
			}
			if(dto.getsCtg2().equals("sleId") && !dto.getName2().isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				and += " and og.order_setlede between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')";
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				and += " and og.order_setlede between ? and sysdate";
			}
			if (dto.getStat() != null && dto.getStat().equals("request")) {
				and += " and s.setle_code = 'CR' ";
			}
			if (dto.getStat() != null && dto.getStat().equals("complete")) {
				and += " and s.setle_code = 'CC' ";
			}
		
		}
		String sql="select * from( select rownum rn, a.* from ( " +
				"select o.order_group_no, o.order_id, og.user_id, gr.goods_name, og.order_setlede, ur.refnd_de, ur.refnd_amount, ur.refnd_resn, s.setle_code " + 
				"from order_group og, orders o, setle s, user_refnd ur, goods_sle gs, goods_regist gr " + 
				"where og.ORDER_GROUP_NO = s.ORDER_GROUP_NO " + 
				"and og.ORDER_GROUP_NO = o.ORDER_GROUP_NO " + 
				"and s.SETLE_NO = ur.SETLE_NO " + 
				"and o.SLE_ID = gs.SLE_ID " + 
				"and gs.GOODS_ID = gr.GOODS_ID " + and + " order by ? " +
				") a ) b where rn between ? and ?";
		
		int i = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(dto.getsCtg().equals("setleId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("uId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}			
			if(dto.getsCtg().equals("id") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("name") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("sleId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg2().equals("name") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("id") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("setleId") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("sleId") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
			}
			
			// sort 컬럼 - 작동안함. ???
			pstmt.setString(++i, dto.getSort());
						
			System.out.println(sql);
			
			// 페이징 변수 넣기	
			pstmt.setInt(++i, pDto.getStart());
			pstmt.setInt(++i, pDto.getEnd());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("order_id", rs.getString("order_id"));
				map.put("order_group_no", rs.getInt("order_group_no"));
				map.put("user_id", rs.getString("user_id"));
				map.put("order_setlede", rs.getDate("order_setlede"));							
				map.put("goods_name", rs.getString("goods_name"));
				map.put("refnd_de", rs.getString("refnd_de"));
				map.put("refnd_amount",rs.getInt("refnd_amount"));
				map.put("refnd_resn",rs.getString("refnd_resn"));
				map.put("setle_code",rs.getString("setle_code"));
				list.add(map);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
		}							
		return list;
	}
	//환불 검색 페이지 카운트
	public int selectRefundInfoCnt(AdminSetleManageDto dto) {		
		int lastpage = 0;
		String and = "and 1=1";
		
		if (dto != null) {			
			if(dto.getsCtg().equals("setleId") && !dto.getName1().isEmpty()) {
				and += " and o.order_id = ?";
			}
			if(dto.getsCtg().equals("uId") && !dto.getName1().isEmpty()) {
				and += " and og.user_id = ?";
			}			
			if(dto.getsCtg().equals("id") && !dto.getName1().isEmpty()) {
				and += " and gs.goods_id = ?";
			}
			if(dto.getsCtg().equals("name") && !dto.getName1().isEmpty()) {
				and += " and gr.goods_name = ?";
			}
			if(dto.getsCtg().equals("sleId") && !dto.getName1().isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if(dto.getsCtg2().equals("name") && !dto.getName2().isEmpty()) {
				and += " and gr.goods_name = ?";
			}
			if(dto.getsCtg2().equals("id") && !dto.getName2().isEmpty()) {
				and += " and gs.goods_id = ?";
			}
			if(dto.getsCtg2().equals("setleId") && !dto.getName2().isEmpty()) {
				and += " and o.order_id = ?";
			}
			if(dto.getsCtg2().equals("sleId") && !dto.getName2().isEmpty()) {
				and += " and gs.sle_id = ?";
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				and += " and og.order_setlede between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')";
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				and += " and og.order_setlede between ? and sysdate";
			}
			if (dto.getStat() != null && dto.getStat().equals("request")) {
				and += " and s.setle_code = 'CR' ";
			}
			if (dto.getStat() != null && dto.getStat().equals("complete")) {
				and += " and s.setle_code = 'CC' ";
			}
		
		}
		String sql="select count(*) cnt " +				 
				"from order_group og, orders o, setle s, user_refnd ur, goods_sle gs, goods_regist gr " + 
				"where og.ORDER_GROUP_NO = s.ORDER_GROUP_NO " + 
				"and og.ORDER_GROUP_NO = o.ORDER_GROUP_NO " + 
				"and s.SETLE_NO = ur.SETLE_NO " + 
				"and o.SLE_ID = gs.SLE_ID " + 
				"and gs.GOODS_ID = gr.GOODS_ID " + and + " order by ? ";
						
		int i = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(dto.getsCtg().equals("setleId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("uId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}			
			if(dto.getsCtg().equals("id") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("name") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg().equals("sleId") && !dto.getName1().isEmpty()) {
				pstmt.setString(++i, dto.getName1());
			}
			if(dto.getsCtg2().equals("name") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("id") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("setleId") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if(dto.getsCtg2().equals("sleId") && !dto.getName2().isEmpty()) {
				pstmt.setString(++i, dto.getName2());
			}
			if (dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if (dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
			}
			
			// sort 컬럼 - 작동안함. ???
			pstmt.setString(++i, dto.getSort());
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				lastpage = rs.getInt("cnt");
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		return lastpage;
	}
	
	
	// 회원 정보 관리 
	public List<HashMap<String, Object>> selectUser(AdminUserDto dto, AdminPagingDto pDto) {			
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String and = "and 1=1";
	
		if(dto != null) {
			if(dto.getuName1() != null ) {
				and += " and u.user_id like '%'||?||'%' ";
			}
			if(dto.getuStat1() != null && dto.getuStat1().equals("UNO")) {
				and += " and u.user_sttus = 'UNO' ";
			}
			if(dto.getuStat1() != null && dto.getuStat1().equals("UDR")) {
				and += " and u.user_sttus = 'UDR' ";
			}
			if(dto.getuStat1() != null && dto.getuStat1().equals("UDS")) {
				and += " and u.user_sttus = 'UDS' ";
			}
			if(dto.getuStat1() != null && dto.getuStat1().equals("USE")) {
				and += " and u.user_sttus = 'USE' ";
			}			
			if(dto.getuCtg1().equals("srbde") && dto.getsDate() != null && dto.geteDate() != null) {
				and += " and u.srbde between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd') ";
			}
			if(dto.getuCtg1().equals("srbde") && dto.getsDate() != null && dto.geteDate() == null) {
				and += " and u.srbde between to_date(?,'yyyy-mm-dd') and sysdate ";
			}
			if(dto.getuCtg1().equals("user_brthdy") && dto.getsDate() != null && dto.geteDate() != null) {
				and += " and u.user_brthdy between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd') ";
			}
			if(dto.getuCtg1().equals("user_brthdy") && dto.getsDate() != null && dto.geteDate() == null) {
				and += " and u.user_brthdy between to_date(?,'yyyy-mm-dd') and sysdate ";
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 10 and 20")) {
				and += " and to_char(user_brthdy,'yyyy') between to_char(sysdate,'yyyy') - 19 and to_char(sysdate,'yyyy') - 10 ";
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 20 and 30")) {
				and += " and to_char(user_brthdy,'yyyy') between to_char(sysdate,'yyyy') - 29 and to_char(sysdate,'yyyy') - 20 ";
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 30 and 40")) {
				and += " and to_char(user_brthdy,'yyyy') between to_char(sysdate,'yyyy') - 39 and to_char(sysdate,'yyyy') - 30 ";
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 40 and 50")) {
				and += " and to_char(user_brthdy,'yyyy') between to_char(sysdate,'yyyy') - 49 and to_char(sysdate,'yyyy') - 40 ";
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 50 and 60")) {
				and += " and to_char(user_brthdy,'yyyy') between to_char(sysdate,'yyyy') - 59 and to_char(sysdate,'yyyy') - 50 ";
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("61")) {
				and += " and to_char(user_brthdy,'yyyy') to_char(user_brthdy,'yyyy') < to_char(sysdate,'yyyy') - 60 ";
			}
			
		}
		
		String sql = "SELECT * FROM " + 				
				"(SELECT rownum rn, a.* FROM " + 				
				"(select u.user_id, u.user_name, u.user_brthdy, u.srbde, (to_char(sysdate,'yyyy')- to_char(u.user_brthdy,'yyyy')) as age, u.user_sttus, sum(s.setle_amount) order_amount, count(s.setle_amount) order_cnt " + 
				"from order_group og, users u, setle s " + 
				"where u.USER_ID = og.USER_ID " + 
				"and og.ORDER_GROUP_NO = s.ORDER_GROUP_NO " + and + 
				"group by u.user_id, u.user_name, u.user_brthdy, u.srbde, (to_char(sysdate,'yyyy')- to_char(u.user_brthdy,'yyyy')), u.user_sttus, s.setle_amount " + 
				"order by ? ) a ) b WHERE rn BETWEEN ? AND ? "; 
				 						
		int i = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			if(dto.getuName1() != null ) {
				
			}
			if(dto.getuStat1() != null && dto.getuStat1().equals("UNO")) {
				
			}
			if(dto.getuStat1() != null && dto.getuStat1().equals("UDR")) {
				
			}
			if(dto.getuStat1() != null && dto.getuStat1().equals("UDS")) {
				
			}
			if(dto.getuStat1() != null && dto.getuStat1().equals("USE")) {
				
			}			
			if(dto.getuCtg1().equals("srbde") && dto.getsDate() != null && dto.geteDate() != null) {
				
			}
			if(dto.getuCtg1().equals("srbde") && dto.getsDate() != null && dto.geteDate() == null) {
				
			}
			if(dto.getuCtg1().equals("user_brthdy") && dto.getsDate() != null && dto.geteDate() != null) {
				
			}
			if(dto.getuCtg1().equals("user_brthdy") && dto.getsDate() != null && dto.geteDate() == null) {
				
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 10 and 20")) {
				
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 20 and 30")) {
				
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 30 and 40")) {
				
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 40 and 50")) {
				
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("between 50 and 60")) {
				
			}
			if(dto.getuStat2() != null && dto.getuStat2().equals("61")) {
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int selectUserCnt(AdminUserDto dto) {			
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		int lastpage = 0;
		String and = "and 1=1";
	
		
		
		
		
		return lastpage;
	}
}