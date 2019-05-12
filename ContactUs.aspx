<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Topstar.WebForm13" %>
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
    <div class="container" style="margin-top:150px">
         <h1> <b> Send us a Message</b></h1>
    <br />
   
        <asp:Label ID="Label1" runat="server"  Text="Full Name:"></asp:Label>
                 <asp:TextBox ID="txtname" type="text" CssClass="form-control" runat="server"></asp:TextBox>
         
               
        <asp:Label ID="Label2" runat="server"  Text="Email Id:"></asp:Label>
                 <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" runat="server"></asp:TextBox>

        
        <asp:Label ID="Label3" runat="server"  Text="Message:"></asp:Label>
                 <asp:TextBox ID="txtMessage" type="text" CssClass="form-control" runat="server" Height="170px"></asp:TextBox>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Send" CssClass="form-control btn-primary" OnClick="btnSubmit_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000" ></asp:Label>
    </div>
   
    </form>
</asp:Content>
