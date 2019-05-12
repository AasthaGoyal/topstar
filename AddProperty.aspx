<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="AddProperty.aspx.cs" Inherits="Topstar.WebForm3" %>
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

    <form runat="server">
    <div class="container">
  
        
          <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;"> Add a new property for :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
              <asp:DropDownList ID="dpType" runat="server"  Width="198px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Font-Size="Large"  Height="39px">
                  <asp:ListItem Selected="True">Select one</asp:ListItem>
                  <asp:ListItem>Buy</asp:ListItem>
                  <asp:ListItem>Rent</asp:ListItem>
              </asp:DropDownList>
          
            <br />
           
           <br />
        <asp:Label ID="Label2" runat="server" Text="Property Images(.jpg, .png etc)"></asp:Label>
           <asp:FileUpload ID="uploadImages" class="form-control" runat="server" Multiple ="multiple" />
            <br />  
    
        <asp:TextBox runat="server" type="number" class="form-control" id="txtStreetNo" placeholder="Enter Street Number" required="Street number is required" />
        <br />
        <asp:TextBox runat="server" type="text" class =" form-control" id="txtStreetName" placeholder =" Enter Street Name" required =" Street name is required" />
        <br />
         <asp:TextBox runat="server" type="text" class =" form-control" id="txtSuburb" placeholder =" Enter Suburb" required="Suburb is required" />
        <br />
              <asp:TextBox runat="server" type="text" class =" form-control" id="txtDistrict" placeholder =" Enter District" required="District is required" />
            <br />
            <asp:TextBox runat="server" type="text" class =" form-control" id="txtCity" placeholder =" Enter city" required="City is required" />
            <br />

            <asp:TextBox runat="server" type="number" class =" form-control" id="txtNoOfBedrooms" placeholder =" No of Bedrooms" required=" " />
        
            <br />
               <asp:TextBox runat="server" type="number" class =" form-control" id="txtNoOfBathroonms" placeholder="No of Bathrooms" required=""/>
        
            <br />

               <asp:TextBox runat="server" type="number" class =" form-control" id="txtParking" placeholder =" No of Parking Spaces"  />
        
            <br />
               <asp:TextBox runat="server" type="number" class =" form-control" id="txtarea" placeholder =" Area(In Sq meters)"  />
        
       <br />
        <asp:Label ID="Label1" runat="server" Text="Availability"></asp:Label>
                       <asp:RadioButtonList ID="rbAvailability" runat="server" RepeatColumns="2" Width="215px" required="">
                           <asp:ListItem Selected="true">Available</asp:ListItem>
                           <asp:ListItem>Sold</asp:ListItem>
            </asp:RadioButtonList>
                
<br />
<asp:DropDownList ID="dpPropertyType" class = "form-control" runat="server" required="">
                <asp:ListItem Selected="True">House</asp:ListItem>
                <asp:ListItem>Flat</asp:ListItem>
                <asp:ListItem>Residential</asp:ListItem>
                <asp:ListItem></asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <br />

               <asp:TextBox runat="server" type="text" class =" form-control" id="txtDescription" placeholder =" Description" style="height: 317px"  required=""/>
       <br />
              <asp:Label ID="Label3" runat="server" Text="On promotion?"></asp:Label>
                       <asp:RadioButtonList ID="rbPromotion" runat="server"  RepeatColumns="2" Width="215px" required="" OnSelectedIndexChanged="rbPromotion_SelectedIndexChanged" AutoPostBack="True" Height="21px" OnTextChanged="rbPromotion_TextChanged">
                           <asp:ListItem >Yes</asp:ListItem>
                           <asp:ListItem Selected="true">No</asp:ListItem>
            </asp:RadioButtonList>
            <br />
        <asp:TextBox runat="server" type="number" Enabled="false" CssClass =" form-control" id="txtspecialPrice" placeholder =" Promotion Price"  />
        <br />
        <asp:Panel ID="RentPanel" runat="server"  Visible="False">
              <asp:TextBox runat="server" type="text" class =" form-control" id="txtWeeklyRent" placeholder =" Weekly Rent" required="" />
       
            <br />
             <label style="font-size: medium; font-weight: bold" > Furnished Status: </label>
              <asp:RadioButtonList ID="rbFurnishedStatus" runat="server" Height="23px" Width="315px" RepeatColumns="2">
                  <asp:ListItem Selected="True" Value="rdFurnished">Furnished</asp:ListItem>  
                  <asp:ListItem Value="rdUnfurnished">Unfurnished</asp:ListItem>
              </asp:RadioButtonList>
       <br />
            </asp:Panel>

        <asp:Panel ID="BuyPanel" runat="server"  Visible="False">
              <asp:TextBox runat="server" type="text" class =" form-control" id="txtPrice" placeholder =" Price(NZ $)"  required=""/>
       <br />
            </asp:Panel>


              <%--<asp:Button ID="btnUpload" class="btn-secondary" runat="server" Text="Upload Images" OnClick="btnUpload_Click" />--%>
       <br />
      

         
            <%--<asp:Button ID="btnUpload" class="btn-secondary" runat="server" Text="Upload Images" OnClick="btnUpload_Click" />--%>

        <br />
            <asp:Button ID="btnAddProperty" class="btn-success   form-control" runat="server" Text="Add Property" OnClick="btnAddProperty_Click" />
           <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
           <br />
            
       

        </div>
 

  </form>


</asp:Content>
