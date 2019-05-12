<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Topstar.WebForm1" %>
<%@ MasterType VirtualPath="~/HomeMaster.Master" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 
	<form id="form1" runat="server">
 
	<!-- Home -->

	<div class="home">
		
		<!-- Home Slider -->
		<div class="home_slider_container">
			 <div class="owl-carousel owl-theme home_slider">
				
				<!-- Slide -->
				<div class="slide">
					<div class="background_image" style="background-image:url(images/index.jpg)"></div>
					<div class="home_container">
						<div class="container">
							<div class="row">
								<div class="col">
									<div class="home_content">
										<div class="home_title"><h1>1243 Main Avenue Left Town</h1></div>
										<div class="home_price_tag">$ 482 900</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Slide -->
				<div class="slide">
					<div class="background_image" style="background-image:url(images/index.jpg)"></div>
					<div class="home_container">
						<div class="container">
							<div class="row">
								<div class="col">
									<div class="home_content">
										<div class="home_title"><h1>1243 Main Avenue Left Town</h1></div>
										<div class="home_price_tag">$ 482 900</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Slide -->
				<div class="slide">
					<div class="background_image" style="background-image:url(images/index.jpg)"></div>
					<div class="home_container">
						<div class="container">
							<div class="row">
								<div class="col">
									<div class="home_content">
										<div class="home_title"><h1>1243 Main Avenue Left Town</h1></div>
										<div class="home_price_tag">$ 482 900</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			 </div>

			 <!-- Home Slider Navigation -->
			 <div class="home_slider_nav"><i class="fa fa-angle-right" aria-hidden="true"></i></div>
			 
		</div>
	</div>
