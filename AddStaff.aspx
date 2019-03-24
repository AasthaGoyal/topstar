<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="Topstar.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <link href="Content/bootstrap.min.css" rel="stylesheet" /> 
    <link href="Content/site.css" rel="stylesheet" /> 
    <script src="Scripts/jquery-1.9.1.min.js"></script> 
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
        <link rel="stylesheet" href="~/css/site.css" />

    <div class="Container" >
        <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;">
    Add a new Staff of access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </label>
    <asp:DropDownList ID="dpType" runat="server"  Width="198px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Font-Size="Large"  Height="39px">
        <asp:ListItem Selected="True">Select one</asp:ListItem>
        <asp:ListItem>Tradesperson</asp:ListItem>
        <asp:ListItem>Agent</asp:ListItem>
        <asp:ListItem>Admin</asp:ListItem>
    </asp:DropDownList>
        <br />
     <br />


        <asp:TextBox ID="txtLastname" class="form-control" placeholder="Enter last name" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtFirstName" class="form-control" placeholder="Enter First name" runat="server"></asp:TextBox>
 <br />
        <asp:TextBox ID="txtPhoneNo" class="form-control" placeholder="Enter Phone No" runat="server"></asp:TextBox>
 
        <br />
        <asp:TextBox ID="txtUsername" class="form-control" placeholder="Enter Username" runat="server"></asp:TextBox>
 
        <br />
        <asp:TextBox ID="txtPassword" class="form-control" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
 
        <br />
        <asp:TextBox ID="txtCPassword" class="form-control" placeholder="Confirm Password" runat="server" TextMode="Password"></asp:TextBox>

        <br />
        <asp:TextBox ID="txtEmail" class="form-control" placeholder="Enter Email Id" runat="server"></asp:TextBox>
            <br />
        <asp:TextBox ID="txtAddress" class="form-control" placeholder="Enter Address" runat="server"></asp:TextBox>
 <br />

        <asp:Panel ID="pTrades" runat="server" Visible="False">
            <asp:Label ID="Label1" runat="server" Text="Company Information" Font-Bold="True"></asp:Label>
            <br />
             <asp:TextBox ID="txtTradestype" class="form-control" placeholder="Tradesperson Type" runat="server"></asp:TextBox>
            <br />
             <asp:TextBox ID="txtCname" class="form-control" placeholder="Company name" runat="server"></asp:TextBox>
            <br />
             <asp:TextBox ID="txtCaddress" class="form-control" placeholder="Company address" runat="server"></asp:TextBox>
            <br />
             <asp:TextBox ID="txtCphoneNo" class="form-control" placeholder="Company Phone No" runat="server"></asp:TextBox>
            <br />
        </asp:Panel>

        <asp:Panel ID="pAgent" runat="server" Visible="False">
             <asp:TextBox ID="txtPosition" class="form-control" placeholder="Agent position" runat="server"></asp:TextBox>
            <br />
             <asp:TextBox ID="txtDepartment" class="form-control" placeholder="Agent department" runat="server"></asp:TextBox>
            <br />
             <asp:TextBox ID="txtExtNo" class="form-control" type="number" placeholder="Phone Extension No" runat="server"></asp:TextBox>
            <br />
        </asp:Panel>

     <br />

        <asp:Button ID="btnAdd" class="form-control btn-success" runat="server" Text="Add Member" OnClick="btnAdd_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000" ></asp:Label>
    </div>
    
</asp:Content>
