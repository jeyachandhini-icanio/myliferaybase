<%@ page import="com.servicebuilder.test.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ include file="/init.jsp" %>

<portlet:defineObjects />

<%  List<Employee> employeeList = (List<Employee>)request.getAttribute("employeeList"); %>
<portlet:renderURL var="addEmployeeRenderURL">
	<portlet:param name="mvcPath" value="/add-employee.jsp"/>
</portlet:renderURL>

<div class="mb-5">
	<a href="<%= addEmployeeRenderURL %>" class="btn  btn-primary btn-default">
		<i class="glyphicon glyphicon-plus"></i> Add Employee
	</a>
</div>
<table class="table table-striped">
	<tr >
		<th>Employee Id</th>
		<th>Name</th>
		<th colspan="2" style="width: 100px">Action</th>
	</tr>
	<c:forEach items="${employeeList}" var="employee">

		<portlet:renderURL var="updateEmployeeRenderURL">
			<portlet:param name="mvcPath" value="/update-employee.jsp"/>
			<portlet:param name="empId" value="${employee.getEmpId()}"/>
			<portlet:param name="name" value="${employee.getName()}"/>
		</portlet:renderURL>

		<portlet:actionURL name="deleteEmployee" var="deleteEmployeeActionURL">
			<portlet:param name="empId" value="${employee.getEmpId()}"/>
		</portlet:actionURL>

		<tr>
			<td>${employee.getEmpId()}</td>
			<td>${employee.getName()}</td>
			<td class="text-center" style="width: 50px">
				<a href="<%=updateEmployeeRenderURL%>" class="btn  btn-primary btn-default btn-sm px-2 py-1" >
					<i class ="glyphicon glyphicon-edit"></i>
				</a>
			</td>
			<td class="text-center" style="width:50px">
				<a href="<%=deleteEmployeeActionURL%>"
				   class="btn  btn-primary btn-default btn-sm px-2 py-1"
				   onclick="return confirm('Are you sure you want to delete this item?');">
					<i class ="glyphicon glyphicon-remove"></i>
				</a>
			</td>
		</tr>
	</c:forEach>
</table>
