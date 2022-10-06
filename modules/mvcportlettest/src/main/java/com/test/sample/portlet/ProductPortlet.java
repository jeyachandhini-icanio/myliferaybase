package com.test.sample.portlet;

import com.liferay.portal.kernel.service.ImageServiceUtil;
import com.test.sample.constants.ProductPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import java.io.IOException;
import com.liferay.portal.kernel.model.*;

import org.osgi.service.component.annotations.Component;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.model.Image;
import com.liferay.portal.kernel.model.Organization;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.service.ImageLocalServiceUtil;
import com.liferay.portal.kernel.service.UserServiceUtil;


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
		"javax.portlet.display-name=Product",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + ProductPortletKeys.PRODUCT,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class ProductPortlet extends MVCPortlet {

	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		try {
			User currentUser= UserServiceUtil.getCurrentUser();
			renderRequest.setAttribute("organizationList", currentUser.getOrganizations());
			for (Organization o:currentUser.getOrganizations()) {
				System.out.println(o.getRegionId());
				System.out.println(o.getLogoURL());
				System.out.println(o.getLogoId());
				Image image= ImageLocalServiceUtil.getImage(o.getLogoId());
				image.getImageId();
				System.out.println(image);
				System.out.println(o.getName());
			}
		} catch (PortalException e) {
			System.out.println("Error occurred");
		}
		super.doView(renderRequest, renderResponse);
	}


}