package notice.controller.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeController implements Controller{
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{
      System.out.println("NoticeController pass");//sysou 깐츄롤스페이스
      
      
  
		
		  String field = request.getParameter("f"); System.out.println("field : " +
		  field); if(field==null || field.equals("")) { field="title"; }
		 
      String query = request.getParameter("q");
      if(query==null)
    	  query="";
      
      //db접속해서 셀렉트 결과물 dao에서 처리
		
		  NoticeDao dao = new NoticeDao(); List<Notice> list = dao.getNotices(field,
		  query);
		 
      	
      //request에 Notice n 을 담아주기 
        request.setAttribute("list", list);
        request.setAttribute("query", query);
        request.getRequestDispatcher("notice.jsp").forward(request, response);
      	
      
   }

}