package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditProcController implements Controller {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeEditProcController pass");
		String title = request.getParameter("title");
	    String content = request.getParameter("content");
	    String seq = request.getParameter("c");
	    
	    Notice n = new Notice();
	    n.setTitle(title);
	    n.setContent(content);
	    n.setSeq(seq);
	    
	    NoticeDao dao = new NoticeDao();
	    int cnt=dao.update(n); //수정이 완료됨
	    
	    //Notice 값을 다시가져오기
	    n = dao.getNotice(seq);
	    //request에 Notice n을 담아주기
	    request.setAttribute("n", n); // jsp에서 ${n.seq }로 받을 수 있음
	    
	    request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	}
}
