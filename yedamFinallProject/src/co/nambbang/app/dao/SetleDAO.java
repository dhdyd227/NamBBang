package co.nambbang.app.dao;

import java.sql.CallableStatement;
import java.sql.SQLException;

import co.nambbang.app.dto.SetleDto;
import oracle.jdbc.OracleTypes;

public class SetleDAO extends DAO {
	// 결재 값을 주고 받는 DAO

	public String insertSetle(SetleDto dto) {

		String result = "";
		try {
			conn.setAutoCommit(false);

			CallableStatement cstmt = conn.prepareCall("{call SETLE_PR(?,?,?,?,?,?,?,?)}");
			cstmt.setInt(1, dto.getSetleNo());
			cstmt.setString(2, dto.getOrderMn());
			cstmt.setString(3, dto.getSetleConfmCode());
			cstmt.setInt(4, dto.getSetleAmount());
			cstmt.setInt(5, dto.getMlgUseAmount());
			cstmt.setDate(6, dto.getSetleDe());
			cstmt.setInt(7, dto.getOrderGroupNo());
			cstmt.registerOutParameter(8, OracleTypes.VARCHAR);
			cstmt.executeUpdate();

			result = cstmt.getString(8);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close();
		}

		return result;
	}

}
