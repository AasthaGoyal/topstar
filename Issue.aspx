<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Issue.aspx.cs" Inherits="Topstar.WebForm4" %>
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

     <style type="text/css">
            .alertBox
            {
                position:absolute;
                top: 100px;
                left: 50%;
                width: 500px;
                margin-top: 100px;
                margin-left: -250px;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                padding: 4px 8px;
                background-color:lightgrey;
                z-index:1;
            }
        </style>
        <script type="text/javascript">
            function closeAlert(e)
            {
                e.preventDefault();
                this.parentNode.style.display = "none";
            }
        </script>

    <div runat="server" id="AlertBox" class="alertBox" Visible="false">
    <div runat="server" id="AlertBoxMessage"></div>
    <button id="btnLogin" onclick="btnLogin_OnClick" >Login</button>
</div>

    <div class="container" style="margin-top:150px">
        <form runat="server">

        
        <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;">
    Add an Issue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </label>
        <br />
                    <table style="margin-bottom: 0px">
                   <tr>
                       <td> 
                           <asp:Label ID="Label9"  runat="server" Text="Property Id"></asp:Label>
                           </td>
                       <td>
        <asp:TextBox ID="txtPropertyid" class="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtPropertyid_TextChanged"></asp:TextBox>
     
                       </td>
                   </tr>
            <tr>
                <td> <asp:DropDownList ID="dpCity" placeholder="City" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True" DataSourceID="cityData" DataTextField="city" DataValueField="city" OnSelectedIndexChanged="dpCity_SelectedIndexChanged">
            
        </asp:DropDownList>
                          </td>
                <td><asp:DropDownList ID="dpDistrict" placeholder="District" class="form-control" runat="server" Height="40px" Width="206px" DataSourceID="districtData" DataTextField="district" DataValueField="district">
         
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
            
       <%--    <tr>
               <td> Price</td>
               <td>  
                   <asp:DropDownList ID="dpPriceFrom"  placeholder="From" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True"    >
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
                   
                   <asp:DropDownList ID="dpPriceTo"  placeholder="To" class="form-control" runat="server" Height="40px" Width="206px" AutoPostBack="True"   >
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
           </tr> --%>
        </table>
             
      <asp:SqlDataSource ID="cityData" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [city] FROM [tbCity] ORDER BY [city]"></asp:SqlDataSource>
   
          <br />
        <asp:SqlDataSource ID="districtData" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [district] FROM [tbDistrict] WHERE ([cityId] = @cityId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtinput" DefaultValue="16" Name="cityId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
            <asp:Button ID="btnSearch" class="form-control btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
   
         <asp:TextBox ID="txtinput" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="propertyid"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/arrow.png" ShowSelectButton="True">
                    <ControlStyle Height="50px" Width="50px" />
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="Property Id" InsertVisible="False" SortExpression="propertyid">
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
                    <asp:TemplateField HeaderText="Street Name" SortExpression="streetName">
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
                    <asp:TemplateField HeaderText="City" SortExpression="city">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No Of bedrooms" SortExpression="noOfBedrooms">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("noOfBedrooms") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("noOfBedrooms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No of bathrooms" SortExpression="noOfBathrooms">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("noOfBathrooms") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("noOfBathrooms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Parking" SortExpression="parking">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("parking") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("parking") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Availability" SortExpression="availability">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("availability") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("availability") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type" SortExpression="type">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description" SortExpression="description">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="District" SortExpression="district">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("district") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("district") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Area" SortExpression="area">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("area") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("area") %>'></asp:Label>
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT * FROM [tbproperty]"></asp:SqlDataSource>

     
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
    <asp:TextBox ID="txtDate" runat="server" class="form-control"></asp:TextBox>
      
    <br />
            
        <asp:Button runat="server" id="btnAddIssue" class="form-control btn-primary" Text="Add Issue" OnClick="btnAddIssue_Click"></asp:Button>
  <%--  <asp:Label ID="Label4" runat="server" class="form-control" Text="Tradesperson Assigned"></asp:Label>
    
    <asp:TextBox ID="txtTradesperson" runat="server"></asp:TextBox>--%>
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000" ></asp:Label>
            </form>
    </div>
</asp:Content>
