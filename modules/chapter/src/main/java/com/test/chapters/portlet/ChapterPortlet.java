package com.test.chapters.portlet;

import com.liferay.portal.kernel.io.ByteArrayFileInputStream;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.StreamUtil;
import com.test.chapters.constants.ChapterPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.*;
import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;


import com.liferay.portal.kernel.service.ImageServiceUtil;


import java.io.File;
import java.io.IOException;
import com.liferay.portal.kernel.model.*;


import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.model.Image;
import com.liferay.portal.kernel.model.Organization;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.service.ImageLocalServiceUtil;
import com.liferay.portal.kernel.service.UserServiceUtil;
import static com.liferay.portal.kernel.service.OrganizationLocalServiceUtil.getService;



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
		"javax.portlet.display-name=Chapter",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + ChapterPortletKeys.CHAPTER,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class ChapterPortlet extends MVCPortlet {
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		try {
			User currentUser= UserServiceUtil.getCurrentUser();
			List<Organization> list=currentUser.getOrganizations();
			if(list.size()!=0)
				renderRequest.setAttribute("myOrganization", list.get(0));

			/*renderRequest.setAttribute("organizationList", currentUser.getOrganizations());
			for (Organization o:currentUser.getOrganizations()) {
				System.out.println(o.getRegionId());
				System.out.println(o.getLogoURL());
				System.out.println(o.getComments());

			}*/
		} catch (PortalException e) {
			System.out.println("Error occurred");
		}
		super.doView(renderRequest, renderResponse);
	}


	public void uploadFileAction(ActionRequest actionRequest, ActionResponse actionResponse){

		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(actionRequest);
		ByteArrayFileInputStream inputStream = null;
		try {
			File file = uploadPortletRequest.getFile("sampleFile");
			if (!file.exists()) {
				System.out.println("Empty File");
			}
			if ((file != null) && file.exists()) {
				inputStream = new ByteArrayFileInputStream(file, 1024);
				byte[] data;
				try {
					data = FileUtil.getBytes(inputStream);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		finally {
			//StreamUtil.cleanUp(inputStream);
		}
	}
}