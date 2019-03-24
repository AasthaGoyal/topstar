<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="AddProperty.aspx.cs" Inherits="Topstar.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
     <environment names="Development">
        <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
        <link rel="stylesheet" href="~/css/site.css" />
    </environment>
    <environment names="Staging,Production">
        <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/bootstrap/3.3.6/css/bootstrap.min.css"
              asp-fallback-href="~/lib/bootstrap/dist/css/bootstrap.min.css"
              asp-fallback-test-class="sr-only" asp-fallback-test-property="position" asp-fallback-test-value="absolute" />
        <link rel="stylesheet" href="~/css/site.min.css" asp-append-version="true" />
    </environment>
  

    <div class="container">
  
        
          <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;"> Add a new property for :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
              <asp:DropDownList ID="dpType" runat="server"  Width="198px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Font-Size="Large"  Height="39px">
                  <asp:ListItem Selected="True">Select one</asp:ListItem>
                  <asp:ListItem>Buy</asp:ListItem>
                  <asp:ListItem>Rent</asp:ListItem>
              </asp:DropDownList>
          
            <br />
           
           <br />
        <asp:Panel ID="Panel1" runat="server" >

        <asp:TextBox runat="server" type="number" class="form-control" id="txtStreetNo" placeholder="Enter Street Number" />
        <br />
        <asp:TextBox runat="server" type="text" class =" form-control" id="txtStreetName" placeholder =" Enter Street Name" required =" Street name is required" />
        <br />
         <asp:TextBox runat="server" type="text" class =" form-control" id="txtSuburb" placeholder =" Enter Suburb" required="Suburb is required" />
        <br />
              <asp:TextBox runat="server" type="text" class =" form-control" id="txtDistrict" placeholder =" Enter District" required="District is required" />
            <br />
            <asp:TextBox runat="server" type="text" class =" form-control" id="txtCity" placeholder =" Enter city" required="City is required" />
            <br />

            <asp:TextBox runat="server" type="number" class =" form-control" id="txtNoOfBedrooms" placeholder =" No of Bedrooms"  />
        
            <br />
               <asp:TextBox runat="server" type="number" class =" form-control" id="txtNoOfBathroonms" placeholder="No of Bathrooms" />
        
            <br />

               <asp:TextBox runat="server" type="number" class =" form-control" id="txtParking" placeholder =" No of Parking Spaces"  />
        
            <br />
           <label class="form-control">Availability</label>
                       <asp:Calendar ID="availableDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                           <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                           <NextPrevStyle VerticalAlign="Bottom" />
                           <OtherMonthDayStyle ForeColor="#808080" />
                           <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                           <SelectorStyle BackColor="#CCCCCC" />
                           <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                           <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                           <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
                
            <br />
&nbsp;<asp:DropDownList ID="dpPropertyType" class = "form-control" runat="server">
                <asp:ListItem Selected="True">House</asp:ListItem>
                <asp:ListItem>Flat</asp:ListItem>
                <asp:ListItem>Residential</asp:ListItem>
                <asp:ListItem></asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <br />

               <asp:TextBox runat="server" type="text" class =" form-control" id="txtDescription" placeholder =" Description" style="height: 317px"  />
       
            </asp:Panel>
            <br />
        <asp:Panel ID="RentPanel" runat="server"  Visible="False">
              <asp:TextBox runat="server" type="text" class =" form-control" id="txtWeeklyRent" placeholder =" Weekly Rent"  />
       
            <br />
             <label style="font-size: medium; font-weight: bold" > Furnished Status: </label>
              <asp:RadioButtonList ID="rbFurnishedStatus" runat="server" Height="23px" Width="315px">
                  <asp:ListItem Selected="True" Value="rdFurnished">Furnished</asp:ListItem>  
                  <asp:ListItem Value="rdUnfurnished">Unfurnished</asp:ListItem>
              </asp:RadioButtonList>
       <br />
            </asp:Panel>

        <asp:Panel ID="BuyPanel" runat="server"  Visible="False">
              <asp:TextBox runat="server" type="text" class =" form-control" id="txtPrice" placeholder =" Price(NZ $)"  />
       <br />
            </asp:Panel>


              <%-- <asp:Button ID="btnAddImages" class="btn-primary   form-control" runat="server" Text="Add Images" OnClick="btnAddImages_Click" />--%>
       <br />
      

            <asp:FileUpload ID="uploadImages" class="form-control" runat="server" Multiple ="multiple" />
            <br />  
            <%--<asp:Button ID="btnUpload" class="btn-secondary" runat="server" Text="Upload Images" OnClick="btnUpload_Click" />--%>

        <br />
            <asp:Button ID="btnAddProperty" class="btn-success   form-control" runat="server" Text="Add Property" OnClick="btnAddProperty_Click" />
           <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
           <br />
            
       

        </div>
 

  


</asp:Content>
