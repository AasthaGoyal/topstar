<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Topstar.WebForm5" %>
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
        <div style="margin-top:150px" >
    <h2> Reset your password</h2>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Registered Username:"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Username is required" ControlToValidate="txtUsername" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter the Username" CssClass="form-control"></asp:TextBox>
<br />
    <asp:Label ID="Label2" runat="server" Text="New password:"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Password is required" ControlToValidate="txtPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter new Password" CssClass="form-control"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Confirm new password:"></asp:Label>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="* The passwords dont match" ControlToCompare="txtConfirmPassword" ControlToValidate="txtPassword" Font-Bold="True" ForeColor="#CC0000"></asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Please enter the password again" ControlToValidate="txtConfirmPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder ="Confirm new password" CssClass="form-control"></asp:TextBox>
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Reset Password" class="form-control btn-primary" OnClick="btnSubmit_Click"/>
    <br />
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000" ></asp:Label>
            &nbsp;&nbsp;
            <a href="LoginPage.aspx"> <asp:Label ID="lblLogin" runat="server" visible ="false" Text="Login to continue" Font-Bold="True"></asp:Label></a>
            </div>
        </form>
</asp:Content>
