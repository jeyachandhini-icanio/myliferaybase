<%@ include file="init.jsp"%>
<portlet:defineObjects/>

<portlet:actionURL name="updateEmployee" var="updateEmployeeActionURL"/>

<aui:form action="<%=updateEmployeeActionURL%>" name="employeeForm" method="POST"/>

<%
    String empId = renderRequest.getParameter("empId");
    String name = renderRequest.getParameter("name");
%>
<aui:form action="<%= updateEmployeeActionURL %>" method="post" >
    <aui:input name="empId" type="hidden" value="<%=Long.parseLong(empId)%>"/>
    <aui:input name="name" type="text" value="${employee.getName()}"/>
    <aui:input type="submit" value="Update" name="update"></aui:input>
</aui:form>