<!-- Featured -->

	<div class="featured">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<div class="section_subtitle">the best deals</div>
						<div class="section_title"><h1>Featured Properties</h1></div>
					</div>
				</div>
			</div>
			<div class="row featured_row">
				
				<!-- Featured Item -->
				<div class="listings_container" >
	<asp:DataList ID="DataList" runat="server" DataKeyField="propertyid"   RepeatColumns="3" DataSourceID="SqlDataSource1">
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
											<a href='PropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'>For Rent<%--<asp:Label ID="lblstatus" runat="server" Text='<%#Eval("availability") %>'></asp:Label>--%></a></div>
									</div>
									<div class="tag_price listing_price">
										<asp:Label ID="lblprice" runat="server" Text='<%# Eval("specialPrice") %>'></asp:Label></div>
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
					<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p, tbrproperty r , tbimages m where p.propertyid = r.propertyid and p.special='Yes' and p.propertyid = m.propertyid and m.defaultValue='Yes'"></asp:SqlDataSource>
					</div>


				<%--<div class="col-lg-4">
					<div class="listing">
						<div class="listing_image">
							<div class="listing_image_container">
								<img src="images/listing_1.jpg" alt="">
							</div>
							<div class="tags d-flex flex-row align-items-start justify-content-start flex-wrap">
								<div class="tag tag_house"><a href="listings.html">house</a></div>
								<div class="tag tag_sale"><a href="listings.html">for sale</a></div>
							</div>
							<div class="tag_price listing_price">$ 217 346</div>
						</div>
						<div class="listing_content">
							<div class="prop_location listing_location d-flex flex-row align-items-start justify-content-start">
								<img src="images/icon_1.png" alt="">
								<a href="single.html">280 Doe Meadow Drive Landover, MD 20785</a>
							</div>
							<div class="listing_info">
								<ul class="d-flex flex-row align-items-center justify-content-start flex-wrap">
									<li class="property_area d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_2.png" alt="">
										<span>2500 sq ft</span>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_3.png" alt="">
										<span>2</span>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_4.png" alt="">
										<span>5</span>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_5.png" alt="">
										<span>2</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Featured Item -->
				<div class="col-lg-4">
					<div class="listing">
						<div class="listing_image">
							<div class="listing_image_container">
								<img src="images/listing_2.jpg" alt="">
							</div>
							<div class="tags d-flex flex-row align-items-start justify-content-start flex-wrap">
								<div class="tag tag_house"><a href="listings.html">house</a></div>
								<div class="tag tag_rent"><a href="listings.html">for rent</a></div>
							</div>
							<div class="tag_price listing_price">$ 515 957</div>
						</div>
						<div class="listing_content">
							<div class="prop_location listing_location d-flex flex-row align-items-start justify-content-start">
								<img src="images/icon_1.png" alt="">
								<a href="single.html">4812 Haul Road Saint Paul, MN 55102</a>
							</div>
							<div class="listing_info">
								<ul class="d-flex flex-row align-items-center justify-content-start flex-wrap">
									<li class="property_area d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_2.png" alt="">
										<span>1234 sq ft</span>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_3.png" alt="">
										<span>2</span>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_4.png" alt="">
										<span>5</span>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_5.png" alt="">
										<span>2</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Featured Item -->
				<div class="col-lg-4">
					<div class="listing">
						<div class="listing_image">
							<div class="listing_image_container">
								<img src="images/listing_3.jpg" alt="">
							</div>
							<div class="tags d-flex flex-row align-items-start justify-content-start flex-wrap">
								<div class="tag tag_house"><a href="listings.html">house</a></div>
								<div class="tag tag_sale"><a href="listings.html">for sale</a></div>
							</div>
							<div class="tag_price listing_price">$ 375 255</div>
						</div>
						<div class="listing_content">
							<div class="prop_location listing_location d-flex flex-row align-items-start justify-content-start">
								<img src="images/icon_1.png" alt="">
								<a href="single.html">4067 Wolf Pen Road Mountain View, CA 94041</a>
							</div>
							<div class="listing_info">
								<ul class="d-flex flex-row align-items-center justify-content-start flex-wrap">
									<li class="property_area d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_2.png" alt="">
										<span>2000 sq ft</span>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_3.png" alt="">
										<span>2</span>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_4.png" alt="">
										<span>5</span>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<img src="images/icon_5.png" alt="">
										<span>2</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>--%>

	<!-- Hot -->

	<div class="hot">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<div class="section_subtitle">the best deals</div>
						<div class="section_title"><h1>Today's Hot Deal</h1></div>
					</div>
				</div>
			</div>
			</div>
			<%--<div class="row hot_row row-eq-height">
				
				<!-- Hot Deal Image -->
				<div class="col-lg-6">
					<div class="hot_image">
						<div class="background_image" style="background-image:url(images/hot.jpg)"></div>
						<div class="tags d-flex flex-row align-items-start justify-content-start flex-wrap">
							<div class="tag tag_house"><a href="listings.html">house</a></div>
							<div class="tag tag_sale"><a href="listings.html">for sale</a></div>
						</div>
					</div>
				</div>

				<!-- Hot Deal Content -->
				<div class="col-lg-6">
					<div class="hot_content">
						<div class="hot_deal">
							<div class="tag_price">$ 562 346</div>
							<div class="hot_title"><a href="#">Villa for sale</a></div>
							<div class="prop_location d-flex flex-row align-items-start justify-content-start">
								<img src="images/icon_1.png" alt="">
								<span>280 Doe Meadow Drive Landover, MD 20785</span>
							</div>
							<div class="prop_text">
								<p>Nulla aliquet bibendum sem, non placerat risus venenatis at. Prae sent vulputate bibendum dictum. Cras at vehicula urna. Suspendisse fringilla lobortis justo, ut tempor leo cursus in.</p>
							</div>
							<div class="prop_agent d-flex flex-row align-items-center justify-content-start">
								<div class="prop_agent_image"><img src="images/agent_1.jpg" alt=""></div>
								<div class="prop_agent_name"><a href="#">Maria Smith,</a> Agent</div>
							</div>
						</div>
						<div class="prop_info">
							<ul class="d-flex flex-row align-items-center justify-content-start flex-wrap">
								<li class="d-flex flex-row align-items-center justify-content-start">
									<img src="images/icon_2_large.png" alt="">
									<div>
										<div>1234</div>
										<div>sq ft</div>
									</div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<img src="images/icon_3_large.png" alt="">
									<div>
										<div>2</div>
										<div>baths</div>
									</div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<img src="images/icon_4_large.png" alt="">
									<div>
										<div>5</div>
										<div>beds</div>
									</div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<img src="images/icon_5_large.png" alt="">
									<div>
										<div>2</div>
										<div>garages</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>--%>

			<div class="listings_container" >
	<asp:DataList ID="DataList1" runat="server" DataKeyField="propertyid"   RepeatColumns="3" DataSourceID="SqlDataSource2">
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
											<a href='PropertyDetails.aspx?propertyid=<%# Eval("propertyid") %>'>For Sale<%--<asp:Label ID="lblstatus" runat="server" Text='<%#Eval("availability") %>'></asp:Label>--%></a></div>
									</div>
									<div class="tag_price listing_price">
										<asp:Label ID="lblprice" runat="server" Text='<%# Eval("specialPrice") %>'></asp:Label></div>
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
					<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p, tbbproperty b , tbimages m where p.propertyid = b.propertyid and p.special='Yes' and p.propertyid = m.propertyid and m.defaultValue='Yes'"></asp:SqlDataSource>
					</div>
		<br />
		<br />
	<!-- Testimonials -->

	<div class="testimonials container_reset">
		<div class="container">
			<div class="row row-eq-height">
				
				<!-- Testimonials Image -->
				<div class="col-xl-6">
					<div class="testimonials_image">
						<div class="background_image" style="background-image:url(images/testimonials.jpg)"></div>
						<div class="testimonials_image_overlay"></div>
					</div>
				</div>

				<!-- Testimonials Content -->
				<div class="col-xl-6">
					<div class="testimonials_content">
						<div class="section_title_container">
							<div class="section_subtitle">the best deals</div>
							<div class="section_title"><h1>Clients testimonials</h1></div>
						</div>

						<!-- Testimonials Slider -->
						<div class="testimonials_slider_container">
							<div class="owl-carousel owl-theme test_slider">
								
								<!-- Slide -->
								<div class="test_slide">
									<div class="test_quote">"They helped us find our home"</div>
									<div class="test_text">
										<p>Nulla aliquet bibendum sem, non placerat risus venenatis at. Prae sent vulputate bibendum dictum. Cras at vehicula urna. Suspendisse fringilla lobortis justo, ut tempor leo cursus in. Nulla aliquet bibendum sem, non placerat risus venenatis at. Prae sent vulputate bibendum dictum. Cras at vehicula urna. Suspendisse fringilla lobortis justo, ut tempor leo cursus in.</p>
									</div>
									<div class="test_author"><a href="#">Cristinne Smith</a>, Client</div>
								</div>

								<!-- Slide -->
								<div class="test_slide">
									<div class="test_quote">"They helped us find our home"</div>
									<div class="test_text">
										<p>Nulla aliquet bibendum sem, non placerat risus venenatis at. Prae sent vulputate bibendum dictum. Cras at vehicula urna. Suspendisse fringilla lobortis justo, ut tempor leo cursus in. Nulla aliquet bibendum sem, non placerat risus venenatis at. Prae sent vulputate bibendum dictum. Cras at vehicula urna. Suspendisse fringilla lobortis justo, ut tempor leo cursus in.</p>
									</div>
									<div class="test_author"><a href="#">Cristinne Smith</a>, Client</div>
								</div>

								<!-- Slide -->
								<div class="test_slide">
									<div class="test_quote">"They helped us find our home"</div>
									<div class="test_text">
										<p>Nulla aliquet bibendum sem, non placerat risus venenatis at. Prae sent vulputate bibendum dictum. Cras at vehicula urna. Suspendisse fringilla lobortis justo, ut tempor leo cursus in. Nulla aliquet bibendum sem, non placerat risus venenatis at. Prae sent vulputate bibendum dictum. Cras at vehicula urna. Suspendisse fringilla lobortis justo, ut tempor leo cursus in.</p>
									</div>
									<div class="test_author"><a href="#">Cristinne Smith</a>, Client</div>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


 
</div>
	</form>
</asp:Content>
