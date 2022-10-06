package com.test.chapters.portlet;

import com.liferay.portal.kernel.model.Organization;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.service.OrganizationLocalServiceUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.test.chapters.constants.ChapterPortletKeys;
import org.osgi.service.component.annotations.Component;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;


@Component(
        immediate = true,
        property = {
                "javax.portlet.name=" + ChapterPortletKeys.CHAPTER,
                "mvc.command.name=viewChapter"
        },
        service = MVCActionCommand.class
)
public class ViewChapterAction extends BaseMVCActionCommand {
    @Override
    protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
        System.out.println("Enter view Action");
        try {
            Long organizationId =Long.valueOf(ParamUtil.get(actionRequest,"organizationId",""));
            Organization organization = OrganizationLocalServiceUtil.getOrganization(organizationId);
            actionRequest.setAttribute("organization", organization);

            actionResponse.setRenderParameter("jspPage", "/view-chapter.jsp");
        }catch (Exception e){
            System.out.println("Error occur in UserView Save Action");
        }
    }
}