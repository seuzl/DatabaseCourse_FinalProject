<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*" errorPage=""%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ѯѧ����Ϣ</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/add.jpg);
}
		.style3 {font-size: 18px;font-weight: bold;}
		.style4 {font-size: 16px;font-weight: bold;}
   		.STYLE2 {font-size: 16px}
.style5 {font-size: 36px}
	-->
</style>
</head>
<body>
<script type="text/javascript">
function checkname(){
	var f;
	var namevalue;	
	f = document.form1;
	namevalue=f.studname.value;
	namevalue = encodeURIComponent(encodeURIComponent(namevalue));
	if(namevalue==""||namevalue==null){
		alert("�豸ID����Ϊ�գ��������豸ID!");
		f.studname.focus();
		return;
	}else{
		//f.submit();
		window.location.href="queryresult.jsp?name="+namevalue;
		return;
	}	
}

</script>

 <%
 	  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
      String getInfoSql = "Select * from DeviceInfo";
      System.out.println ("getInfoSql:"+getInfoSql);
      ResultSet rs = null;
      rs= myDBConnect.Select(getInfoSql);
 %>

<form name="form1" method="post" action="">
<p class="style5">��ѯ�豸������Ϣ!</p>
<div align="center">
    <p>&nbsp;</p>
    <p class="style3">�豸��Ϣ�б�
    </p>    
    <table width="80%" border="1" align="center" cellpadding="1" cellspacing="0">
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
      <p></p>
   <hr align="center" width="96%"/> 
    
    <table width="450" height="45" border="1">
      <tr>
        <td width="34%" bgcolor="#C1C1C1"><div align="center"><span class="style4">�����豸ID</span></div></td>
        <td width="40%"><input type="text" name="studname"></td>
        <td width="26%"><div align="center">
          <input name="QueryBtn" type="button" class="style4" Onclick="checkname()" value="��ѯ">
        </div>
        </td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>
