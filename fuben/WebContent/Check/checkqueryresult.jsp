<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*,java.net.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�豸ά����ʷ��ѯ���</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/std.jpg);
}
   		.STYLE2 {font-size: 16px}
.style3 {font-size: 36px}
	-->
</style>
</head>

<body>
<%
 	//CodeConvert codeconvert = new CodeConvert();
	//	String studnameStr = codeconvert.codeString(request.getParameter("studname"));
	String name = request.getParameter("name");
	String studnameStr = URLDecoder.decode(name, "UTF-8");
	//String a = request.getParameter("namevalue"); 
	//String studnameStr = java.net.URLDecoder.decode(a,"UTF-8");

  //String studnameStr = codeconvert.codeString(request.getParameter("studname").trim());;
  //�������ݿ⣬����ȡ����
   DBConnect myDBConnect=new DBConnect("DeviceFixDB");
   String getInfoSql = "SELECT *  FROM DFixAPPForm where DeviceID='"+ studnameStr +"'";
   System.out.println(getInfoSql);
   
   int num = myDBConnect.total(getInfoSql);
   boolean FindOK = false;//���������ǿյ�boolean�ͱ�־����
   if(num>0){
	   FindOK = true;
   }
   ResultSet rs = myDBConnect.Select(getInfoSql);
%>

	<form id="form1" name="form1" method="post" action="checkquery.jsp">
		<p>
			<span class="style3">��ѯ�������</span><font size="4">��</font>
		</p>

		<table width="98%" border="1" align="center" cellpadding="1" cellspacing="0">
     <tr>
<th width="5%" bgcolor="#99CC00" scope="col">�豸ID</th>
      <th width="5%" bgcolor="#99CC00" scope="col">�����</th>
      <th width="4%" bgcolor="#99FFCC" scope="col">���Ϸ���ʱ��</th>
      <th width="4%" bgcolor="#99FFCC" scope="col">��������</th>
      <th width="6%" bgcolor="#99FFCC" scope="col">�������ʱ��</th>
      <th width="8%" bgcolor="#FF33FF" scope="col">ά����ԱID</th>   
      <th width="8%" bgcolor="#FF33FF" scope="col">ά�������Ŀ</th>
      <th width="10%" bgcolor="#FF33FF" scope="col">ά�����ʱ��</th>
      <th width="11%" bgcolor="#00FF00" scope="col">����ʱ��</th>
      <th width="13%" bgcolor="#00FF00" scope="col">����ά�޲���</th>   
      <th width="10%" bgcolor="#00FFFF" scope="col">�����ԱID</th>
      <th width="6%" bgcolor="#00FFFF" scope="col">�Ƿ����</th>
      <th width="10%" bgcolor="#00FFFF" scope="col">���ʱ��</th>
    </tr>  
  
	<!--Ȼ�󽫽�������ڱ����-->

    <% try {
       while(rs.next()) {
    %>
	  <tr>
	 <%//���ж������һ������д�Ľ���������Ƿ�Ϊ��,���ǿ������丳ֵΪhtml���ԵĿո��ַ�"&nbsp"(��Ϊ��ֵ��������ʱ,���û�б߽���,����ʾ���ں�һ��Ĵ����)
	 String str=rs.getString("DeviceID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="5%" bgcolor="#99CC00"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ApplyID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="5%" bgcolor="#99CC00"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DHappenTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%" bgcolor="#99FFCC"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DDescription");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%" bgcolor="#99FFCC"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DExceptTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="4%" bgcolor="#99FFCC"><div align="center"><%=str%></div></td>
    <%str=rs.getString("DFixID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#FF33FF"><div align="center"><%=str%></div></td> 
     <%str=rs.getString("DFixItem");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#FF33FF"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DFixedTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#FF33FF"><div align="center"><%=str%></div></td> 
     <%str=rs.getString("ApplyTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#00FF00"><div align="center"><%=str%></div></td> 
     <%str=rs.getString("ApplyDev");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="8%" bgcolor="#00FF00"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("CheckID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="10%" bgcolor="#00FFFF"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("Finished");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="11%" bgcolor="#00FFFF"><div align="center"><%=str%></div></td> 
	  <%str=rs.getString("DCheckTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="13%" bgcolor="#00FFFF"><div align="center"><%=str%></div></td>  
       </tr><%
             }
         rs.close();
        } catch (SQLException ex) {        	
        }
        myDBConnect.close();
       %>
	  </table>
		<br>
		<hr align="left" width="96%">
		<table width="95%" cellspacing="0">
			<tr>
				<td width="8%" height="32">&nbsp;</td>
				<td width="68%">&nbsp;</td>
				<td width="24%">
				<td width="9%"><input type="submit" name="EnterBtn"
					value="���ز�ѯ" /></td>
			</tr>
		</table>
	</form>
	<!--�жϽ�����Ƿ�Ϊ�գ���Ϊ�գ��򱨾������� -->
<%
   if (!FindOK) {
    out.println("<meta http-equiv=\"refresh\" content=\"2;url=checkquery.jsp\">");
    out.println("û�з��������ļ�¼��2����Զ����ز�ѯ���棡");
  }
%>
</body>
</html>
