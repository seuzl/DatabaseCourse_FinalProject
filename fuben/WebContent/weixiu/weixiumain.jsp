<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*,java.net.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�������뵥��Ϣ</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/std.jpg);
}
   		.STYLE2 {font-size: 16px}
.style4 {font-size: 24px}
	-->
</style>
</head>

<body>
<%
 	//CodeConvert codeconvert = new CodeConvert();
	//	String studnameStr = codeconvert.codeString(request.getParameter("studname"));
	//String name = request.getParameter("name");
	//String studnameStr = URLDecoder.decode(name, "UTF-8");
	//String a = request.getParameter("namevalue"); 
	//String studnameStr = java.net.URLDecoder.decode(a,"UTF-8");

  //String studnameStr = codeconvert.codeString(request.getParameter("studname").trim());;
  //�������ݿ⣬����ȡ����
   DBConnect myDBConnect=new DBConnect("DeviceFixDB");
   String getInfoSql = "SELECT *  FROM DFixAppForm ";
   System.out.println(getInfoSql);
   
   int num = myDBConnect.total(getInfoSql);
   boolean FindOK = false;//���������ǿյ�boolean�ͱ�־����
   if(num>0){
	   FindOK = true;
   }
   ResultSet rs = myDBConnect.Select(getInfoSql);
%>
<form id="form1" name="form1" method="post" action="query.jsp">
  <p class="style4">����ά�����뵥��</p>
  <p class="style4">&nbsp;</p>
  <table width="95%" border="1" align="center" cellpadding="1" cellspacing="0">
    <tr>
  <th width="9%" height="38" bgcolor="#CCCCCC" scope="col">ά����ԱID</th>
      <th width="7%" bgcolor="#CCCCCC" scope="col">�����</th>
      <th width="6%" bgcolor="#CCCCCC" scope="col">�豸ID</th>
      <th width="12%" bgcolor="#CCCCCC" scope="col">���Ϸ���ʱ��</th>
      <th width="12%" bgcolor="#CCCCCC" scope="col">ά������ʱ��</th>
      <th width="10%" bgcolor="#CCCCCC" scope="col">��������</th>   
       <th width="15%" bgcolor="#CCCCCC" scope="col">����ά�����ʱ��</th>  
        <th width="12%" bgcolor="#CCCCCC" scope="col">ά�������Ŀ</th>   
        <th width="17%" bgcolor="#CCCCCC" scope="col">ʵ��ά�����ʱ��</th>
    </tr>  
  
	<!--Ȼ�󽫽�������ڱ����-->

    <% try {
       while(rs.next()) {
    %>
	  <tr>
	 <%//���ж������һ������д�Ľ���������Ƿ�Ϊ��,���ǿ������丳ֵΪhtml���ԵĿո��ַ�"&nbsp"(��Ϊ��ֵ��������ʱ,���û�б߽���,����ʾ���ں�һ��Ĵ����)
	 String str=rs.getString("DFixID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="9%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ApplyID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="7%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DeviceID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%"><div align="center"><%=str%></div></td>
    <%str=rs.getString("DHappenTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ApplyTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DDescription");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="10%"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DExceptTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="15%"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DFixItem");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DFixedTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="17%"><div align="center"><%=str%></div></td> 
    </tr><%
             }
         rs.close();
        } catch (SQLException ex) {        	
        }
        myDBConnect.close();
       %>
  </table>
		<br>
		
</form>
	<!--�жϽ�����Ƿ�Ϊ�գ���Ϊ�գ��򱨾������� -->

</body>
</html>
