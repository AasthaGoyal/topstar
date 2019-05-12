<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="AddPanel.aspx.cs" Inherits="Topstar.WebForm20" %>
<%@ MasterType VirtualPath="~/AdminLogin.Master" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<meta name="viewport" content="width=device-width, initial-scale=1" /> 
	<link href="Content/bootstrap.min.css" rel="stylesheet" /> 
	<link href="Content/site.css" rel="stylesheet" /> 
	<script src="Scripts/jquery-1.9.1.min.js"></script> 
	<script src="Scripts/bootstrap.min.js"></script>
	<link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
		<link rel="stylesheet" href="~/css/site.css" />
	<form runat="server">
	<div class="container">
		<h1> Add or Edit Panel Items:</h1>
		<br />
		
					   <asp:Label ID="Label0" runat="server" Text="Company Logo:"></asp:Label>
					
					 <asp:FileUpload ID="fpLogoImage" runat="server" width="80%"/>
		<br />
			
					<asp:Label ID="Label1" runat="server" Text="Company name:"></asp:Label>
					
					<asp:TextBox ID="txtComName" runat="server" class="form-control"></asp:TextBox>
				<br />
						
					<asp:Label ID="Label2" runat="server" Text="Company Address:"></asp:Label>
					
					<asp:TextBox ID="txtComAddress" runat="server" class="form-control" ></asp:TextBox>
				<br />
					<asp:Label ID="Label3" runat="server" Text="Company Phone No:"></asp:Label>
				
					<asp:TextBox ID="txtComPhoneNo" runat="server" class="form-control"></asp:TextBox>
				<br />
				<asp:Label ID="Label4" runat="server" Text=" About Us:"></asp:Label>
						<asp:TextBox ID="txtAboutUs" runat="server" class="form-control"></asp:TextBox>
			
			<br />
		<asp:Label ID="Label5" runat="server" Text="Navigation Bar Settings:" Font-Bold="True"></asp:Label>
		<br />

					<asp:Label ID="Label7" runat="server" Text="Navigation Bars"></asp:Label>
					
		
		&nbsp;&nbsp;&nbsp;
					
		
		<asp:DropDownList ID="DropDownList1" width="80%" runat="server" DataSourceID="SqlDataSource2"></asp:DropDownList>
				<br />
				<br />
		<asp:Label ID="Label6" runat="server" Text="Navigation Icon:"></asp:Label>
					   <asp:FileUpload ID="fuIcon" runat="server" width="80%"/>
		<br />
		<br />
		<asp:Label ID="Label8" runat="server" Text="Navigation Name:"></asp:Label>
		<asp:TextBox ID="txtNavigation" runat="server" CssClass ="form-control"></asp:TextBox>
		<br />
					
						<asp:button id="btnUpload" type="submit" text="Submit" runat="server" class="btn-primary form-control" OnClick="btnUpload_Click"></asp:button>
					<br />
						<asp:Label ID="lbMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT DISTINCT [navName] FROM [tbnavigation]"></asp:SqlDataSource>
				
	</div>
		</form>
</asp:Content>
