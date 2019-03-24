<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="EditProperties.aspx.cs" Inherits="Topstar.WebForm5" %>
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
                <td> <asp:DropDownList ID="dpCity" placeholder="City" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="city" DataValueField="city" OnSelectedIndexChanged="dpCity_SelectedIndexChanged">
            
        </asp:DropDownList>
                          </td>
                <td><asp:DropDownList ID="dpDistrict" placeholder="District" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="district" DataValueField="district">
         
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

        

        
          
           
           
        
&nbsp;
        
        <br />
        <br />
    <asp:Button ID="btnSearch" class="form-control btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
     <br /> 
    

        <asp:GridView ID="gdRent" runat="server"  AutoGenerateColumns="False" DataKeyNames="propertyid,Rpropertyid" DataSourceID="dbRent" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-top: 0px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
               
                <asp:TemplateField HeaderText="Property ID" InsertVisible="False" SortExpression="propertyid">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("propertyid") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("propertyid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Street No" SortExpression="streetNo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("streetNo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("streetNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Street" SortExpression="streetName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("streetName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("streetName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Suburb" SortExpression="suburb">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("suburb") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("suburb") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="District" SortExpression="district">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("district") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("district") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="city">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bedrooms" SortExpression="noOfBedrooms">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("noOfBedrooms") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("noOfBedrooms") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bathrooms" SortExpression="noOfBathrooms">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("noOfBathrooms") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("noOfBathrooms") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Parking" SortExpression="parking">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("parking") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("parking") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Availability" SortExpression="availability">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("availability") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("availability") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Type" SortExpression="type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Weekly Rent" SortExpression="Rweekly">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Rweekly") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("Rweekly") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Furnished Status" SortExpression="furnishedStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("furnishedStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("furnishedStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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

       

         
        <asp:SqlDataSource ID="dbRent" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p,tbrproperty r where p.propertyid = r.propertyid or p.city = @city or p.suburb = @suburb or p.district = @district or p.noOfBedrooms = @bedrooms or p.noOfBathrooms = @bathrooms or p.parking = @parking or r.RWeekly &gt;= @priceFrom or r.RWeekly &lt;= @priceTo">
            <SelectParameters>
                <asp:ControlParameter ControlID="dpCity" DefaultValue="Auckland" Name="city" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtSuburb" DefaultValue="" Name="suburb" PropertyName="Text" />
                <asp:ControlParameter ControlID="dpDistrict" DefaultValue="Auckland City" Name="district" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtBedrooms" Name="bedrooms" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtBathrooms" Name="bathrooms" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtParking" Name="parking" PropertyName="Text" />
                <asp:ControlParameter ControlID="dpPriceFrom" Name="priceFrom" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="dpPriceTo" Name="priceTo" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

         <asp:GridView ID="gdBuy" runat="server"  AutoGenerateColumns="False" DataKeyNames="propertyid,bpropertyid" DataSourceID="dbBuy" Visible="False">
            <Columns>
                <asp:BoundField DataField="propertyid" HeaderText="propertyid" InsertVisible="False" ReadOnly="True" SortExpression="propertyid" />
                <asp:BoundField DataField="streetNo" HeaderText="streetNo" SortExpression="streetNo" />
                <asp:BoundField DataField="streetName" HeaderText="streetName" SortExpression="streetName" />
                <asp:BoundField DataField="suburb" HeaderText="suburb" SortExpression="suburb" />
                 <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="noOfBedrooms" HeaderText="noOfBedrooms" SortExpression="noOfBedrooms" />
                   
                <asp:BoundField DataField="noOfBathrooms" HeaderText="noOfBathrooms" SortExpression="noOfBathrooms" />
                <asp:BoundField DataField="parking" HeaderText="parking" SortExpression="parking" />
                <asp:BoundField DataField="availability" HeaderText="availability" SortExpression="availability" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="district" HeaderText="district" SortExpression="district" />
            
            
                <asp:BoundField DataField="propertyid1" HeaderText="propertyid1" SortExpression="propertyid1" />
                      <asp:BoundField DataField="bpropertyid" HeaderText="bpropertyid" InsertVisible="False" ReadOnly="True" SortExpression="bpropertyid" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                      </Columns>
        </asp:GridView>
       

          <asp:SqlDataSource ID="dbBuy" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p,tbbproperty b where p.propertyid = b.propertyid or p.city = @city or p.suburb = @suburb or p.district = @district or p.noOfBedrooms = @bedrooms or p.noOfBathrooms = @bathrooms or p.parking = @parking or b.price &gt;= @priceFrom or b.price &lt;= @priceTo">
            <SelectParameters>
                <asp:ControlParameter ControlID="dpCity" DefaultValue="Auckland" Name="city" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="dpDistrict" DefaultValue="Auckland City" Name="suburb" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtSuburb" DefaultValue="" Name="district" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtBedrooms" Name="bedrooms" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtBathrooms" Name="bathrooms" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtParking" Name="parking" PropertyName="Text" />
                <asp:ControlParameter ControlID="dpPriceFrom" Name="priceFrom" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="dpPriceTo" Name="priceTo" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
       

         
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [city] FROM [tbCity]"></asp:SqlDataSource>
   
          <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [district] FROM [tbDistrict] WHERE ([cityId] = @cityId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="1" Name="cityId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
   
          </div>
</asp:Content>
