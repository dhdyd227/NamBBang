package co.nambbang.app.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.apache.tomcat.util.codec.binary.Base64;

import co.nambbang.app.dto.SetleDto;
import co.nambbang.app.dto.SetleFormDTO;
import oracle.jdbc.OracleTypes;

public class SetleDAO extends DAO {
	CallableStatement cstmt;

	public String insertSetle(SetleDto dto) {
		// 결재 값을 주고 받는 메소드
		String result = "";

		try {
			conn.setAutoCommit(false);

			cstmt = conn.prepareCall("{call SETLE_PR(?,?,?,?,?,?,?)}");
			cstmt.setInt(1, dto.getSetleNo());
			cstmt.setString(2, dto.getOrderMn());
			cstmt.setString(3, dto.getSetleConfmCode());
			cstmt.setInt(4, dto.getSetleAmount());
			cstmt.setInt(5, dto.getMlgUseAmount());
			cstmt.setInt(6, dto.getOrderGroupNo());
			cstmt.registerOutParameter(7, OracleTypes.VARCHAR);
			cstmt.executeUpdate();

			result = cstmt.getString(7);

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

	public List<SetleFormDTO> getSetleForm(String id, int no) throws IOException {
		List<SetleFormDTO> list = new ArrayList<SetleFormDTO>();
		SetleFormDTO dto = new SetleFormDTO();
		try {
			cstmt = conn.prepareCall("{call SETLE_FORM_PR(?,?,?)}");
			cstmt.setString(1, id);
			cstmt.setInt(2, no);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.execute();
			rs = (ResultSet) cstmt.getObject(3);
			while (rs.next()) {
				dto.setSleId(rs.getString("SLE_ID"));
				dto.setGoodsName(rs.getString("GOODS_NAME"));
				dto.setOrderQy(rs.getInt("ORDER_QY"));
				dto.setSlePc(rs.getInt("SLE_PC"));
				//BLOB을 String으로 변환
				byte[] encoded = Base64.encodeBase64(rs.getBytes("photo_file"));
				SerialBlob blob = new SerialBlob(rs.getBytes("photo_file"));
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				byte[] buf = new byte[1024];
				InputStream in = blob.getBinaryStream();
				int n = 0;
				while ((n = in.read(buf)) >= 0) {
					baos.write(buf, 0, n);}
				in.close();
				byte[] bytes = baos.toByteArray();
				System.out.println("bytes" + bytes);
				byte[] encodeBase64 = Base64.encodeBase64(buf);
				String base64Encoded = new String(encodeBase64, "UTF-8");
				dto.setPhotoFile(base64Encoded);
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;

	}

}
