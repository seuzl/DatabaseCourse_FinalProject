<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,DBUtils.*" errorPage=""%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ѯά������</title>
<style type="text/css">
	<!--
		body {
	background-color:#E0EEEE;
	background-image: url(../imgs/add.jpg);
}
		.style4 {font-size: 16px;font-weight: bold;}
   		.STYLE2 {font-size: 16px}
.style5 {font-size: 36px}
.style6 {
	font-size: 18px;
	font-weight: bold;
}
	-->
</style>
</head>
<body>
<script type="text/javascript">
function check(){
	var f= document.form1;
	var idvalue;	
	var namevalue;	
	idvalue=f.studid.value;
	namevalue=f.studname.value;
	idvalue = encodeURIComponent(encodeURIComponent(idvalue));
	namevalue = encodeURIComponent(encodeURIComponent(namevalue));
	if(idvalue==""||idvalue==null){
		alert("ά����ԱID����Ϊ�գ�������ά����ԱID!");
		f.studid.focus();
		return;
	}
	//������������֤
	if(namevalue==""||namevalue==null){
		alert("�豸ID����Ϊ�գ��������豸ID!");
		f.studname.focus();
		return;
	}
	
	window.location.href="weixiuqueryresult.jsp?id="+idvalue+"&name="+namevalue;
		
	
}

</script>

 <%
 	  DBConnect myDBConnect=new DBConnect("DeviceFixDB");
      String getInfoSql = "Select * from DFixAPPForm";
      System.out.println ("getInfoSql:"+getInfoSql);
      ResultSet rs = null;
      rs= myDBConnect.Select(getInfoSql);
 %>

<form name="form1" method="post" action="">
<p class="style5">��ѯά������!</p>
<div align="center">
    <table width="732" height="68" border="1">
      <tr>
        <td width="34%" bgcolor="#C1C1C1"><div align="center"><span class="style4">����ά����ԱID</span></div></td>
        <td width="40%"><input type="text" name="studid"></td>
        <td width="34%" bgcolor="#C1C1C1"><div align="center"><span class="style4">�����豸ID</span></div></td>
        <td width="40%"><input type="text" name="studname"></td>
        <td width="26%"><div align="center">
            <input name="QueryBtn" type="button" class="style4" Onclick="check()" value="��ѯ">
        </div></td>
      </tr>
    </table>
    <hr align="center" width="96%"/>
    <p class="style6">ά�������б�    </p>
    <table width="80%" border="1" align="center" cellpadding="1" cellspacing="0">
     <tr>
<th width="18%" bgcolor="#CCCCCC" scope="col">ά����ԱID</th>
      <th width="9%" bgcolor="#CCCCCC" scope="col">�豸ID</th>
      <th width="8%" bgcolor="#CCCCCC" scope="col">��������</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">���Ϸ���ʱ��</th>
      <th width="15%" bgcolor="#CCCCCC" scope="col">����ά�����ʱ��</th>
      <th width="13%" bgcolor="#CCCCCC" scope="col">ά������ʱ��</th>   
       <th width="14%" bgcolor="#CCCCCC" scope="col">����ά�޲���</th> 
        <th width="10%" bgcolor="#CCCCCC" scope="col">�����</th>  
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
     <%str=rs.getString("DeviceID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="6%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DDescription");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="10%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DHappenTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("DExceptTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="15%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("ApplyTime");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("ApplyDev");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="12%"><div align="center"><%=str%></div></td>
      <%str=rs.getString("ApplyID");
     if(str==null){str="&nbsp";}
     if(str.equals("")){str="&nbsp";}%>
     <td width="7%"><div align="center"><%=str%></div></td>

       
      </tr><%
             }
         rs.close();
        } catch (SQLException ex) {        	
        }
        myDBConnect.close();
       %>
	</table>
      <p></p>
 
  </div>
</form>
</body>
</html>
