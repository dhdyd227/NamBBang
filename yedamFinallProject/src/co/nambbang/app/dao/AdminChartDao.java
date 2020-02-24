package co.nambbang.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import co.nambbang.app.dto.AdminSelngAnalysisDto;

public class AdminChartDao extends DAO{

	public AdminChartDao(){
		super();
	}
	
	public List<Map<String,Object>> AnalysDay(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String and = " where 1=1 ";
		String and2 = " and 1=1 ";
		if(dto != null) {
			if(dto.getsDate() != null && dto.geteDate() != null) {
				and += " and setle_de >= ? ";
				and += " and setle_de <= ? ";
				and2 += " and s.setle_de >= ? ";
				and2 += " and setle_de <= ? ";
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				and += " and setle_de >= ? ";
				and += " and setle_de <= to_date(?,'yyyy-mm-dd')+7 ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= to_date(?,'yyyy-mm-dd')+7 ";
			}
		}
		
		String sql = " select amount.day,  amount.setle_profit, amount.setle_refnd, qy.order_qy " + 
				"    from  " + 
				"        ( " + 
				"        select to_char(setle_de ,'yyyy-mm-dd') day, " + 
				"        sum(case when setle_code = 'CC' then SETLE_AMOUNT else 0 end) setle_refnd, " + 
				"        sum(case when setle_code = 'SC' then SETLE_AMOUNT else 0 end) setle_profit " + 
				"        from setle "
						+ and + 				
				"        group by to_char(setle_de ,'yyyy-mm-dd') " + 
				"        order by to_char(setle_de ,'yyyy-mm-dd') " + 
				"        ) amount, " + 
				"        ( " + 
				"        select to_char(setle_de ,'yyyy-mm-dd') day, sum(o.order_qy) order_qy " + 
				"        from setle s, orders o " + 
				"        where  s.order_group_no = o.order_group_no "
						+ and2 +						
				"        and s.setle_code = 'SC' " + 
				"        group by to_char(setle_de ,'yyyy-mm-dd') " + 
				"        order by to_char(setle_de ,'yyyy-mm-dd') " + 
				"        ) qy " + 
				"  where amount.day = qy.day (+) " + 
				"  order by amount.day";
		
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
			}
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("day", rs.getString("day"));
				map.put("profit", rs.getInt("setle_profit"));
				map.put("refnd", rs.getInt("setle_refnd"));
				map.put("order_qy", rs.getInt("order_qy"));
				list.add(map);
							
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public List<Map<String,Object>> AnalysWeek(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String and = " where 1=1 ";
		String and2 = " and 1=1 ";
		
		if(dto != null) {
			if (dto.getsDate() != null && dto.geteDate() != null){
				and += " and setle_de >= ? ";
				and += " and setle_de <= ? ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= ? ";
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				and += " and setle_de >= ? ";
				and += " and setle_de <= to_date(?,'yyyy-mm-dd')+28 ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= to_date(?,'yyyy-mm-dd')+28 ";
			}
		}

		String sql = " select amount.week, amount.setle_profit, amount.setle_refnd, qy.order_qy " + 
				"    from " + 
				"        ( " + 
				"        select to_char(to_date(setle_de),'yy-mm/w') week, " + 
				"        sum(case when setle_code = 'CC' then SETLE_AMOUNT else 0 end) setle_refnd, " + 
				"        sum(case when setle_code = 'SC' then SETLE_AMOUNT else 0 end) setle_profit " + 
				"        from setle " + 
						 and +
				"        group by to_char(to_date(setle_de) ,'yy-mm/w') " + 
				"        order by to_char(to_date(setle_de),'yy-mm/w') " + 
				"        ) amount, " + 
				"        ( " + 
				"        select to_char(to_date(setle_de),'yy-mm/w') week, " + 
				"        sum(o.order_qy) order_qy " + 
				"        from setle s, orders o " + 
				"        where s.order_group_no = o.order_group_no " + 
						 and2 + 
				"        and s.setle_code = 'SC' " + 
				"        group by to_char(to_date(setle_de),'yy-mm/w') " + 
				"        order by to_char(to_date(setle_de),'yy-mm/w') " + 
				"        ) qy " + 
				"    where amount.week = qy.week (+) " + 
				"    order by amount.week";
		
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
			}
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();			
				map.put("week", rs.getString("week"));
				map.put("profit", rs.getInt("setle_profit"));
				map.put("refnd", rs.getInt("setle_refnd"));
				map.put("order_qy", rs.getInt("order_qy"));
				list.add(map);		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	public List<Map<String,Object>> AnalysMonth(AdminSelngAnalysisDto dto){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String and = " where 1=1 ";
		String and2 = " and 1=1 ";
		
		if(dto != null) {
			if (dto.getsDate() != null && dto.geteDate() != null){
				and += " and setle_de >= ? ";
				and += " and setle_de <= ? ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= ? ";
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				and += " and setle_de >= ? ";
				and += " and setle_de <= to_date(sysdate,'yy-mm-dd') ";
				and2 += " and setle_de >= ? ";
				and2 += " and setle_de <= to_date(sysdate,'yy-mm-dd') ";
			}
		}
		
		String sql ="  select amount.month,  amount.setle_profit, amount.setle_refnd, qy.order_qy " + 
				"     from " + 
				"    ( " + 
				"    select to_char(to_date(setle_de), 'yy-mm') month, " + 
				"    sum(case when setle_code = 'CC' then SETLE_AMOUNT else 0 end) setle_refnd, " + 
				"    sum(case when setle_code = 'SC' then SETLE_AMOUNT else 0 end) setle_profit " + 
				"    from setle " + 
					 and +
				"    group by to_char(to_date(setle_de) ,'yy-mm') " + 
				"    order by to_char(to_date(setle_de) ,'yy-mm') " + 
				"    ) amount, " + 
				"    ( " + 
				"    select to_char(to_date(setle_de), 'yy-mm') month, sum(o.order_qy) order_qy " + 
				"    from setle s, orders o " + 
				"    where s.order_group_no = o.order_group_no " + 
					 and2 +
				"    and s.setle_code = 'SC' " + 
				"    group by to_char(to_date(setle_de), 'yy-mm') " + 
				"    order by to_char(to_date(setle_de), 'yy-mm') " + 
				"    ) qy " + 
				"    where amount.month = qy.month (+) " + 
				"    order by amount.month"; 
		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			if(dto.getsDate() != null && dto.geteDate() != null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.geteDate());
			}
			if(dto.getsDate() != null && dto.geteDate() == null) {
				pstmt.setString(++i, dto.getsDate());
				pstmt.setString(++i, dto.getsDate());
				
			}
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();			
				map.put("month", rs.getString("month"));
				map.put("profit", rs.getInt("setle_profit"));
				map.put("refnd", rs.getInt("setle_refnd"));
				map.put("order_qy", rs.getInt("order_qy"));
				list.add(map);		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
}
