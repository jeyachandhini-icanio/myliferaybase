package com.test.chapters.portlet;
import com.liferay.portal.kernel.model.Group;
import com.liferay.portal.kernel.model.Image;
import com.liferay.portal.kernel.model.LayoutSet;
import com.liferay.portal.kernel.model.Organization;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.service.*;
import com.liferay.portal.kernel.util.ParamUtil;
import com.test.chapters.constants.ChapterPortletKeys;
import org.osgi.service.component.annotations.Component;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.annotations.Multipart;

import static com.liferay.portal.kernel.service.OrganizationLocalServiceUtil.getOrganization;
import static com.liferay.portal.kernel.service.OrganizationLocalServiceUtil.getService;

@Component(
        immediate = true,
        property = {
                "javax.portlet.name=" + ChapterPortletKeys.CHAPTER,
                "mvc.command.name=saveChapter"
        },
        service = MVCActionCommand.class
)
public class SaveChapter extends BaseMVCActionCommand {
    @Override
    protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) {
        try {
            System.out.println("enter savecall");
            String orgname = ParamUtil.get(actionRequest, "name", " ");
            String bio = ParamUtil.get(actionRequest, "bio", " ");
            //String regname = ParamUtil.get(actionRequest, "regname", " ");

            Long organizationId =Long.valueOf(ParamUtil.get(actionRequest,"organizationId",""));
            Organization organizationEditData = getOrganization(organizationId);
            organizationEditData.setName(orgname);
            organizationEditData.setComments(bio);


            System.out.println(orgname +"update done");

            OrganizationLocalServiceUtil.updateOrganization(organizationEditData);


        } catch (Exception e) {
            System.out.println("Error occur in SaveUserDetail Action");
            System.out.println("Error : " + e);
        }
    }
}
