<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="SearchIssues.aspx.cs" Inherits="Topstar.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <link href="Content/bootstrap.min.css" rel="stylesheet" /> 
    <link href="Content/site.css" rel="stylesheet" /> 
    <script src="Scripts/jquery-1.9.1.min.js"></script> 
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
        <link rel="stylesheet" href="~/css/site.css" />

    <div class="container">
        <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;">
    Search Issue by Property Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </label>

        <asp:TextBox ID="txtPropertyid" runat="server" AutoPostBack="True" OnTextChanged="txtPropertyid_TextChanged"></asp:TextBox>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="issueid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="propertyid" HeaderText="propertyid" SortExpression="propertyid" />
                <asp:BoundField DataField="issueid" HeaderText="issueid" InsertVisible="False" ReadOnly="True" SortExpression="issueid" />
                <asp:BoundField DataField="issueDescription" HeaderText="issueDescription" SortExpression="issueDescription" />
                <asp:BoundField DataField="issueName" HeaderText="issueName" SortExpression="issueName" />
                <asp:BoundField DataField="issuePhoto" HeaderText="issuePhoto" SortExpression="issuePhoto" />
                <asp:BoundField DataField="tradespersonid" HeaderText="tradespersonid" SortExpression="tradespersonid" />
                <asp:BoundField DataField="issueDate" HeaderText="issueDate" SortExpression="issueDate" />
                <asp:BoundField DataField="customerid" HeaderText="customerid" SortExpression="customerid" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT * FROM [tbissues] WHERE ([propertyid] = @propertyid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtPropertyid" Name="propertyid" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
