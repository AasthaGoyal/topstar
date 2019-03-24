<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AddIssue.aspx.cs" Inherits="Topstar.WebForm4" %>
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
    Add an Issue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </label>

        <asp:TextBox ID="txtPropertyid" runat="server" AutoPostBack="True" OnTextChanged="txtPropertyid_TextChanged"></asp:TextBox>
        <br />
          <asp:DataList ID="DataList"  runat="server" DataKeyField="propertyid"  RepeatColumns="3" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                 <br />
                <a href='PropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'><asp:Image ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imagePath") %>' Height="253px" Width="317px"/></a>
                <br />
                <asp:Label ID="streetNoLabel" runat="server" Text='<%# Eval("streetNo") %>' Font-Bold="True" Font-Size="Large" ForeColor="#000066" />

                <asp:Label ID="streetNameLabel" runat="server" Text='<%# Eval("streetName") %>' Font-Bold="True" Font-Size="Large" ForeColor="#000066" />
                <br />
                 
   
                 ,<asp:Label ID="suburbLabel" runat="server" Text='<%# Eval("suburb") %>' Font-Bold="True" Font-Size="Large" ForeColor="#000066" />
                 ,<asp:Label ID="districtLabel" runat="server" Text='<%# Eval("district") %>' Font-Bold="True" Font-Size="Large" ForeColor="#000066" />
                 ,<asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' Font-Bold="True" Font-Size="Large" ForeColor="#000066" />
                <br />
                <img src="images/bed.png" style="width: 39px; height: 43px" />
                <asp:Label ID="noOfBedroomsLabel" runat="server" Text='<%# Eval("noOfBedrooms") %>' Font-Bold="True" ForeColor="#CC0000" />
           
                <img src="images/bath.png" style="width: 39px; height: 43px" />
                <asp:Label ID="noOfBathroomsLabel" runat="server" Text='<%# Eval("noOfBathrooms") %>' Font-Bold="True" ForeColor="#CC0000" />
                <br />
                
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#006600" Text="Weekly Rent: $"></asp:Label>
               <%-- <asp:Label ID="RweeklyLabel" runat="server" Text='<%# Eval("Rweekly") %>' Font-Bold="True" ForeColor="#006600" />
                <br />
                Availability:
                <asp:Label ID="availabilityLabel" runat="server" Text='<%# Eval("availability") %>' />
                <br />

             
                Furnished Status:
                <asp:Label ID="furnishedStatusLabel" runat="server" Text='<%# Eval("furnishedStatus") %>' />--%>
              
<br />
            </ItemTemplate>
        </asp:DataList>

     
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT * FROM tbproperty p , tbimages m WHERE p.[propertyid] = @propertyid and p.propertyid = m.propertyid and m.DefaultValue='Yes'">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtPropertyid" Name="propertyid" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

     <br />
        <asp:Label ID="Label2" runat="server"  Text="Upload Image of the issue"></asp:Label>
        <br />
        <asp:FileUpload ID="fpIssueImage" class="form-control" runat="server" />
        <br />
        <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Enter Issue name (Eg- Broken window)"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtDescription" runat="server" class="form-control" placeholder="Enter Issue Description" Height="125px"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Date"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
      
    <br />
        <asp:Button runat="server" id="btnAddIssue" class="form-control btn-primary" Text="Add Issue" OnClick="btnAddIssue_Click"></asp:Button>
  <%--  <asp:Label ID="Label4" runat="server" class="form-control" Text="Tradesperson Assigned"></asp:Label>
    
    <asp:TextBox ID="txtTradesperson" runat="server"></asp:TextBox>--%>
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000" ></asp:Label>
    </div>
</asp:Content>
