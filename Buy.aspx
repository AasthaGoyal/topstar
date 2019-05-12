<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Buy.aspx.cs" Inherits="Topstar.WebForm15" %>
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

	
		<br />
		<table style="margin-bottom: 0px">
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
			
		   <tr>
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
		   </tr> 
		</table>
			 
	  <asp:SqlDataSource ID="cityData" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [city] FROM [tbCity] ORDER BY [city]"></asp:SqlDataSource>
   
		  <br />
		<asp:SqlDataSource ID="districtData" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT [district] FROM [tbDistrict] WHERE ([cityId] = @cityId)">
			<SelectParameters>
				<asp:ControlParameter ControlID="TextBox1" DefaultValue="16" Name="cityId" PropertyName="Text" Type="Int32" />
			</SelectParameters>
		</asp:SqlDataSource>
		

		
		  
		   
		   
		
&nbsp;
		
		<br />
		<br />
	<asp:Button ID="btnSearch" class="form-control btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
		<asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
	   
	 <br /> 
		<div class="listings_container" >
	<asp:DataList ID="DataList" runat="server" DataKeyField="propertyid"   RepeatColumns="3">
			<ItemTemplate>
			
						
						<!-- Listing -->
						<div class="listing_box house sale" style="width:500px" >
							<div class="listing">
								<div class="listing_image">
									<div class="listing_image_container">
										<a href='PropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'></a><asp:Image ID="Image1" ImageUrl='<%# Eval("imagePath") %>' style="width:690px; height:400px" runat="server" /></a>
									</div>
					
									<div class="tags d-flex flex-row align-items-start justify-content-start flex-wrap">
										<div class="tag tag_house">
											<a href='BuyPropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'><asp:Label ID="lbltype" Text='<%#Eval("type") %>' runat="server" ></asp:Label></a>
												</div>
										<div class="tag tag_sale">
											<a href='BuyPropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'><asp:Label ID="lblstatus" runat="server" Text='<%#Eval("availability") %>'></asp:Label></a>
												</div>
									</div>
									<div class="tag_price listing_price">
										<asp:Label ID="lblprice" runat="server" Text='<%# Eval("price") %>'></asp:Label></div>
								</div>
								<div class="listing_content">
									<div class="prop_location listing_location d-flex flex-row align-items-start justify-content-start">
										<img src="images/icon_1.png" alt="">
									
											<asp:Label ID="lbladdress" runat="server" Text='<%# Eval("streetNo") %>'></asp:Label>
											<asp:Label ID="streetNameLabel" runat="server" Text='<%# Eval("streetName") %>' />
											,<asp:Label ID="suburbLabel" runat="server" Text='<%# Eval("suburb") %>'  />
										<br />
									
			
				 ,<asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>'  />
				
									</div>
									<div class="listing_info">
										<ul class="d-flex flex-row align-items-center justify-content-start flex-wrap">
											<li class="property_area d-flex flex-row align-items-center justify-content-start">
												<img src="images/icon_2.png" alt="">
												<span>
													<asp:Label ID="lblarea" Text='<%# Eval("area") %>' runat="server"></asp:Label></span>
											</li>
											<li class="d-flex flex-row align-items-center justify-content-start">
												<img src="images/icon_3.png" alt="">
												<span>
													<asp:Label ID="lblbath" Text='<%# Eval("noOfBathrooms") %>' runat="server"></asp:Label></span>
											</li>
											<li class="d-flex flex-row align-items-center justify-content-start">
												<img src="images/icon_4.png" alt="">
												<span>
													<asp:Label ID="lblpark" Text='<%# Eval("parking") %>'  runat="server"></asp:Label></span>
											</li>
											<li class="d-flex flex-row align-items-center justify-content-start">
												<img src="images/icon_5.png" alt="">
												<span>
													<asp:Label ID="lblbed"  Text='<%# Eval("noOfBedrooms") %>' runat="server" ></asp:Label></span>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
				</div>
				</ItemTemplate>
		</asp:DataList>
					</div>
				<br />
		
	<%--    <asp:DataList ID="DataList" runat="server" DataKeyField="propertyid"   RepeatColumns="4">
			<ItemTemplate>
				 <br />
				<a href='BuyPropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'>
					<asp:Image ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imagePath") %>' Height="253px" Width="317px"/></a>
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
				
				<asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#006600" Text="Price: $"></asp:Label>
				<asp:Label ID="RweeklyLabel" runat="server" Text='<%# Eval("price") %>' Font-Bold="True" ForeColor="#006600" />
				<br />
				
			 
			   
<br />
			</ItemTemplate>
		</asp:DataList>--%>
	
	</div>
	  <asp:SqlDataSource ID="dataBuy" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p,tbbproperty b, tbimages i where p.propertyid = b.propertyid and b.propertyid = i.propertyid and i.defaultValue = 'Yes' "></asp:SqlDataSource>
		   
  </form>
</asp:Content>
