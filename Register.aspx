<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Topstar.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     &nbsp;<table style="width: 100%">
        <tr>
            <td colspan="3" style="text-align: center; font-size: xx-large; height: 71px;"><strong>Register </strong></td>
        </tr>
        <tr>
            <td class="footer-class" style="width: 634px; height: 51px; text-align: right;">Last Name:</td>
            <td style="text-align: center; width: 265px; height: 51px;">
                <asp:TextBox ID="txtLastName" runat="server" Width="262px" Height="29px" BackColor="#CCFFCC"></asp:TextBox>
            </td>
            <td style="height: 51px">
                <asp:RequiredFieldValidator ControlToValidate="txtLastName" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter user id" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 50px; width: 634px; text-align: right;" class="footer-class">First Name:</td>
            <td style="text-align: center; width: 265px; height: 50px">
                <asp:TextBox ID="txtFirstName" runat="server" Width="262px" Height="29px" BackColor="#CCFFCC"></asp:TextBox>
            </td>
            <td style="height: 50px">
                <asp:RequiredFieldValidator ControlToValidate="txtFirstName" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter user id" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 50px; width: 634px; text-align: right;" class="footer-class">User Name:</td>
            <td style="height: 50px; text-align: center; width: 265px">
                <asp:TextBox ID="txtUserName" runat="server" Width="262px" Height="29px" BackColor="#CCFFCC"></asp:TextBox>
            </td>
            <td style="height: 50px">
                <asp:RequiredFieldValidator ControlToValidate="txtUserName" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter user id" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 50px; width: 634px; text-align: right;" class="footer-class">Password:</td>
            <td style="text-align: center; width: 265px; height: 50px">
                <asp:TextBox ID="txtPass" runat="server" Width="262px" Height="29px" BackColor="#CCFFCC"></asp:TextBox>
            </td>
            <td style="height: 50px">
                <asp:RequiredFieldValidator ControlToValidate="txtPass" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter user id" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 55px; width: 634px; text-align: right;" class="footer-class">Comfirm Password:</td>
            <td style="text-align: center; width: 265px; height: 55px;">
                <asp:TextBox ID="txtCPass" runat="server" Width="262px" Height="29px" BackColor="#CCFFCC"></asp:TextBox>
            </td>
            <td style="height: 55px">
                <asp:CompareValidator ControlToValidate="txtCPass" ControlToCompare="txtPass" ID="CompareValidator1" runat="server" ErrorMessage="Password not same" ForeColor="Red">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 55px; width: 634px; text-align: right;" class="footer-class">User Type:</td>
            <td style="text-align: left; width: 265px; height: 55px;">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="267px">
                </asp:DropDownList>
            </td>
            <td style="height: 55px">
                <asp:RequiredFieldValidator ControlToValidate="DropDownList1" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please select  user type" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 54px; width: 634px; text-align: right;" class="footer-class">Phone Number:</td>
            <td style="height: 54px; text-align: center; width: 265px">
                <asp:TextBox ID="txtPNO" runat="server" Width="262px" Height="29px" BackColor="#CCFFCC"></asp:TextBox>
            </td>
            <td style="height: 54px">
                <asp:RequiredFieldValidator ControlToValidate="txtPNO" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter phone number" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 54px; width: 634px; text-align: right;" class="footer-class">E-mail:</td>
            <td style="height: 54px; text-align: center; width: 265px">
                <asp:TextBox ID="txtEmail" runat="server" Width="262px" Height="29px" BackColor="#CCFFCC"></asp:TextBox>
            </td>
            <td style="height: 54px">
                <asp:RegularExpressionValidator ControlToValidate="txtEmail" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter your email" ForeColor="Red">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 61px; width: 634px; text-align: right;" class="footer-class">Address:</td>
            <td style="height: 61px; text-align: center; width: 265px">
                <asp:TextBox ID="txtAddress" runat="server" Width="262px" Height="29px" BackColor="#CCFFCC"></asp:TextBox>
            </td>
            <td style="height: 61px">
                <asp:RequiredFieldValidator ControlToValidate="txtAddress" ID="RequiredFieldValidator8" runat="server" ErrorMessage="please enter address" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 26px; text-align: center;" colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" BackColor="#27DA93" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="39px" Text="Cancel" Width="135px" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnRegister" runat="server" BackColor="#27DA93" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="39px" Text="Register" Width="135px" />
                <asp:Button ID="Button2" runat="server" Text="Button" />
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        </table>

</asp:Content>
