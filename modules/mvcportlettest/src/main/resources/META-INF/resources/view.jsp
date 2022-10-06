<%@ include file="/init.jsp" %>

<%--<p>
	<b><liferay-ui:message key="product.caption"/></b>
</p>--%>
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
		/*.card {
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
			transition: 0.3s;
			width: 40%;
		}

		.card:hover {
			box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}

		.container {
			padding: 2px 16px;
		}*/
		.column {
			float: left;
			width: 25%;
			padding: 0 10px;
		}

		/* Remove extra left and right margins, due to padding in columns */
		.row {margin: 0 -5px;}
		.outerbox {
			padding-top: 50px;
			padding-right: 30px;
			padding-bottom: 50px;
			padding-left: 80px;

		}

		/* Clear floats after the columns */
		.row:after {
			content: "";
			display: grid;
			clear: both;
		}
		@media screen and (max-width: 600px) {
			.column {
				width: 100%;
				display: block;
				margin-bottom: 20px;
			}
		}
		.card {
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
			transition: 0.3s;
			/*width: 100%;*/
		}

		.card:hover {
			box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}

		.container {
/*
			padding: 2px 16px;
*/
			display: grid;
			grid-template-columns: 3fr 3fr 3fr 3fr ;
			grid-column-gap:50px;
			grid-row-gap:50px;
			/*margin-left: 5em;
			margin-right: 5em;*/

		}
        /*.card-deck {
			grid-template-columns: 4fr 4fr 4fr 4fr;
		}*/
	</style>
</head>
<body>

<%--
<h1> <%= regionName %> </h1>
--%>
<div class="outerbox">
<div class="container">

	<%
		List<Organization> organizationList= (List<Organization>) renderRequest.getAttribute("organizationList");
		for(Organization organization : organizationList){
			//String regionName = RegionServiceUtil.getRegion(organization.getRegionId()).getName();
			String orgName = organization.getName();
			String logoUrl="http://localhost:8080"+organization.getLogoURL();
			/*String orgType = organization.getType();*/
			//Image image = ImageLocalServiceUtil.getImage(organization.getLogoId());

	%>
	<div class="card-deck mt-5">
	<div class="card h-40 w-40" >
	<img src=<%=logoUrl%> class="card-img-top" alt="...">
		<div class="card-img-overlay">
		    <div class="card-footer"><b> <%= orgName %></b> </div>
<%--
		<a href="http://localhost:8080/home" class="btn btn-primary">View</a>
--%>
	    </div>
</div>
	</div>
	<%
		}
	%>

</div>
</div>


<%--<div class="card">
	<div class="container">
&lt;%&ndash;
&lt;%&ndash;
		<img src = <%= image %> alt="image" style="width:100%">
&ndash;%&gt;&ndash;%&gt;
	<img src =<%=logoUrl%>  alt="image" style="width:100%">
		<h3><b> <%= orgName %> </b></h3>

		<style>
			.button {
				padding: 5px 10px;
				font-size: 10px;
				text-align: center;
				cursor: pointer;
				outline: none;
				color: #fff;
				background-color: #04AA6D;
				border: none;
				border-radius: 15px;
				box-shadow: 0 9px #999;
			}

			.button:hover {background-color: #3e8e41}

			.button:active {
				background-color: #3e8e41;
				box-shadow: 0 5px #666;
				transform: translateY(4px);
			}
		</style>
&lt;%&ndash;
		&lt;%&ndash;<button class="button"><%= orgType %></button>&ndash;%&gt;
&ndash;%&gt;
	</div>
</div>--%>

</body>
</html>


