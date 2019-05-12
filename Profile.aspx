<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Topstar.WebForm19" %>
<%@ MasterType VirtualPath="~/HomeMaster.Master" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <link href="Content/bootstrap.min.css" rel="stylesheet" /> 
    <link href="Content/site.css" rel="stylesheet" /> 
    <script src="Scripts/jquery-1.9.1.min.js"></script> 
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
        <link rel="stylesheet" href="~/css/site.css" />

    <div class="container" style="margin-top:150px">
        <form runat="server">
    
    <h1 style="text-align: center; font-size: xx-large; height: 83px; font-weight: bold;"> Welcome <asp:Label ID="lblname" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label></h1>
    <br />
   First Name:
                  
                   <asp:TextBox ID="txtfname" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
              Last Name:
             <asp:TextBox ID="txtlname" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Username:
             <asp:TextBox ID="txtusername" CssClass="form-control" runat="server"></asp:TextBox>
   <br />
            Phone No:
              <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
    Email Id:  
               <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            Home Address:
                <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
             Password: 
                   <asp:Button ID="btnChangePassword" class="btn-success" runat="server" Text="Change Password" Width="161px" OnClick="btnChangePassword_Click" />
                
        <br />
            
           
                   <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
               
       
        <br />
                <asp:Button ID="btnEdit" class="btn-primary form-control" runat="server"  OnClick="btnEdit_Click" Text="Edit" />
      <br />
         <asp:Button ID="btnUpdate" class="btn-danger form-control" runat="server"  OnClick="btnUpdate_Click" Text="Update" />
      <br />
            </form>
      </div>
       
    
</asp:Content>
