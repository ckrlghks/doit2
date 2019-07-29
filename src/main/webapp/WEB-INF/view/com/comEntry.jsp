<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���</title>
<script type="text/javascript">
   $(document).ready(function() {
      $("#minfo").show();
      $("#oinfo").hide();
      $(".saleLine").each(function() { // �ֹ���ǰ ��� ����.
         $(this).hide();
      })
      $("#tab1").addClass("select"); //class �Ӽ��� select ���� �߰�.
   })
   function disp_div(id, tab) {
      $(".info").each(function() {
         $(this).hide();
      })
      $(".tab").each(function() {
         $(this).removeClass("select");
      })
      $("#" + id).show();
      $("#" + tab).addClass("select");
   }
   function list_disp(id) {
      $("#" + id).toggle(); //
   }
</script>
<style type="text/css">
body, tr, td, th {
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 18px;
}

table {
   border-collapse: collapse;
   width: 100%;
}

th, td {
   text-align: center;
   padding: 15px;
   border: 1px solid #E5E5E5
}
.select {
   background-color: #46556d;
}

.select>a {
   color: white;
   text-decoration: none;
}
</style>
</head>
<body>
 <div class="w3-container w3-center" style="margin-bottom: 100px;margin-left:30%;">
 <div class="w3-panel w3-card" style="width: 700px;">
    <p style="font-size: 30px; color: #46556d;">ȸ������</p>
   <table>
      <tr>
         <td id="tab1" class="tab">
         <a href="${path }/user/userEntry.shop">�Ϲ� ȸ��</a>
         <!-- <a href="javascript:disp_div('minfo','tab1')">�Ϲ� ȸ��</a> --></td>
         <td id="tab2" class="tab">
         <a href="${path }/com/comEntry.shop">��� ȸ��</a>
         <!-- <a href="javascript:disp_div('oinfo','tab2')">��� ȸ��</a> --></td>
      </tr>
   </table>

   <form:form modelAttribute="company" action="companyEntry.shop">
      <spring:hasBindErrors name="company">
         <font color="red"> 
         <c:forEach items="${errors.globalErrors}" var="error">
         <spring:message code="${error.code}"/>
         </c:forEach></font>
      </spring:hasBindErrors>
      
      <table id="oinfo" class="info" border="1" style="border-collapse: collapse;">
         <tr>
            <td style="width:25%">��� ID</td>
            <td style="width:75%"><form:input path="comid"/>
             <font color="red"><form:errors path="comid"/></font></td>
         </tr>
         <tr>
            <td>��й�ȣ</td>
            <td><form:password path="compass"/> 
            <font color="red"><form:errors path="compass"/></font></td>
         </tr>
         <tr>
            <td>�����</td>
            <td><form:input path="comname"/>
            <font color="red"><form:errors path="comname"/></font></td>
         </tr>
         <tr>
            <td>����ڵ�Ϲ�ȣ</td>
            <td><form:input path="bussno"/>
            <font color="red"><form:errors path="bussno"/></font></td>
         </tr>
         <tr>
            <td>�����</td>
            <td><form:input path="managername"/>
            <font color="red"><form:errors path="managername"/></font></td>
         </tr>
         <tr>
            <td>�ڵ��� ��ȣ</td>
            <td><form:input path="managerphone"/>
            <font color="red"><form:errors path="managerphone"/></font></td>
         </tr>
         <tr>
            <td>�̸���</td>
            <td><form:input path="manageremail"/> 
            <font color="red"><form:errors path="manageremail"/></font></td>
         </tr>
      <tr>
      <td colspan="2" style="padding-top:0px; padding-bottom:0px;">
      <table>
          <tr>
         <td class="w3-center" style="border:1px;">
            <input type="submit" class="w3-center w3-button" style="width: 200px;" value="���">
         </td>
         <td class="w3-center" style="border:0px;">
            <input type="reset" class="w3-center w3-button" style="width: 200px;" value="�ʱ�ȭ">      
         </td>
      </tr>
      </table>
      </td>
      </tr>
      </table>   
   </form:form><br>
      <span>�̹� ȸ���̼���?&nbsp;&nbsp;<a href="${path }/com/comlogin.shop" style="color:#0000ff;">�α���</a>�ϱ�</span>
   <br><br>
   </div></div>
   
</body>
</html>