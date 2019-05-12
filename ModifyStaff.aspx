<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="ModifyStaff.aspx.cs" Inherits="Topstar.WebForm14" %>
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


        
    <div class="Container" >
        <form runat="server">
        <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;">
    Select a user type to edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </label>
    <asp:DropDownList ID="dpType" runat="server"  Width="198px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Font-Size="Large"  Height="39px">
        <asp:ListItem Selected="True">Select one</asp:ListItem>
        <asp:ListItem>Tradesperson</asp:ListItem>
        <asp:ListItem>Agent</asp:ListItem>
        <asp:ListItem>Admin</asp:ListItem>
    </asp:DropDownList>
        <br />
        <br />
         <table id="tbTradesperson" class="auto-style1">
            <tr>
                <td style="width: 212px">Last Name:</td>
                <td style="width: 216px">
                    <asp:TextBox ID="txtLastname" runat="server" Width="208px"></asp:TextBox>
                </td>
                <td style="width: 204px">Address:</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Width="208px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 212px">First name:</td>
                <td style="width: 216px">
                    <asp:TextBox ID="txtFirstname" runat="server" Width="208px"></asp:TextBox>
                </td>
                <td style="width: 212px">Phone no:</td>
                <td style="width: 216px">
                    <asp:TextBox ID="txtPhoneno" runat="server" Width="208px"></asp:TextBox>
                </td>
                </tr>
             <tr>
                   <td style="width: 212px">Username:</td>
                <td style="width: 216px">
                    <asp:TextBox ID="txtUsername" runat="server" Width="208px"></asp:TextBox>
                </td>
                  <td style="width: 212px">Email id:</td>
                <td style="width: 216px">
                    <asp:TextBox ID="txtEmailid" runat="server" Width="208px"></asp:TextBox>
                </td>
            </tr>
          </table>

                <asp:Panel ID="pnTradesperson" visibe="false" runat="server">
                     <asp:Label ID="Label3" runat="server" Text="Company Details:" Font-Bold="True"></asp:Label>
           
                    <table runat="server">
                    <tr>
                <td style="width: 204px">Tradesperson Type:</td>
                <td>
                    <asp:TextBox ID="txtTradesType" runat="server" Width="208px"></asp:TextBox>
                </td>
           
                
                <td style="width: 204px">Company name:</td>
                <td>
                    <asp:TextBox ID="txtCname" runat="server" Width="208px"></asp:TextBox>
                </td>
            </tr>
            <tr>
              
                <td style="width: 204px">Company phone no:</td>
                <td>
                    <asp:TextBox ID="txtCphoneno" runat="server" Width="208px"></asp:TextBox>
                </td>
       
               
                <td style="width: 204px">Company address:</td>
                <td>
                    <asp:TextBox ID="txtCAddress" runat="server" Width="208px"></asp:TextBox>
                </td>
             
            </tr>
                        </table>
                </asp:Panel>
        <asp:Panel ID="pnAgent" visible="false" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Agent Details:" Font-Bold="True"></asp:Label>
            <table>
                <tr>
                 <td style="width: 204px">Position</td>
                <td>
                    <asp:TextBox ID="txtPosition" runat="server" Width="208px"></asp:TextBox>
                </td>

                    <td style="width: 204px">Department</td>
                <td>
                    <asp:TextBox ID="txtDepartment" runat="server" Width="208px"></asp:TextBox>
                </td>
                </tr>
                <tr>
                    <td style="width: 204px">Extension Id:</td>
                <td>
                    <asp:TextBox ID="txtExtensionid" runat="server" Width="208px"></asp:TextBox>
                </td>
                </tr>
            </table>
        </asp:Panel>
       

        <br />

            <asp:GridView ID="gdView" visible="false" runat="server"  SelectionMethod="FullRowSelect" AutoGenerateColumns="False" DataKeyNames="personId,tradespersonid"  Height="261px" Width="411px" OnSelectedIndexChanged="gdView_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" >
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Image"  SelectImageUrl="~/images/tick.png" >
                    <ControlStyle Height="36px" Width="36px" />
                    </asp:CommandField>
                    <asp:BoundField DataField="personId" HeaderText="Person Id" InsertVisible="False" ReadOnly="True" SortExpression="personId" />
                    <asp:BoundField DataField="lastName" HeaderText="Last name" SortExpression="lastName" />
                    <asp:BoundField DataField="firstName" HeaderText="First name" SortExpression="firstName" />
                    <asp:BoundField DataField="phoneNo" HeaderText="Phone no" SortExpression="phoneNo" />
                      <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                    <asp:BoundField DataField="emailid" HeaderText="Email id" SortExpression="emailid" />
                    <asp:BoundField DataField="perAddress" HeaderText="Address" SortExpression="perAddress" />
                   <asp:BoundField DataField="tradespersonType" HeaderText="Type" SortExpression="tradespersonType" />
                    <asp:BoundField DataField="cname" HeaderText="Company" SortExpression="cname" />
                    <asp:BoundField DataField="cphone" HeaderText="Company contact no" SortExpression="cphone" />
                    <asp:BoundField DataField="caddress" HeaderText="Company address" SortExpression="caddress" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        <asp:SqlDataSource ID="sqltradesperson" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbtradesperson t, tbperson p where t.personid = p.personid"></asp:SqlDataSource>
        <br />
   
            <asp:GridView ID="gdAgent" visible="false" OnSelectedIndexChanged="gdAgent_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" SelectionMethod="FullRowSelect" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="agentid,personId1" >
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/tick.png" ShowSelectButton="True">
                    <ControlStyle Height="36px" Width="36px" />
                    </asp:CommandField>
                    <asp:BoundField DataField="personid" HeaderText="Person Id" SortExpression="personid" />
                       <asp:BoundField DataField="lastName" HeaderText="Last name" SortExpression="lastName" />
                    <asp:BoundField DataField="firstName" HeaderText="First name" SortExpression="firstName" />
                    <asp:BoundField DataField="phoneNo" HeaderText="Phone No" SortExpression="phoneNo" />
                    <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                       <asp:BoundField DataField="emailid" HeaderText="Enmail Id" SortExpression="emailid" />
                    <asp:BoundField DataField="perAddress" HeaderText="Address" SortExpression="perAddress" />
         
                    <asp:BoundField DataField="position" HeaderText="Position" SortExpression="position" />
                    <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                    <asp:BoundField DataField="extentionNo" HeaderText="Extension No" SortExpression="extentionNo" />
                        </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="sqlagent" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbagent a, tbperson p where a.personid = p.personid"></asp:SqlDataSource>
   
        <br />
        <asp:GridView ID="gdAdmin" visible="False" SelectionMethod="FullRowSelect" OnSelectedIndexChanged="gdAdmin_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="adminid,personId1" >
            <Columns>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/tick.png" ShowSelectButton="True">
                <ControlStyle Height="36px" Width="36px" />
                </asp:CommandField>
                <asp:BoundField DataField="personid" HeaderText="Person Id" SortExpression="personid" />
                  <asp:BoundField DataField="lastName" HeaderText="Last name" SortExpression="lastName" />
                <asp:BoundField DataField="firstName" HeaderText="First name" SortExpression="firstName" />
                <asp:BoundField DataField="phoneNo" HeaderText="Phone no" SortExpression="phoneNo" />
                   <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                    <asp:BoundField DataField="emailid" HeaderText="Email Id" SortExpression="emailid" />
                <asp:BoundField DataField="perAddress" HeaderText="Address" SortExpression="perAddress" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
            <asp:SqlDataSource ID="sqladmin" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbadmin a, tbperson p where a.personid = p.personid"></asp:SqlDataSource>
           
            
            <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" OnClick="btnUpdate_Click" Text="Update" />
            <asp:label ID="txtpersonid" runat="server" Visible =" false"></asp:label>
            <asp:Button ID="btnDelete" class="btn btn-primary" runat="server" OnClick="btnDelete_Click" Text="Delete" />
            <br />
        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <br />
            </form>
        </div>
</asp:Content>
