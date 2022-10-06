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

<portlet:defineObjects />

<%
    Organization organization = (Organization) renderRequest.getAttribute("organization");
    String organizationId = String.valueOf(organization.getOrganizationId());
    String logoUrl="http://localhost:8080"+organization.getLogoURL();

%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .outerbox {
            padding-top: 50px;
            padding-right: 500px;
            padding-bottom: 500px;
            padding-left: 500px;
            display: grid;
            grid-template-columns: 3fr 3fr;
        }
        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            width: 1000px;
            height: 600px;
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }

        .container {

            display: grid;
            grid-template-columns: 3fr 3fr 3fr 3fr ;
            grid-column-gap:50px;
            grid-row-gap:50px;

        }
    </style>
</head>
<div class="outerbox">

    <div class="card text-center">
        <div>
            <div class="card-body">
                <h5 class="card-title"><%= organization.getName() %></h5>
                <p><%= organization.getComments() %></p>
                <br>
                <portlet:actionURL name="editChapter" var="editChapterURL">

                    <portlet:param name="organizationId" value= "<%= organizationId %>" />

                </portlet:actionURL>
                <a href="<%= editChapterURL%>">Edit</a>

            </div>
        </div>
        <div>
            <img src=<%=logoUrl%>  alt="...">
            <br>
            <portlet:actionURL var="uploadFile" name="uploadFileAction">
                <portlet:param name="organizationId" value= "<%= organizationId %>" />
            </portlet:actionURL>
            <aui:form action="<%=uploadFile %>" method="post" enctype="multipart/form-data">
                <aui:input type="file" name="imageFile" />
                <button type="submit" class="defaultButton" style="margin-left: 10px;">Change</button>
            </aui:form>
            <%--
                    </div>
                    <%--<img src=<%=logoUrl%> class="card-img-top" alt="...">
                    <b>Name : </b>--%>
        </div>
    </div>
</div>
</html>



