<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Rent.aspx.cs" Inherits="Topstar.WebForm2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="myHOME - real estate template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.3.4/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.3.4/animate.css">
<link rel="stylesheet" type="text/css" href="styles/listings.css">
<link rel="stylesheet" type="text/css" href="styles/listings_responsive.css">

<%--	<div class="super_container">--%>
	
	<div style="margin-top:150px" >
	
		<%--<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/listings.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_content text-center">
						<div class="home_title">Listings</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		</div>--%>
		<br />

		<form runat="server">
	
			
	
		<table class="form-control">
			<tr>
				<td> <asp:DropDownList class="form-control" ID="dpCity" placeholder="City"  runat="server" Height="40px" Width="206px" DataSourceID="cityData" DataTextField="city" DataValueField="city" OnSelectedIndexChanged="dpCity_SelectedIndexChanged" AutoPostBack="True">
			
		</asp:DropDownList>
						  </td>
				<td><asp:DropDownList ID="dpDistrict" class="form-control" placeholder="District"  runat="server" Height="40px" Width="206px" DataSourceID="districtData" DataTextField="district" DataValueField="district" OnSelectedIndexChanged="dpDistrict_SelectedIndexChanged">
		 
		</asp:DropDownList> 
					
				   
					
				</td>
				<td>    <asp:TextBox runat="server"  class="form-control" id="txtSuburb" placeholder="Suburb" Height="40px" Width="206px"  />
		</td>
			</tr>
			<tr>
			  <td><asp:TextBox  runat="server" type="number" class="form-control" id="txtBedrooms" placeholder="No Of Bedrooms" Height="40px" Width="206px" OnTextChanged="txtBedrooms_TextChanged" />
	 </td>
				<td> <asp:TextBox runat="server" type="number" class="form-control" id="txtBathrooms" placeholder="No Of Bathrooms" Height="40px" Width="206px" OnTextChanged="txtBathrooms_TextChanged" />
	</td>
				<td> <asp:TextBox runat="server" type="number" class="form-control" id="txtParking" placeholder="Parking spaces" Height="40px" Width="206px" OnTextChanged="txtParking_TextChanged" />
				</td>
			</tr>
			
		   <tr>
			   <td> <asp:Label ID="lblPrice" runat="server" Text="Weekly rent"></asp:Label></td>
			   <td>  <asp:DropDownList ID="dpPriceFrom"  placeholder="From" class="form-control" runat="server" Height="40px" Width="206px" OnSelectedIndexChanged="dpPriceFrom_SelectedIndexChanged"   >
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
				  
			   </td>
			   <td>  
					<asp:DropDownList ID="dpPriceTo"  placeholder="To" class="form-control" runat="server" Height="40px" Width="206px"   >
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
				  
   </td>
		   </tr> 
		</table>
			
									<%--<button class="search_button">submit listing</button>--%>
								
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
											<a href='PropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'><asp:Label ID="lbltype" Text='<%#Eval("type") %>' runat="server" ></asp:Label></a>
												</div>
										<div class="tag tag_sale">
											<a href='PropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'><asp:Label ID="lblstatus" runat="server" Text='<%#Eval("availability") %>'></asp:Label></a>
												</div>
									</div>
									<div class="tag_price listing_price">
										<asp:Label ID="lblprice" runat="server" Text='<%# Eval("Rweekly") %>'></asp:Label></div>
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
  
		<%--<asp:DataList ID="DataList" runat="server" DataKeyField="propertyid"   RepeatColumns="4">
			<ItemTemplate>
				 <br />
				<a href='PropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'>
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
				
				<asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#006600" Text="Weekly Rent: $"></asp:Label>
				<asp:Label ID="RweeklyLabel" runat="server" Text='<%# Eval("Rweekly") %>' Font-Bold="True" ForeColor="#006600" />
				<br />
				
			 
				Furnished Status:
				<asp:Label ID="furnishedStatusLabel" runat="server" Text='<%# Eval("furnishedStatus") %>' />
				
<br />
			</ItemTemplate>
		</asp:DataList>--%>
		<asp:SqlDataSource ID="dataRent" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p,tbrproperty r, tbimages i where p.propertyid = r.propertyid and r.propertyid = i.propertyid and i.defaultValue = 'Yes' "></asp:SqlDataSource>
			</form>
			</div>
		
		</div>
</asp:Content>

