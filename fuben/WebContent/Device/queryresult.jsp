<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*,java.net.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�豸��Ϣ��ѯ���</title>
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
   String getInfoSql = "SELECT *  FROM DeviceInfo where DeviceID='"+ studnameStr +"'";
   System.out.println(getInfoSql);
   
   int num = myDBConnect.total(getInfoSql);
   boolean FindOK = false;//���������ǿյ�boolean�ͱ�־����
   if(num>0){
	   FindOK = true;
   }
   ResultSet rs = myDBConnect.Select(getInfoSql);
%>

	<form id="form1" name="form1" method="post" action="query.jsp">
		<p>
			<span class="style3">��ѯ�������</span><font size="4">��</font>
		</p>

		<table width="64%" border="1" align="center" cellpadding="1" cellspacing="0">
    <tr>
  <th width="13%" bgcolor="#CCCCCC" scope="col">�豸ID</th>
      <th width="18%" bgcolor="#CCCCCC" scope="col">�豸����</th>
      <th width="12%" bgcolor="#CCCCCC" scope="col">��װλ��</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">��װ����</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">��װʱ��</th>
      <th width="17%" bgcolor="#CCCCCC" scope="col">�豸����</th>   
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
     <td width="10%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("DeviceName");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("Position");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="9%"><div align="center"><%=str%></div></td>
    <%str=rs.getString("Quantity");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="16%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("InstalledTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="16%"><div align="center"><%=str%></div></td>
     <%str=rs.getString("ValidTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="16%"><div align="center"><%=str%></div></td>    
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
    out.println("<meta http-equiv=\"refresh\" content=\"2;url=query.jsp\">");
    out.println("û�з��������ļ�¼��2����Զ����ز�ѯ���棡");
  }
%>
</body>
</html>
