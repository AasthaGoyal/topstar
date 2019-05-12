<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="SearchIssues.aspx.cs" Inherits="Topstar.WebForm9" %>
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
        <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;">
    Search Issues&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </label>
        <br />
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
        </asp:SqlDataSource>txt
        <br />
         <asp:Button ID="btnSearch" class="form-control btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
      
         <asp:TextBox ID="txtinput" runat="server" Visible="False"></asp:TextBox>
<br />
        
        <asp:GridView class="form-control" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="issueid"   OnRowEditing="GridView1_RowEditing" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                
                <asp:TemplateField HeaderText="Issue Id" SortExpression="issueid">
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl" runat="server" Text='<%# Bind("issueid") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("issueid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Property Id" SortExpression="propertyid">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("propertyid") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label0" runat="server" Text='<%# Bind("propertyid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Street No" SortExpression="streetNo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("streetNo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label0" runat="server" Text='<%# Bind("streetNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Street Name" SortExpression="streetName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("streetName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label0" runat="server" Text='<%# Bind("streetName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Suburb" SortExpression="suburb">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("suburb") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label0" runat="server" Text='<%# Bind("suburb") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="District" SortExpression="district">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("district") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label0" runat="server" Text='<%# Bind("district") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="City" SortExpression="city">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label0" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Photo" SortExpression="issuePhoto">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("issuePhoto") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                       
                        <asp:image ID="Label1" height="120px" width="120px" runat="server" ImageUrl='<%# Bind("issuePhoto") %>'></asp:image>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Issue" SortExpression="issueName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("issueName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("issueName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="issueDescription">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("issueDescription") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("issueDescription") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Issue date" SortExpression="issueDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("issueDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("issueDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
              
                <asp:TemplateField Visible="false" HeaderText="Tradesperson Id" SortExpression="tradespersonid">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("tradespersonid") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("tradespersonid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Customer Id" SortExpression="customerid">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("customerid") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("customerid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbSelect" runat="server" CausesValidation="False" CommandName="Select" Tooltip="Select"   />
                    </ItemTemplate>
                </asp:TemplateField>
               
                    

                

            </Columns>
            <SelectedRowStyle BackColor="Gray" />
        </asp:GridView>
        <br />
      
    
        <asp:DropDownList ID="dpTradesperson" visible="false" runat="server"  DataTextField="firstName" DataValueField="firstName" CssClass="form-control">
        </asp:DropDownList>
 <br />
          <asp:Button ID="btnSelect"  visible="false" class=" form-control btn-success" runat="server" Text="Assign Tradesperson" OnClick="btnSelect_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select p.firstName, t.tradespersonid, t.tradespersontype from tbperson p, tbtradesperson t where p.personid = t.personid"></asp:SqlDataSource>
       
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT * FROM [tbissues] WHERE ([propertyid] = @propertyid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtPropertyid" Name="propertyid" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        
    </div>
        </form>
</asp:Content>
