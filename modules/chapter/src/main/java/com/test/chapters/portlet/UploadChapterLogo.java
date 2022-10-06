package com.test.chapters.portlet;

import com.liferay.portal.kernel.io.ByteArrayFileInputStream;
import com.liferay.portal.kernel.model.Group;
import com.liferay.portal.kernel.model.LayoutSet;
import com.liferay.portal.kernel.model.Organization;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.service.GroupLocalServiceUtil;
import com.liferay.portal.kernel.service.LayoutSetLocalServiceUtil;
import com.liferay.portal.kernel.service.OrganizationLocalServiceUtil;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.StreamUtil;
import com.test.chapters.constants.ChapterPortletKeys;
import org.osgi.service.component.annotations.Component;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;

import static com.liferay.portal.kernel.service.OrganizationLocalServiceUtil.getOrganization;
import static com.liferay.portal.kernel.service.OrganizationLocalServiceUtil.getService;


@Component(
        immediate = true,
        property = {
                "javax.portlet.name=" + ChapterPortletKeys.CHAPTER,
                "mvc.command.name=uploadFileAction"
        },
        service = MVCActionCommand.class
)
public class UploadChapterLogo extends BaseMVCActionCommand {
    @Override
    protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) {
        try {
            System.out.println("enter save image call");
            UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(actionRequest);
            String sourceFileName = uploadPortletRequest.getFileName("imageFile");
            System.out.println("sourceFileName:"+sourceFileName);

            byte[] bytes=null;

            try {
                File file = uploadPortletRequest.getFile("imageFile",true);//getFile("imageFile");

                System.out.println("file name:"+file.getName());
                bytes = new byte[(int) file.length()];
                System.out.println("file length:"+file.length());

                try(FileInputStream fis = new FileInputStream(file)){
                    fis.read(bytes);
                }
                System.out.println("1");
                if (!file.exists()) {
                    System.out.println("Empty File");
                    System.out.println("2");
                }
                if ((file != null) && file.exists()) {
                    System.out.println("3");
                }
            }
            finally {

            }
            System.out.println("4");
            Long organizationId =Long.valueOf(ParamUtil.get(actionRequest,"organizationId",""));
            System.out.println("5");
            Organization organizationEditData = getOrganization(organizationId);
            System.out.println("6");
            getService().updateLogo(organizationId,bytes);
            System.out.println("7");

            System.out.println("update image done");
            OrganizationLocalServiceUtil.updateOrganization(organizationEditData);
            System.out.println("8");


        } catch (Exception e) {
            System.out.println("Error occur in SaveImage Action");
            System.out.println("Error : " + e);
        }
    }
}
