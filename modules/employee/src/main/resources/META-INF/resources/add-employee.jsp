<%@ include file="init.jsp"%>
<portlet:defineObjects />

<portlet:actionURL name="addEmployee" var="addEmployeeActionURL"/>


<h2>Add Employee Form here !</h2>

<aui:form action="<%=addEmployeeActionURL %>" name="employeeForm" method="POST">
    <aui:input name="name" >
        <aui:validator name="required"/>
        <aui:validator name="alpha"/>
    </aui:input>

    <aui:button type="submit" name="" value="Submit"></aui:button>
</aui:form>