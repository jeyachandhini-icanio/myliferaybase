<%@ include file="/init.jsp" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ page import ="com.liferay.portal.kernel.model.User"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.liferay.portal.kernel.model.Organization"%>
<%@ page import ="com.liferay.portal.kernel.service.RegionServiceUtil"%>
<%@ page import ="com.liferay.portal.kernel.service.ImageLocalServiceUtil"%>
<%@ page import =" com.liferay.portal.kernel.model.Image"%>

<%-- <%   %> --%>
<%-- %> <%  --%>

<%--<portlet:defineObjects />

<%
    Organization organization = (Organization) renderRequest.getAttribute("organization");
    String organizationId = String.valueOf(organization.getOrganizationId());

%>

<portlet:actionURL name="saveChapter" var="saveChapterURL">

    <portlet:param name="organizationId" value= "<%= organizationId %>" />

</portlet:actionURL>

<aui:form action="${saveChapterURL}" name="editChapterForm">


    <aui:fieldset>

        <aui:input name="name"  value ="<%= organization.getName() %>"/>
        <aui:input name="bio" label="Bio" value="<%=organization.getComments()%>" type="textarea"/>



        &lt;%&ndash;<portlet:actionURL name="editUploadImage" var="editUploadImageURL">

            <portlet:param name="organizationId" value= "<%= organizationId %>" />

        </portlet:actionURL>

        <a href="<%= editUploadImageURL%>"> Image Upload </a>&ndash;%&gt;


    </aui:fieldset>

    <aui:button-row>

        <aui:button type="submit"></aui:button>

    </aui:button-row>
</aui:form>--%>
<portlet:defineObjects />



<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .outerbox {
            padding-top: 50px;
            padding-right: 80px;
            padding-bottom: 50px;
            padding-left: 80px;

        }
        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            text-align: center;
            padding: 1.5em .5em .5em;
            border-radius: 2em;
            /*width: 100%;*/
        }
        /*img{
            width: 65%;
            border-radius: 20%;
            margin: 0 auto;
            !*box-shadow: 0 0 10px rgba(0,0,0,.2);*!
        }*/

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }

        .container {

            display: grid;
            grid-template-columns: 4fr 4fr 4fr 4fr ;
            grid-template-rows:2fr;
            grid-column-gap:50px;
            grid-row-gap:50px;

        }
        .containergrid{
            display: grid;
            grid-template-columns: 4fr 6fr  ;

        }
    </style>
</head>
<body>
    <%
			Organization organization= (Organization) renderRequest.getAttribute("organization");
			String orgName = organization.getName();
			String bio=organization.getComments();
			String organizationId=String.valueOf(organization.getOrganizationId());
			String logoUrl="http://localhost:8080"+organization.getLogoURL();
	%>
<div class="outerbox">
    <div class="card">
        <div class="containergrid" >
            <div>
                <div>
                    <img src=<%=logoUrl%> class="card-img-top" alt="...">
                </div>
                <div>
                    <portlet:actionURL var="uploadFile" name="uploadFileAction">
                        <portlet:param name="organizationId" value= "<%= organizationId %>" />
                    </portlet:actionURL>
                    <aui:form action="<%=uploadFile%>" method="post" enctype="multipart/form-data">
                        <aui:input type="file" name="imageFile" />
                        <button type="submit" class="defaultButton" style="margin-left: 10px;">Edit</button>
                    </aui:form>
                </div>
            </div>
            <div>
                <portlet:actionURL name="saveChapter" var="saveChapterURL">
                    <portlet:param name="organizationId" value= "<%= organizationId %>" />
                </portlet:actionURL>
                <aui:form action="${saveChapterURL}" name="editChapterForm">
                <aui:fieldset>
                    <aui:input name="name"  value ="<%= organization.getName() %>"/>
                    <aui:input name="bio" label="Bio" value="<%=organization.getComments()%>" type="textarea"/>
                </aui:fieldset>
                <aui:button-row>
                    <aui:button type="submit">Save</aui:button>
                </aui:button-row>
                </aui:form>
            </div>
        </div>
    </div>
</div>
</html>