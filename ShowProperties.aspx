<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ShowProperties.aspx.cs" Inherits="Topstar.WebForm2" %>
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

    
    <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;"> Search property for :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
              <asp:DropDownList ID="dpType" runat="server"  Width="198px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Font-Size="Large"  Height="39px">
                  <asp:ListItem>Buy</asp:ListItem>
                  <asp:ListItem Selected="True">Rent</asp:ListItem>
              </asp:DropDownList>
        <br />
        <br />
        <table>
            <tr>
                <td> <asp:DropDownList ID="dpCity" placeholder="City" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True" DataSourceID="cityData" DataTextField="city" DataValueField="city" OnSelectedIndexChanged="dpCity_SelectedIndexChanged">
            
        </asp:DropDownList>
                          </td>
                <td><asp:DropDownList ID="dpDistrict" placeholder="District" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True" DataSourceID="districtData" DataTextField="district" DataValueField="district">
         
        </asp:DropDownList> 
                    
                   
                    
                </td>
                <td>    <asp:TextBox runat="server"  class="form-control" id="txtSuburb" placeholder="Suburb" Height="40px" Width="206px" />
        </td>
            </tr>
            <tr>
              <td><asp:TextBox  runat="server" type="number" class="form-control" id="txtBedrooms" placeholder="No Of Bedrooms" Height="40px" Width="206px" />
     </td>
                <td> <asp:TextBox runat="server" type="number" class="form-control" id="txtBathrooms" placeholder="No Of Bathrooms" Height="40px" Width="206px" />
    </td>
                <td> <asp:TextBox runat="server" type="number" class="form-control" id="txtParking" placeholder="Parking spaces" Height="40px" Width="206px" />
                </td>
            </tr>
            
           <tr>
               <td> <asp:Label ID="lblPrice" runat="server" Text="Weekly rent"></asp:Label></td>
               <td>  <asp:DropDownList ID="dpPriceFrom"  placeholder="From" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True"   >
                   <asp:ListItem Value="50">$50</asp:ListItem>
                   <asp:ListItem Value="100">$100</asp:ListItem>
                   <asp:ListItem Value="150">$150</asp:ListItem>
                   <asp:ListItem Value="200">$200</asp:ListItem>
                   <asp:ListItem Value="250">$250</asp:ListItem>
                   <asp:ListItem Value="300">$300</asp:ListItem>
                   <asp:ListItem Value="350">$350</asp:ListItem>
                   <asp:ListItem Value="400">$400</asp:ListItem>
                   <asp:ListItem Value="450">$450</asp:ListItem>
                   <asp:ListItem Value="500">$500</asp:ListItem>
                   <asp:ListItem Value="600">$600</asp:ListItem>
                   <asp:ListItem Value="700">$700</asp:ListItem>
                   <asp:ListItem Value="800">$800</asp:ListItem>
                   <asp:ListItem Value="1000">$1000</asp:ListItem>
                  
        </asp:DropDownList>
                   <asp:DropDownList ID="dpPriceFrom0"  placeholder="From" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True" Visible="False"   >
                   <asp:ListItem Value="100">$100K</asp:ListItem>
                   <asp:ListItem Value="200">$200K</asp:ListItem>
                   <asp:ListItem Value="300">$300K</asp:ListItem>
                   <asp:ListItem Value="400">$400K</asp:ListItem>
                   <asp:ListItem Value="500">$500K</asp:ListItem>
                   <asp:ListItem Value="600">$600K</asp:ListItem>
                   <asp:ListItem Value="700">$700K</asp:ListItem>
                   <asp:ListItem Value="800">$800K</asp:ListItem>
                   <asp:ListItem Value="900">$900K</asp:ListItem>
                   <asp:ListItem Value="1000">$1000K</asp:ListItem>
                  
        </asp:DropDownList>
               </td>
               <td>  
                    <asp:DropDownList ID="dpPriceTo"  placeholder="To" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True"   >
                   <asp:ListItem Value="50">$50</asp:ListItem>
                   <asp:ListItem Value="100">$100</asp:ListItem>
                   <asp:ListItem Value="150">$150</asp:ListItem>
                   <asp:ListItem Value="200">$200</asp:ListItem>
                   <asp:ListItem Value="250">$250</asp:ListItem>
                   <asp:ListItem Value="300">$300</asp:ListItem>
                   <asp:ListItem Value="350">$350</asp:ListItem>
                   <asp:ListItem Value="400">$400</asp:ListItem>
                   <asp:ListItem Value="450">$450</asp:ListItem>
                   <asp:ListItem Value="500">$500</asp:ListItem>
                   <asp:ListItem Value="600">$600</asp:ListItem>
                   <asp:ListItem Value="700">$700</asp:ListItem>
                   <asp:ListItem Value="800">$800</asp:ListItem>
                   <asp:ListItem Value="1000">$1000</asp:ListItem>
                  
        </asp:DropDownList>
                   <asp:DropDownList ID="dpPriceTo0"  placeholder="To" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True" Visible="False"   >
                   <asp:ListItem Value="100">$100K</asp:ListItem>
                   <asp:ListItem Value="200">$200K</asp:ListItem>
                   <asp:ListItem Value="300">$300K</asp:ListItem>
                   <asp:ListItem Value="400">$400K</asp:ListItem>
                   <asp:ListItem Value="500">$500K</asp:ListItem>
                   <asp:ListItem Value="600">$600K</asp:ListItem>
                   <asp:ListItem Value="700">$700K</asp:ListItem>
                   <asp:ListItem Value="800">$800K</asp:ListItem>
                   <asp:ListItem Value="900">$900K</asp:ListItem>
                   <asp:ListItem Value="1000">$1000K</asp:ListItem>
                  
        </asp:DropDownList>
   </td>
           </tr> 
        </table>
             
      <asp:SqlDataSource ID="cityData" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [city] FROM [tbCity]"></asp:SqlDataSource>
   
          <br />
        <asp:SqlDataSource ID="districtData" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [district] FROM [tbDistrict] WHERE ([cityId] = @cityId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="1" Name="cityId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        

        
          
           
           
        
&nbsp;
        
        <br />
        <br />
    <asp:Button ID="btnSearch" class="form-control btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
     <br /> 
    
  
        <asp:DataList ID="DataList" runat="server" DataKeyField="propertyid"  RepeatColumns="3">
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
                <asp:Label ID="RweeklyLabel" runat="server" Text='<%# Eval("Rweekly") %>' Font-Bold="True" ForeColor="#006600" />
                <br />
                Availability:
                <asp:Label ID="availabilityLabel" runat="server" Text='<%# Eval("availability") %>' />
                <br />

             
                Furnished Status:
                <asp:Label ID="furnishedStatusLabel" runat="server" Text='<%# Eval("furnishedStatus") %>' />
                
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="dataRent" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p,tbrproperty r, tbimages i where p.propertyid = r.propertyid and r.propertyid = i.propertyid and i.defaultValue = 'Yes' "></asp:SqlDataSource>
     <asp:SqlDataSource ID="dataBuy" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p,tbbproperty b, tbimages i where p.propertyid = b.propertyid and b.propertyid = i.propertyid and i.defaultValue = 'Yes' "></asp:SqlDataSource>
           
    </div>
</asp:Content>

