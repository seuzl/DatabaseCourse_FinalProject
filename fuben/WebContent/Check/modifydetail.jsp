<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*,DBUtils.*,java.net.*"
	errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ȷ������</title>
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
<SCRIPT Language="javascript" type="text/javascript">
function modifyBtn(){ 
	var f1 = document.form1;
	var id = f1.sid.value;
	var name = f1.sname.value;
	var sex = f1.ssex.value;
	var dormitry = f1.sdorm.value;
	var hobby = f1.shobby.value;	 
	var email = f1.semail.value;
	var tel = f1.stel.value;
	var phone = f1.sphone.value;
	var floor = f1.sfloor.value;	 
	var ban = f1.sban.value;
	
	
	id = encodeURIComponent(encodeURIComponent(id));
	name = encodeURIComponent(encodeURIComponent(name));
	sex = encodeURIComponent(encodeURIComponent(sex));
	dormitry = encodeURIComponent(encodeURIComponent(dormitry));
	hobby = encodeURIComponent(encodeURIComponent(hobby));
	email = encodeURIComponent(encodeURIComponent(email));
	tel = encodeURIComponent(encodeURIComponent(tel));
	phone = encodeURIComponent(encodeURIComponent(phone));
	floor = encodeURIComponent(encodeURIComponent(floor));
	ban = encodeURIComponent(encodeURIComponent(ban));

	
	//������������֤
	if(phone==""||phone==null){
		alert("�����ԱID����Ϊ�գ�����������ԱID��");
		f.sphone.focus();
		return;
	}
	//�����������֤
	if(floor==""||floor==null){
		alert("�Ƿ���ɲ���Ϊ�գ���ȷ�ϴ𰸣�");
		f.sfloor.focus();
		return;
	}
	
    f1.submit();
}

function cancelBtn()
{
  var bodyurl="checkmodify.jsp";
  window.location.replace(bodyurl);
}
</SCRIPT>
</head>

<body>
<%
	//CodeConvert codeconvert = new CodeConvert();
	//String id = codeconvert.codeString(request.getParameter("studid").trim());
	String id = request.getParameter("studid");
    System.out.println("id="+id);
  	//�������ݿ⣬����ȡ����
	DBConnect myDBConnect=new DBConnect("DeviceFixDB");
	String getInfoSql = "Select * from DFixAppForm where ApplyID='"+ id +"'";
	System.out.println(getInfoSql);
	int num = myDBConnect.total(getInfoSql);
	boolean FindOK = false;//���������ǿյ�boolean�ͱ�־����
	if(num>0){
	   FindOK = true;
   	}
   ResultSet rs = myDBConnect.Select(getInfoSql);
%>
  
<form name="form1" method="post" action="/fuben/checkmodifystudent">
<p>
  <span class="style3"> �豸ά��ȷ��</span> �� </p>
<table width="90%" height="203" border="0" cellpadding="0" cellspacing="0">
<%
  try {
    while (rs.next()) {
      FindOK = true;
%>
  <tr>
    <td width="15%" height="45" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">�豸ID��</span>
      </div>
    </td>
    <td width="15%">
      <input name="sname" type="text" id="sname" size="20" value="<%=rs.getString("DeviceID")%>" readonly="readonly"/>
    </td>
    <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">����ţ�</span>
      </div>
    </td>
    <td width="15%">
      <input name="sid" type="text" id="sid" size="20" value="<%=rs.getString("ApplyID")%>"readonly="readonly"/>
    </td>
    <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">����ʱ�䣺</span>
      </div>
    </td>
    <td width="15%">
      <input name="ssex" type="text" id="ssex" size="20" value="<%=rs.getString("ApplyTime")%>"readonly="readonly"/>
    </td>
  </tr>
  <tr>
   <td width="15%" height="45" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">�������ʱ�䣺</span>
      </div>
    </td>
    <td width="15%">
      <input name="sdorm" type="text" id="sdorm" size="20" value="<%=rs.getString("DExceptTime")%>"readonly="readonly"/>
    </td>
    <td nowrap="nowrap">
      <div align="right"> <span class="STYLE2">�豸���ƣ�</span> </div></td>
    <td>
      <input name="shobby" type="text" id="shobby" size="20" value="<%=rs.getString("DDescription")%>"readonly="readonly"/>
    </td>
    <td nowrap="nowrap">
      <div align="right"> <span class="STYLE2">ά�������Ŀ��</span> </div></td>
    <td>
      <input name="semail" type="text" id="semail" size="20" value="<%=rs.getString("DFixItem")%>"readonly="readonly"/>
    </td>
  </tr>
  <tr>
    <td height="46" nowrap="nowrap">
      <div align="right"> <span class="STYLE2">ά�����ʱ�䣺</span> </div></td>
    <td>
      <input name="stel" type="text" id="stel" size="20" value="<%=rs.getString("DFixedTime")%>"readonly="readonly"/>
    </td>
    <td nowrap="nowrap">
      <div align="right"> <span class="STYLE2">�����ԱID��</span> </div></td>
    <td>
      <input name="sphone" type="text" id="sphone" size="20" value="<%=rs.getString("CheckID")%>"/>
    </td>
    <td nowrap="nowrap">
      <div align="right"> <span class="STYLE2">�Ƿ���ɣ�</span> </div></td>
    <td>
						<select name="sfloor">
						<option>---��ѡ��---</option>
						<option value="1">��</option>
						<option value="0">��</option>
						
						</select>      </td>
  </tr>
  
  <tr>
  <td width="15%" nowrap="nowrap">
      <div align="right">
        <span class="STYLE2">���ʱ�䣺</span>
      </div>
    </td>
    <td width="15%">
      <input name="sban" type="text" id="sban" size="20" value="<%=rs.getString("DCheckTime")%>"/>
    </td>
    <td width="15%" nowrap="nowrap">&nbsp;</td>
    <td width="15%">&nbsp;</td>
    <td width="15%" nowrap="nowrap"><div align="center">
      <input name="ModiBtn" type="button" id="ModiBtn7" value="�� ��" onClick="modifyBtn()"/>
    </div></td>
    <td width="15%"><div align="center">
      <input name="CancelBtn" type="button" id="CancelBtn9" value="ȡ ��" onClick="cancelBtn()"/>
    </div></td>
 <tr>
  <td></td>
	<td></td>
	<td></td>
	<td></td>
	<tr></tr>
<%
  }
      rs.close();
  } catch (SQLException ex) {}
	myDBConnect.close();
%>
</table>
</form>
<%
  if (!FindOK) {
    out.println("<meta http-equiv=\"refresh\" content=\"2;url=checkmodify.jsp\">");
    out.println("û�з��ϵ�������¼���������������ţ�");
  }
%>
</body>

</html>