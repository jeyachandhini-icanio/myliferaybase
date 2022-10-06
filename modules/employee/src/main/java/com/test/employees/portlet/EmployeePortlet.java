package com.test.employees.portlet;

import com.liferay.counter.kernel.service.CounterLocalService;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.servicebuilder.test.model.Employee;
import com.servicebuilder.test.service.EmployeeLocalService;
import com.test.employees.constants.EmployeePortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.*;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import java.io.IOException;
import java.util.List;

/**
 * @author icanio-28-01-22
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=Employee",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + EmployeePortletKeys.EMPLOYEE,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class EmployeePortlet extends MVCPortlet {
	private Log log = LogFactoryUtil.getLog(this.getClass().getName());

	@Reference
	CounterLocalService counterLocalService;

	@Reference
	EmployeeLocalService employeeLocalService;

	@ProcessAction(name = "addEmployee")
	public void addEmployee(ActionRequest actionRequest,ActionResponse actionResponse) {
		long empId = counterLocalService.increment(Employee.class.getName());
		String name = ParamUtil.getString(actionRequest, "name");

		Employee employee = employeeLocalService.createEmployee(empId);
		employee.setName(name);

		employeeLocalService.addEmployee(employee);
	}

	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		List<Employee> employeeList = employeeLocalService.getEmployees(QueryUtil.ALL_POS, QueryUtil.ALL_POS);
		renderRequest.setAttribute("employeeList", employeeList);
		super.render(renderRequest, renderResponse);
	}

	@ProcessAction(name = "updateEmployee")
	public void updateStudent(ActionRequest actionRequest,  ActionResponse actionResponse) {
		long empId = ParamUtil.getLong(actionRequest,"empId", GetterUtil.DEFAULT_LONG);
		String name = ParamUtil.getString(actionRequest, "name", GetterUtil.DEFAULT_STRING);

		Employee employee = null;
		try {
			employee = employeeLocalService.getEmployee(empId);
		} catch (Exception e) {
			log.error(e.getCause(), e);
		}

		if(Validator.isNotNull(employee)) {
			employee.setName(name);
			employeeLocalService.updateEmployee(employee);
		}
	}

	@ProcessAction(name = "deleteEmployee")
	public void deleteStudent(ActionRequest actionRequest, ActionResponse actionResponse){
		long empId = ParamUtil.getLong(actionRequest, "empId", GetterUtil.DEFAULT_LONG);
		try {
			employeeLocalService.deleteEmployee(empId);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

}