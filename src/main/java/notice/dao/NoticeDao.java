package notice.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDao { //Date access object DB와 접속해서 처리
	
	
	public List<Notice> getNotices(String field, String query) throws Exception {
		
		Connection conn = DBCon.getConnection();

//		String sql = "select * from notices order by to_number(seq) desc";
		String sql="select * from notices";
        sql+=" where "+field+" like ?";
        sql+=" order by to_number(seq) desc";
		 
		
        //실행
        PreparedStatement pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, "%"+query+"%");
        //결과값 가져오기
        ResultSet rs=pstmt.executeQuery();
		
		//select 결과물 모두를 List에 저장하기
		List<Notice> list = new ArrayList<Notice>();
		while (rs.next()) {
			Notice n = new Notice();
			n.setSeq(rs.getString("seq"));
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("writer"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			
			list.add(n);
		}
		return list;
		
		/*
		 //      String sql="select * from notices order by to_number(seq) desc";
//      String sql="select * from notices";
//            sql+=" where "+field+" like ?";
//            sql+=" order by to_number(seq) desc";
      String sql="select * from notices";
            sql+=" where "+field+" like '%"+query+"%'";
            sql+=" order by to_number(seq) desc";
      //실행
//      PreparedStatement pstmt=conn.prepareStatement(sql);
//      pstmt.setString(1, "%"+query+"%");
//      
      Statement st=conn.createStatement();
      
      
      //결과값 가져오기
      ResultSet rs=st.executeQuery(sql); 
		 */
	}

	public int insert(Notice n) throws Exception {
		
		Connection conn = DBCon.getConnection(); 
		//DBCon에서 DB접속 내용을 리턴 받아와서 DB접속처리!  
		
		//접속성공

		String sql = "insert into notices(seq,title,writer,content,regdate,hit) " 
		+"values ((select max(to_number(seq))+1 from notices),?,'park',?,sysdate,0)";
	  
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, n.getTitle());
		pstmt.setString(2, n.getContent());
		
		//실행
		int cnt = pstmt.executeUpdate(); //insert 실행
		
		pstmt.close();
		conn.close();
		return cnt;
	}
	
	
	public int delete(String seq) throws Exception {
		
		Connection conn = DBCon.getConnection();
		//접속성공
		
		//String sql ="select * from notices where seq="+seq;
		String sql ="delete from notices where seq=?";
		
		//Statement st = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		//ResultSet rs = st.executeQuery(sql); //statement형식 select 실행

		int af=pstmt.executeUpdate(); //delete실행
		
		return af;
	}
	
	
	public int update(Notice notice) throws Exception {
		
		Connection conn = DBCon.getConnection();
		
		//접속성공
		//String sql ="select * from notices where seq="+seq;
		String sql ="update notices set title=?,content=? where seq=?";
		
		//Statement st = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getSeq());
		
		//ResultSet rs = st.executeQuery(sql); //statement형식 select 실행
		int cnt = pstmt.executeUpdate();  //pstmt형식 update실행
		return cnt;
	}
	
public Notice getNotice(String seq) throws Exception {
		
		Connection conn = DBCon.getConnection();
		
				
		//접속성공
		
		//String sql ="select * from notices where seq="+seq;
		String sql ="select * from notices where seq=?";
		
		//Statement st = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		//ResultSet rs = st.executeQuery(sql); //statement형식 select 실행
		ResultSet rs = pstmt.executeQuery();  //pstmt형식 실행
		rs.next();
		
		//db의 select 결과를 Notice파일에 저장
		//noticeDetail.jsp의 tbody쪽 rs.로 받는 값들을 n으로 보내줌
		Notice n = new Notice();
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return n;
	}
	
	
	public Notice getNotice(String seq, String hit) throws Exception {
		
		Connection conn = DBCon.getConnection();
		
		//hit 1증가값 처리	
		int hnum = Integer.parseInt(hit);
		//메소드로 처리
		hitupdate(seq, hnum);
		
		//접속성공
		
		//String sql ="select * from notices where seq="+seq;
		String sql ="select * from notices where seq=?";
		
		//Statement st = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		//ResultSet rs = st.executeQuery(sql); //statement형식 select 실행
		ResultSet rs = pstmt.executeQuery();  //pstmt형식 실행
		rs.next();
		
		//db의 select 결과를 Notice파일에 저장
		//noticeDetail.jsp의 tbody쪽 rs.로 받는 값들을 n으로 보내줌
		Notice n = new Notice();
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return n;
	}

	private void hitupdate(String seq, int hnum) throws Exception {
		Connection conn = DBCon.getConnection();
		
		String sql = "update notices set hit=?+1 where seq=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, hnum+1);
		pstmt.setString(2, seq);
		
		pstmt.executeUpdate(); //실행
		
		
	}
}
