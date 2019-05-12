<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="ModifyProperties.aspx.cs" Inherits="Topstar.WebForm16" %>
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

    <div class="container">
        <form runat="server">

   
    <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;"> Search property for :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
              <asp:DropDownList ID="DropDownList1" runat="server"  Width="198px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Font-Size="Large"  Height="39px">
                 <asp:ListItem Selected="True"> Select one</asp:ListItem>
                  <asp:ListItem>Buy</asp:ListItem>
                  <asp:ListItem >Rent</asp:ListItem>
              </asp:DropDownList>
        <br />
        <br />
        <table>
            <tr>
                <td> <asp:DropDownList ID="DropDownList2" placeholder="City" class="form-control" runat="server" Height="40px" Width="206px" DataSourceID="cityData" DataTextField="city" DataValueField="city" OnSelectedIndexChanged="dpCity_SelectedIndexChanged" AutoPostBack="True">
            
        </asp:DropDownList>
                          </td>
                <td><asp:DropDownList ID="DropDownList3" placeholder="District" class="form-control" runat="server" Height="40px" Width="206px" DataSourceID="districtData" DataTextField="district" DataValueField="district">
         
        </asp:DropDownList> 
                    
                   
                    
                </td>
                <td>    <asp:TextBox runat="server"  class="form-control" id="TextBox3" placeholder="Suburb" Height="40px" Width="206px"  />
        </td>
            </tr>
            <tr>
              <td><asp:TextBox  runat="server" type="number" class="form-control" id="TextBox4" placeholder="No Of Bedrooms" Height="40px" Width="206px"  />
     </td>
                <td> <asp:TextBox runat="server" type="number" class="form-control" id="TextBox5" placeholder="No Of Bathrooms" Height="40px" Width="206px"  />
    </td>
                <td> <asp:TextBox runat="server" type="number" class="form-control" id="TextBox6" placeholder="Parking spaces" Height="40px" Width="206px"  />
                </td>
            </tr>
            
           <tr>
               <td> <asp:Label ID="lblPrice" runat="server" ></asp:Label></td>
               <td>  <asp:DropDownList ID="dpPriceFrom" visible="false" placeholder="From" class="form-control" runat="server" Height="40px" Width="206px"    >
                   <asp:ListItem Value="Any">Any</asp:ListItem>
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
                    <asp:DropDownList ID="dpPriceFrom0"  placeholder="From" visible="false" CssClass="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True"    >
                       <asp:ListItem>Any</asp:ListItem>
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
                    <asp:DropDownList ID="dpPriceTo"  placeholder="To" visible="false" class="form-control" runat="server" Height="40px" Width="206px"   >
                   <asp:ListItem Value="Any">Any</asp:ListItem>
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
                   
                   <asp:DropDownList ID="dpPriceTo0"  placeholder="To" visible="false" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True"   >
                       <asp:ListItem>Any</asp:ListItem>
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
        

                 
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [city] FROM [tbCity] ORDER BY [city]"></asp:SqlDataSource>
   
          <br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [district] FROM [tbDistrict] WHERE ([cityId] = @cityId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="16" Name="cityId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
          
           
           
        
    <br />
    <asp:Button ID="btnSearch" class="form-control btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
    <br />
    <asp:GridView ID="GridView1" class="form-control" runat="server" SelectionMethod="FullRowSelect" OnSelectedIndexChanged =" GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="propertyid,Rpropertyid"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/images/arrow.png" >
            <ControlStyle Height="30px" Width="30px" />
            </asp:CommandField>
            <asp:BoundField DataField="propertyid" HeaderText="Property Id" InsertVisible="False" ReadOnly="True" SortExpression="propertyid" />
            <asp:BoundField DataField="streetNo" HeaderText="Street No" SortExpression="streetNo" />
            <asp:BoundField DataField="streetName" HeaderText="Street name" SortExpression="streetName" />
            <asp:BoundField DataField="suburb" HeaderText="Suburb" SortExpression="suburb" />
            <asp:BoundField DataField="district" HeaderText="District" SortExpression="district" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="noOfBedrooms" HeaderText="No of Bedrooms" SortExpression="noOfBedrooms" />
            <asp:BoundField DataField="noOfBathrooms" HeaderText="No of Bathrooms" SortExpression="noOfBathrooms" />
            <asp:BoundField DataField="parking" HeaderText="Parking" SortExpression="parking" />
            <asp:BoundField DataField="availability" HeaderText="Availability" SortExpression="availability" />
            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
              <asp:BoundField DataField="Rweekly" HeaderText="Weekly Rent" SortExpression="Rweekly" />
            <asp:BoundField DataField="furnishedStatus" HeaderText="Furnsihed Status" SortExpression="furnishedStatus" />
            <asp:BoundField DataField="special" HeaderText="On Promotion" SortExpression="special" />
            <asp:BoundField DataField="specialPrice" HeaderText="Promotion price" SortExpression="specialPrice" />
            <asp:BoundField DataField="area" HeaderText="Area" SortExpression="area" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p, tbrproperty r where p.propertyid=r.propertyid"></asp:SqlDataSource>
  
    <br />
    <asp:GridView ID="GridView2" class="form-control" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="propertyid,bpropertyid" >
        <Columns>
             <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/images/arrow.png" >
             <ControlStyle Height="30px" Width="30px" />
             </asp:CommandField>
            <asp:BoundField DataField="propertyid" HeaderText="Property Id" InsertVisible="False" ReadOnly="True" SortExpression="propertyid" />
            <asp:BoundField DataField="streetNo" HeaderText="Street no" SortExpression="streetNo" />
            <asp:BoundField DataField="streetName" HeaderText="Street Name" SortExpression="streetName" />
            <asp:BoundField DataField="suburb" HeaderText="Suburb" SortExpression="suburb" />
             <asp:BoundField DataField="district" HeaderText="District" SortExpression="district" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="noOfBedrooms" HeaderText="No of Bedrooms" SortExpression="noOfBedrooms" />
            <asp:BoundField DataField="noOfBathrooms" HeaderText="No of Bathrooms" SortExpression="noOfBathrooms" />
            <asp:BoundField DataField="parking" HeaderText="Parking" SortExpression="parking" />
            <asp:BoundField DataField="availability" HeaderText="Availability" SortExpression="availability" />
            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
           
           <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
             <asp:BoundField DataField="special" HeaderText="On Promotion" SortExpression="special" />
             <asp:BoundField DataField="specialPrice" HeaderText="Promotion price" SortExpression="specialPrice" />
             <asp:BoundField DataField="area" HeaderText="Area" SortExpression="area" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p, tbbproperty b where p.propertyid = b.propertyid"></asp:SqlDataSource>
    <br />
    <br />
    <table style="width: 100%">
        <tr>
            <td style="width: 188px">Property Id:</td>
            <td style="width: 231px">
                <asp:TextBox ID="txtpropertyid" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px" Enabled="False"></asp:TextBox>
            </td>
            <td style="width: 151px">No of Bedrooms</td>
            <td>
                <asp:TextBox ID="txtBedrooms" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 188px">Street Number</td>
            <td  style="width: 231px">
                <asp:TextBox ID="txtStreetNo" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
            <td style="width: 151px">No of Bathrooms</td>
            <td>
                <asp:TextBox ID="txtBathrooms" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 188px">Street Name</td>
            <td style="width: 231px">
                <asp:TextBox ID="txtStreetName" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
            <td style="width: 151px">Parking spaces</td>
            <td>
                <asp:TextBox ID="txtParking" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 188px">City</td>
            <td style="width: 231px"> <asp:DropDownList ID="dpCity" placeholder="City" class="form-control" runat="server" Height="40px" Width="206px" DataSourceID="cityData" DataTextField="city" DataValueField="city" OnSelectedIndexChanged="dpCity_SelectedIndexChanged" AutoPostBack="True">
            
        </asp:DropDownList>
                          </td>
            
            <td style="width: 151px">Availability</td>
            <td>
                <asp:RadioButtonList ID="rdAvailability" runat="server" RepeatColumns="3">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 188px">District</td>
            <td style="width: 231px"><asp:DropDownList ID="dpDistrict" placeholder="District" class="form-control" runat="server" Height="40px" Width="206px" DataSourceID="districtData" DataTextField="district" DataValueField="district" >
         
        </asp:DropDownList> 
                    
                   
                    
                </td>
            <td style="width: 151px">Property type</td>
            <td>
                <asp:DropDownList ID="dpType" runat="server" Height="22px" Width="196px">
                    <asp:ListItem>House</asp:ListItem>
                    <asp:ListItem>Flat</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>

                Suburb:</td>
            <td> 
                <asp:TextBox ID="txtSuburb" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
            <td style="width: 188px">Description</td>
            <td >
                <asp:TextBox ID="txtDescription" runat="server" Height="53px" Width="337px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>

                On Promotion?</td>
            <td> 
                <asp:RadioButtonList ID="rdPromotion" runat="server" RepeatColumns="3">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 188px">Promotion Price:</td>
            <td >
                <asp:TextBox ID="txtspecialPrice" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>

                Area (In sq meters)</td>
            <td> 
                <asp:TextBox ID="txtarea" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
            <td style="width: 188px">&nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        </table>

    <asp:Panel ID="pnRent" visible="false" runat="server">
         <asp:Label ID="Label2" runat="server" Text="Rent Property Details" Font-Bold="True"></asp:Label>
        <table>
             <tr>
            <td>

                Weekly rent</td>
            <td > 
                <asp:TextBox ID="txtPrice" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
            <td style="width: 188px">Furnished Status</td>
            <td >
                <asp:RadioButtonList ID="rbFurnished" runat="server" RepeatColumns="2">
                    <asp:ListItem>Furnished</asp:ListItem>
                    <asp:ListItem>Unfurnished</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnBuy" visible="false" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Buy Property Details" Font-Bold="True"></asp:Label>
        <table>
            <tr>
            <td>

                Buying Price(NZ$)</td>
            <td> 
                <asp:TextBox ID="txtBuyPrice" runat="server" OnTextChanged="TextBox2_TextChanged" Width="197px"></asp:TextBox>
            </td>
                </tr>
        </table>
    </asp:Panel>
    
    <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
    
    <br />
    <asp:Button ID="btnUpdate" Class=" btn-primary" runat="server"  OnClick="btnUpdate_Click" Text="Update" Width="118px" />
     <asp:Button ID="btnSold" class="btn-danger" runat="server" BackColor="#CC0000" OnClick="btnSold_Click" Text="Mark as Sold" />
     <asp:SqlDataSource ID="cityData" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [city] FROM [tbCity] ORDER BY [city]"></asp:SqlDataSource>
   
          <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
   
          <br />
        <asp:SqlDataSource ID="districtData" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [district] FROM [tbDistrict] WHERE ([cityId] = @cityId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="16" Name="cityId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            </form>
         </div>
</asp:Content>
