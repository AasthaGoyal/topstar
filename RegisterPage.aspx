<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="Topstar.WebForm11" %>
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

 <div style="margin-top:150px" class="container">

   <form runat="server">
       <h2> Register</h2>
  
       Last Name:<asp:RequiredFieldValidator ControlToValidate="txtLastName" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter user Last name" ForeColor="Red"></asp:RequiredFieldValidator>
    
         
                <asp:TextBox ID="txtLastName" runat="server" class="form-control" ></asp:TextBox>
           
                 <br />
            First Name:   <asp:RequiredFieldValidator ControlToValidate="txtFirstName" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter user First name" ForeColor="Red"></asp:RequiredFieldValidator>
          
         
                <asp:TextBox ID="txtFirstName" runat="server" class="form-control" ></asp:TextBox>
          <br />
               User Name:   <asp:RequiredFieldValidator ControlToValidate="txtUserName" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter user name" ForeColor="Red"></asp:RequiredFieldValidator>
            
          
                <asp:TextBox ID="txtUserName" runat="server" class="form-control" ></asp:TextBox>
           
           <br />
       Password:  <asp:RequiredFieldValidator ControlToValidate="txtPass" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter user id" ForeColor="Red"></asp:RequiredFieldValidator>
            
           
                <asp:TextBox ID="txtPass" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
           <br />
           Comfirm Password:  <asp:CompareValidator ControlToValidate="txtCPass" ControlToCompare="txtPass" ID="CompareValidator1" runat="server" ErrorMessage="Password not same" ForeColor="Red"></asp:CompareValidator>
        
      
                <asp:TextBox ID="txtCPass" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
         
      <%--  <tr>
            <td style="height: 55px; width: 615px; text-align: right;" class="footer-class">User Type:</td>
            <td style="text-align: left; width: 265px; height: 55px;">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="261px">
                    <asp:ListItem Value="admin"></asp:ListItem>
                    <asp:ListItem>tradesperson</asp:ListItem>
                    <asp:ListItem>customer</asp:ListItem>
                    <asp:ListItem>staff</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="height: 55px">
                <asp:RequiredFieldValidator ControlToValidate="DropDownList1" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please select  user type" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>--%>
       <br />
       Phone Number: <asp:RequiredFieldValidator ControlToValidate="txtPNO" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter phone number" ForeColor="Red"></asp:RequiredFieldValidator>
           
         
                <asp:TextBox ID="txtPNO" runat="server" class="form-control" ></asp:TextBox>
       <br />
          
        E-mail:     <asp:RegularExpressionValidator ControlToValidate="txtEmail" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter your email" ForeColor="Red" ></asp:RegularExpressionValidator>
         
           
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" ></asp:TextBox>
           <br />
          Address:  <asp:RequiredFieldValidator ControlToValidate="txtAddress" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter address" ForeColor="Red"></asp:RequiredFieldValidator>
          
           
                <asp:TextBox ID="txtAddress" runat="server" class="form-control" ></asp:TextBox>
            <br />
    
                <asp:Button class="form-control btn-success" ID="Button3" runat="server"  Font-Bold="True" Font-Size="Medium" ForeColor="White" OnClick="Button3_Click" Text="Register" />
         <br />
               <a href="LoginPage.aspx"><asp:Label ID="lblLogin" runat="server" Text="Already a member? Login" Font-Bold="True"></asp:Label> </a>
   
         <br />
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            
       </form>
     </div>
</asp:Content>
