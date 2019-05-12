<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="BuyPropertyDetails.aspx.cs" Inherits="Topstar.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/1/js-image-slider.js" type="text/javascript"></script>
    <link href="generic.css" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <link href="Content/bootstrap.min.css" rel="stylesheet" /> 
    <link href="Content/site.css" rel="stylesheet" /> 
    <script src="Scripts/jquery-1.9.1.min.js"></script> 
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
        <link rel="stylesheet" href="~/css/site.css" />

<div class="container" style="margin-top:150px">

    <form runat="server">
        <table >
            <tr>
                <td rowspan="6"> <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick"></asp:Timer>
            <asp:Image ID="Image1" Height="500px" Width="700px" runat="server" />
         
       
        </ContentTemplate>
  </asp:UpdatePanel> </td>
                <td> <h1 style="font-size: x-large; font-weight: bold; font-family: 'Comic Sans MS'; color: #FF0000">
                        Address: <asp:Label ID="lbladdress" runat="server" ></asp:Label>
                    </h1></td>
            </tr>
            <tr> 
                <td style="font-size: x-large; font-family: 'Comic Sans MS'; font-weight: bold; color: #008000">
                       Selling Price: <asp:Label ID="lblRent" runat="server" />
                  
                    </td>
                 </tr>
            <tr>
                <td>
                     <img src="images/bed.png" style="width: 36px; height: 36px" />
                        <asp:Label ID="lblbed" runat="server" Font-Bold="True" Font-Size="Large" /> Bedrooms
               
                </td>
            </tr>
            <tr> <td>
                 <img src="images/bath.png" style="width: 36px; height: 36px" />
                        <asp:Label ID="lblbath" runat="server"  Font-Bold="True" Font-Size="Large" /> Bathrooms
               
                 </td></tr>
            <tr>
                <td> 
                     <img src="images/park2.png" style="width: 36px; height: 36px" />
                        <asp:Label ID="lblparking" runat="server"  Font-Bold="True" Font-Size="Large" /> Parking spaces
                
                </td>
            </tr>
            <tr>
                    <td style="height: 22px">Property Type:
                        <asp:Label ID="lbltype" runat="server" Font-Bold="True" Font-Size="Large" />
                    </td>
                </tr>
              
                
                <tr>
                    <td colspan="2">
                       Description: <asp:Label ID="lbldesc" runat="server"   Font-Size="Large" />
                    </td>
                </tr>
            
        </table>
                    
   


    </form>
    </div>
</asp:Content>
