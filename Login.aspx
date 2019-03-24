<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Topstar.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <table style="width: 100%">
        <tr>
            <td colspan="4" style="text-align: center; font-size: xx-large; height: 66px;"><strong>Login<a href="Login.aspx" /></strong></td>
        </tr>
        <tr>
            <td style="height: 52px; width: 637px;"></td>
            <td class="footer-class" style="height: 52px; width: 82px;">User Id:</td>
            <td style="height: 52px" colspan="2">
                <asp:TextBox ID="txtUserId" runat="server" Height="31px" style="margin-left: 0px" Width="196px"></asp:TextBox>
              //  <asp:RequiredFieldValidator ControlToValidate="txtUserId" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter user id" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 67px; width: 637px;"></td>
            <td class="footer-class" style="height: 67px; width: 82px;">Password:</td>
            <td style="height: 67px" colspan="2">
                <asp:TextBox ID="txtPass" runat="server" Height="31px" style="margin-left: 0px" Width="196px"></asp:TextBox>
            //    <asp:RequiredFieldValidator ControlToValidate="txtPass" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter password" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 51px; text-align: center">
                <asp:Button ID="btnCancel" runat="server" BackColor="#27DA93" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="39px" Text="Cancel" Width="135px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnLogin0" runat="server" BackColor="#27DA93" CausesValidation = "false" UserSubmitBehavior= "false" Font-Bold=" True" Font-Size="Medium" ForeColor="White" Height="39px" Text="Login" Width="135px" />
            </td>
        </tr>
        <tr>
            <td style="width: 637px">&nbsp;</td>
            <td class="footer-class" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>


</asp:Content>
