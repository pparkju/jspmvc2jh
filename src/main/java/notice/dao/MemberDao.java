package notice.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import notice.db.DBCon;
import notice.vo.Member;
import notice.vo.Notice;

public class MemberDao { //Date access object DB와 접속해서 처리
	
	
	
	public Member getMember(String uid) throws Exception {
		
		Connection conn = DBCon.getConnection();
		
		//접속성공
		
		String sql ="select * from nmember where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		
		ResultSet rs = pstmt.executeQuery();  //pstmt형식 실행
		//rs.next();
		Member m = null;
		//db에 셀렉트 결과를 Member파일에 저장
		//loginproc.jsp의 id,password쪽 rs.로 받는 값들을 n으로 보내줌

		if(rs.next()) {
			m = new Member();		
			m.setId(rs.getString("id"));
			m.setPwd(rs.getString("pwd"));
			System.out.println("m.id >>>>>>>>> : " + m.getId());		
		}
			rs.close();
			pstmt.close();
			conn.close();
			return m;
	}

}
