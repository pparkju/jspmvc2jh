package notice.controller.joinus;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class LogoutProcController implements Controller{
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{
      System.out.println("LogoutProcController pass");//sysou 깐츄롤스페이스
      
      //세션을 삭제하고 go notice.do
      request.getSession().invalidate();
      response.sendRedirect("../customer/notice.do");
	
   }

}