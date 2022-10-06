<%@ include file="/init.jsp" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ page import="javax.portlet.*"%>
<%@ page import ="com.liferay.portal.kernel.model.User"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.liferay.portal.kernel.model.Organization"%>
<%@ page import ="com.liferay.portal.kernel.service.RegionServiceUtil"%>
<%@ page import ="com.liferay.portal.kernel.service.ImageLocalServiceUtil"%>
<%@ page import =" com.liferay.portal.kernel.model.Image"%>

<%-- <%   %> --%>
<%-- %> <%  --%>

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
/*
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
*/
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

		/*.card:hover {
			box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}*/

		.container {

			display: grid;
			grid-template-columns: 4fr 4fr 4fr 4fr ;
			grid-template-rows:2fr;
			grid-column-gap:50px;
			grid-row-gap:50px;

		}
		.first-container{
			display: grid;
			grid-template-columns: 4fr 6fr;
			grid-column-gap:50px;
		}
		.left{
			text-align: left;
			display: inline-block;
		}
		.right{
			text-align: right;
			position: absolute;
			right:    10px;
			bottom:   10px;
		}
		.card-img-overlay {
			position: absolute;
			bottom: 5px;
			flex-shrink: 5;
		}

	</style>
</head>
<body>
<%--
<div class="outerbox">
	<div class="container">

		<%
			List<Organization> organizationList= (List<Organization>) renderRequest.getAttribute("organizationList");
			for(Organization organization : organizationList){
				//String regionName = RegionServiceUtil.getRegion(organization.getRegionId()).getName();
				String orgName = organization.getName();
				String organizationId=String.valueOf(organization.getOrganizationId());
				String logoUrl="http://localhost:8080"+organization.getLogoURL();
				/*String orgType = organization.getType();*/
				//Image image = ImageLocalServiceUtil.getImage(organization.getLogoId());

		%>


		<div class="card-deck mt-5">
			<div class="card h-40 w-40" >
				<img src=<%=logoUrl%> class="card-img-top" alt="...">
				<div class="card-footer text-center"><b> <%= orgName %>    </b>
					<br>
					<portlet:actionURL name="viewChapter" var="viewChapterURL">

						<portlet:param name="organizationId" value= "<%= organizationId %>" />

					</portlet:actionURL>
					<a href="<%= viewChapterURL%>" class="btn btn-primary"> View </a>
&lt;%&ndash;
					<a href="http://localhost:8080/home" class="btn btn-primary">View</a>
&ndash;%&gt;
				</div>
			</div>
		</div>
		<%
			}
		%>

	</div>
</div>

</body>--%>

	<%
			Organization organization= (Organization) renderRequest.getAttribute("myOrganization");
			String orgName = organization.getName();
			String bio=organization.getComments();
			String organizationId=String.valueOf(organization.getOrganizationId());
			String logoUrl="http://localhost:8080"+organization.getLogoURL();
	%>
<div class="outerbox">
	<div class="card">
		<div class="first-container" >
			<div class="left"><p><b>Edit Image</b></p></div>
			<div class="left"><p><b>Edit Details</b></p></div>
			<div  class="card" style="width:100%;">
				<img src=<%=logoUrl%> class="card-img-top" alt="...">
					<div class="card-img-overlay  w-100 h-100 d-flex flex-column justify-content-end p-2 mt-10 mb-2 bg-secondary text-white">
					<portlet:actionURL var="uploadFile" name="uploadFileAction">
						<portlet:param name="organizationId" value= "<%= organizationId %>" />
					</portlet:actionURL>
					<aui:form action="<%=uploadFile%>" method="post" >

						<%--<input type="file" id="upload" name="imageFile" style="visibility: hidden; width: 1px; height: 1px" multiple />
						<a href="<%=uploadFile%>" onclick="document.getElementById('upload').click(); return false">Upload File</a>
						--%>
						<aui:input type="file" id="upload" name="imageFile" label="Choose" class="position-absolute bottom-0 text-light w-100"
								   style="background-color: rgba(0, 0, 0, 0.5);display:none;"/>
						<button type="submit" class="btn btn-primary" style="margin-left: 10px;">Edit</button>
					</aui:form>
				    </div>
			</div>
			<div class="left">
				<portlet:actionURL name="saveChapter" var="saveChapterURL">
					<portlet:param name="organizationId" value= "<%= organizationId %>" />
				</portlet:actionURL>
				<aui:form action="${saveChapterURL}" name="editChapterForm">
					<aui:fieldset>
						<label style="float: left"><b>Title </b></label>
						<aui:input name="name" label="" value ="<%= organization.getName() %>"/>
						<label style="float: left"><b>Details </b></label>
						<aui:input name="bio" label="" value="<%=organization.getComments()%>" type="textarea"/>
					</aui:fieldset>
					<div class="right">
					<%--<aui:button-row>
						<aui:button type="submit" label="Edit" >Edit</aui:button>
					</aui:button-row>--%>
						<button type="submit" class="btn btn-primary" style="margin-left: 10px;">Edit</button>
					</div>
				</aui:form>
			</div>
		</div>
	</div>
</div>
</html>


