package notice.controller.customer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDelProcController implements Controller{
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{
      
	   System.out.println("NoticeDelProcController pass");//sysou 깐츄롤스페이스
     
	   String seq = request.getParameter("c");
     
	   Notice n = new Notice(); //없어도됨
	   n.setSeq(seq);
	   NoticeDao dao = new NoticeDao();
	   //int af=dao.delete(n);
	   int af = dao.delete(seq);
	   
	   PrintWriter out = response.getWriter();
	   if(af>0) {
		   response.sendRedirect("notice.jsp");
	   }else {
		   out.write("삭제 오류");
	   }
   }

}