<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Topstar.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <link href="Content/bootstrap.min.css" rel="stylesheet" /> 
    <link href="Content/site.css" rel="stylesheet" /> 
    <script src="Scripts/jquery-1.9.1.min.js"></script> 
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
        <link rel="stylesheet" href="~/css/site.css" />


    <div class="container" style="margin-top:150px">
        <h1> Development Team</h1>
        <br />
        <label > We are the students of Auckland Institute of Studies(AIS) who made this application as part of our final year project. Our Team comprise of two developers and three information system students. </label>
      <br />
        <table class="form-control">
            <tr>
                <td><a href="https://www.linkedin.com/in/abhishek-chandrashekar-2b51b8b1/"> <asp:Image ID="Image1" runat="server" width="1690px" Height="260px" src="images/abhishek.jpg"/></a></td>
                <td> <a href="https://www.linkedin.com/in/aastha-goyal-00398912a/"><img style="width:1690px; height:260px" src="images/aashi.jpg" /></a></td>
                <td> <a href="https://www.linkedin.com/in/fan-ivan-yang-351326156"><img style="width:1690px; height:260px" src="images/fan.jpg" /></a></td>
                <td> <a href="https://www.linkedin.com/in/gauri-sharma-066284185/"> <asp:Image ID="Image3" style="width:1690px; height:260px" runat="server" src="images/gauri.jpg" /></a></td>
                <td> <a href="https://www.linkedin.com/in/khim-bahadur-pun-5a2284185/"><img style="width:1690px; height:260px"src="images/khim.jpg" /></a></td>
                
            </tr>
            <tr> 
                     <td class="text-center"> <asp:Label ID="Label10" runat="server" Text="Abhishek Sharma" Font-Bold="True" ForeColor="#CC0000"></asp:Label></td>


                <td class="text-center"> <asp:Label ID="Label1" runat="server" Text="Aastha Goyal" Font-Bold="True" ForeColor="#CC0000"></asp:Label></td>
                 <td class="text-center"> <asp:Label ID="Label8" runat="server" Text="Ivan Yang" Font-Bold="True" ForeColor="#CC0000"></asp:Label></td>
                <td class="text-center"> <asp:Label ID="Label9" runat="server" Text="Gauri Sharma" Font-Bold="True" ForeColor="#CC0000"></asp:Label></td>

                <td class="text-center"> <asp:Label ID="Label11" runat="server" Text="Khim Bahadur" Font-Bold="True" ForeColor="#CC0000"></asp:Label></td>




            </tr>
            <tr>
                <td class="text-center"> <asp:Label ID="Label2" runat="server" Text="Project Manager" Font-Bold="True"></asp:Label></td>
                   <td class="text-center"> <asp:Label ID="Label4" runat="server" Text="Developer" Font-Bold="True"></asp:Label></td>
          
                   <td class="text-center"> <asp:Label ID="Label5" runat="server" Text="Developer" Font-Bold="True"></asp:Label></td>
          
                   <td class="text-center"> <asp:Label ID="Label6" runat="server" Text="System Tester" Font-Bold="True"></asp:Label></td>
          
                   <td class="text-center"> <asp:Label ID="Label7" runat="server" Text="System Tester" Font-Bold="True"></asp:Label></td>
          
            </tr>
            <tr> 
                <td class="text-center"> <asp:Label ID="Label3" runat="server" Text="GDIT Student" ForeColor="#009900"></asp:Label></td>
                <td class="text-center"> <asp:Label ID="Label12" runat="server" Text="BIT Student" ForeColor="#009900"></asp:Label></td>

                <td class="text-center"> <asp:Label ID="Label13" runat="server" Text="BIT Student" ForeColor="#009900"></asp:Label></td>

                <td class="text-center"> <asp:Label ID="Label14" runat="server" Text="GDIT Student" ForeColor="#009900"></asp:Label></td>

                <td class="text-center"> <asp:Label ID="Label15" runat="server" Text="GDIT Student" ForeColor="#009900"></asp:Label></td>

            </tr>
        </table>
        <br />

    </div>
</asp:Content>
