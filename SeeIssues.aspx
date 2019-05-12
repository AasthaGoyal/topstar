<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="SeeIssues.aspx.cs" Inherits="Topstar.WebForm8" %>
<%@ MasterType VirtualPath="~/AdminLogin.Master" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
    <div class="container">
        <h2> Issues</h2>
        <br />

        <asp:Button ID="btnSolved" runat="server" Height="34px" Text="Solved Issues" Width="250px" OnClick="btnSolved_Click" />
        <asp:Button ID="btnUnsolved" runat="server" Height="34px" Text="Current Unsolved Issues" Width="250px" OnClick="btnUnsolved_Click" />
        <br />
        <br />
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" DataKeyField="issueid" >
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="184px" ImageUrl='<%# Eval("issuePhoto") %>' Width="234px" />
                <br />
                Property Id:
                <asp:Label ID="propertyidLabel" runat="server" Text='<%# Eval("propertyid") %>' />
                <br />
                Name:
                <asp:Label ID="issueNameLabel" runat="server" Text='<%# Eval("issueName") %>' />
                <br />
                Description:
                <asp:Label ID="issueDescriptionLabel" runat="server" Text='<%# Eval("issueDescription") %>' />
                <br />
                Issue Date:
                <asp:Label ID="issueDateLabel" runat="server" Text='<%# Eval("issueDate") %>' />
                <br />
                Tradesperson:
                <asp:Label ID="tradespersonidLabel" runat="server" Text='<%# Eval("tradespersonid") %>' />
                <br />
                customerid:
                <asp:Label ID="customeridLabel" runat="server" Text='<%# Eval("customerid") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="sqlSolved" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [propertyid], [issueid], [issueDescription], [issueName], [tradespersonid], [issuePhoto], [customerid], [issueDate], [solvedPhoto] FROM [tbissues] WHERE ([solved] = @solved)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Yes" Name="solved" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

          <asp:SqlDataSource ID="sqlUnsolved" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [propertyid], [issueid], [issueDescription], [issueName], [tradespersonid], [issuePhoto], [customerid], [issueDate], [solvedPhoto] FROM [tbissues] WHERE ([solved] = @solved)">
            <SelectParameters>
                <asp:Parameter DefaultValue="No" Name="solved" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</asp:Content>
