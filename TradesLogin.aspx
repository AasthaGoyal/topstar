<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="TradesLogin.aspx.cs" Inherits="Topstar.WebForm21" %>
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
    <form runat="server">
    <div class="container" style="margin-top:150px">

    <h1> Your assigned issues are:</h1>
    <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>

    <asp:GridView  ID="GridView1" SelectionMethod="FullRowSelect" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" DataKeyNames="propertyid,issueid"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/images/arrow.png" >
            <ControlStyle Height="30px" Width="30px" />
            </asp:CommandField>
            <asp:BoundField DataField="issueid" HeaderText="Issue Id" InsertVisible =" False" ReadOnly="True" SortExpression="issueid" />
            <asp:BoundField DataField="propertyid" HeaderText="Property Id" InsertVisible="False" ReadOnly="True" SortExpression="propertyid" />
            <asp:BoundField DataField="streetNo" HeaderText="Street No" SortExpression="streetNo" />
            <asp:BoundField DataField="streetName" HeaderText="Street Name" SortExpression="streetName" />
            <asp:BoundField DataField="suburb" HeaderText="Suburb" SortExpression="suburb" />
            <asp:BoundField DataField="district" HeaderText="District" SortExpression="district" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
           <asp:TemplateField HeaderText="Issue Photo" SortExpression="issuePhoto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("issuePhoto") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" width="80px" Height="80px" ImageUrl='<%# Bind("issuePhoto") %>'/>
                    
                </ItemTemplate>
            </asp:TemplateField>
             <asp:BoundField DataField="issueName" HeaderText="Issue" SortExpression="issueName" />
            
            <asp:BoundField DataField="issueDescription" HeaderText="Description" SortExpression="issueDescription" />
            <asp:BoundField DataField="issueDate" HeaderText="Date" SortExpression="issueDate" />
          <asp:BoundField DataField="solved" HeaderText="Status" SortExpression="solved" />
            <asp:TemplateField HeaderText="Solved Photo" SortExpression="solvedPhoto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("solvedPhoto") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" width="80px" Height="80px" ImageUrl='<%# Bind("solvedPhoto") %>'/>
                    
                </ItemTemplate>
            </asp:TemplateField>
             <asp:BoundField DataField="customerid" HeaderText="Customer Id" SortExpression="customerid" />
            
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
    <br />
    Upload solved issue photo:
    <asp:FileUpload class="form-control" ID="fuSolved" runat="server" />
        <br />
    <asp:Button class="form-control btn-success" ID="btnUpload" runat="server"  OnClick="btnUpload_Click" Text="Upload"  />
    <br />
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from   tbproperty p, tbissues s where p.propertyid = s.propertyid and s.tradespersonid = @tradespersonid ">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="tradespersonid" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
  </div>
        </form>
</asp:Content>
