package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDetailController implements Controller {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String seq = request.getParameter("c"); //title의 seq번호 (글번호)
		String hit = request.getParameter("h");
		
	    NoticeDao dao = new NoticeDao();
	    Notice n= dao.getNotice(seq, hit);
	    
	    //request에 Notice n을 담아주기
	    request.setAttribute("n", n); // jsp에서 ${n.seq }로 받을 수 있음
	    
	    request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	
	}
}
