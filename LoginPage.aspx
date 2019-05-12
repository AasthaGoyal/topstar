<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Topstar.WebForm10" %>
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
   
   
        <h2 style="text-align: center"> Login</h2>
   
            <br />
            <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
      <asp:RequiredFieldValidator ControlToValidate="txtId" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter User ID" ForeColor="Red" Font-Bold="False" Font-Underline="False">* Username is required</asp:RequiredFieldValidator>
     <br />
            <asp:TextBox ID="txtId" runat="server"  class="form-control"  ></asp:TextBox>
        
    <br />
            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
    <asp:RequiredFieldValidator ControlToValidate="txtPass" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Your Password" ForeColor="Red" Font-Bold="False">*Password is required</asp:RequiredFieldValidator>
   <br />
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password"  class="form-control" style="margin-bottom: 1px"></asp:TextBox>
    <br />
   
            <asp:Button ID="btnLogin" runat="server" class="form-control btn-success"  Text="Login"  OnClick="btnLogin_Click" />
  <table style="width:100%" >
      <tr>
          <td style="width:50%">    <a href="#" onclick="window.open('ForgotPassword.aspx','FP','width=500, height=100,top=300,left=500,fullscreen=null,resize=0');">
                <asp:Label ID="Label4" runat="server" Text="Forgot Password" Font-Bold="True" ForeColor="#333399"></asp:Label>
          
             
            </a></td>
          <td style="text-align: right; width:50%"> 
              <a href="RegisterPage.aspx">
                 
                      <asp:Label ID="Label5"  runat="server" Text="New User? Register"  Font-Bold="True" ForeColor="#333399"></asp:Label>
           
              
                 </a>
          </td>
      </tr>
  </table>
  
            <asp:Label  ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
           
          
            <asp:Label ID="Label1" runat="server" ></asp:Label>
       
            </form>
         </div>
</asp:Content>
