package deviceservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBUtils.DBConnect;

public class Login extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    
	String UserName = request.getParameter("id");
    String Password = request.getParameter("name");
	//String FixStaffID = URLDecoder.decode(FixStaffID, "UTF-8");
    DBConnect myDBConnect=new DBConnect("DeviceFixDB");
	String checkInfoSql = "Select Dev from Login where FixID='"
			+ UserName + "' and Pass='"
					+ Password + "'";
	System.out.println(checkInfoSql);
	//ResultSet checkRs=myDBConnect.Select(checkInfoSql);
	PrintWriter out = response.getWriter();
	ResultSet CheckRs = myDBConnect.Select(checkInfoSql);
	
	try {
		if (!CheckRs.next()) {// ��û�иü�¼���򱨾�������
		
			//out.println("<meta http-equiv=\"refresh\" content=\"3;url=/fuben/WebContent/relogin/login.jsp\">");
			out.println("�û��������벻�ԣ����������룡");
			response.sendRedirect("relogin/login.jsp");
			out.close();
			return;
		}
		else{String shenfen =CheckRs.getString("Dev");
			HttpSession session=request.getSession();
	         session.setAttribute("DDD", UserName);
	         
	         if("1".equals(shenfen)){//����Ա
			
			request.getRequestDispatcher("index.html").forward(request, response);
		}else{ if("2".equals(shenfen)){//����Ա
			request.getRequestDispatcher("index00.html").forward(request, response);
			}else{
				
		request.getRequestDispatcher("index01.html").forward(request, response);
		}}
		}
			
	} catch (Exception ex) {
	
	// ����ɾ����� 
	
	myDBConnect.close();
	
	//response.sendRedirect("/DepartFixSystem/jianchagongneng/zhuye.jsp");
	}
}
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
doGet(request, response);
}
}
