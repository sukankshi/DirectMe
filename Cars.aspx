<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cars.aspx.cs" Inherits="ViewCars" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>Your Cars</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>

        <link rel="shortcut icon" href="../favicon.ico"/> 
        <link rel="stylesheet" type="text/css" href="css1/style.css" />
		<link href='http://fonts.googleapis.com/css?family=Dosis:200,400,700' rel='stylesheet' type='text/css'/>
		<script type="text/javascript" src="js/modernizr.custom.79639.js"></script>
		<noscript><link rel="stylesheet" type="text/css" href="css1/noscript.css" /></noscript>
</head>
<body>
    
    <form id="form1" runat="server">
         <asp:ScriptManager runat="server" />
     
        
                

        <asp:UpdatePanel runat="server">
            <ContentTemplate>

            
                            <div class="modal fade" id="sell_car" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title" id="">Really! Want to sell this car? </h2>
                            <asp:Button runat="server" Text="Yes" class="btn btn-default" OnClick="Unnamed_Click" />
                        </div>


                    </div>
                </div>
            </div>
                </ContentTemplate>
        </asp:UpdatePanel>

           
        

         
    <section id="ps-container" class="ps-container">
		
			<div class="ps-header">
                 <div class="garageBtn"><a href="garage.aspx"><img src="img/shop.png" /> <h2>go back to Garage</h2></a></div>
                
				<a href="garage.aspx"><h1><img src="img/logo.png" width="140" style="padding:20px;" />Choose your Car.</h1></a>
                
			</div><!-- /ps-header -->
       
			
       
            <div class="ps-contentwrapper">
             
                 <asp:Repeater runat="server" ID="d">
            <ItemTemplate>
                 
                <div class="ps-content">
                    <h2>Vehicle : <%#Eval("carname") %></h2>
                    <span class="ps-price"> &#8377; <%#Eval("cost") %></span>
                    <p>Revenue generated : <strong> &#8377; <%#Eval("base_revenue") %>/half hour </strong></p>
                   
                          <%--  <asp:LinkButton CommandArgument='<%#Eval("carId") %>' OnClick="buy_Click" runat="server" ID="buy">Buy this car</asp:LinkButton>--%>
                    <br /> 
                    <p>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>

                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>

                     <asp:LinkButton CssClass="btnSell" style="margin-top:10px;" CommandArgument='<%#Eval("carId") %>' Enabled='<%# GetCarStatus(Convert.ToInt32(Eval("carId")),Convert.ToInt32(Session["ttid"])) %>' OnClick="btn_sell_Click" runat="server" ID="btn_sell">
                                                    <%# Convert.ToBoolean(Session["value"]) ? "Sell this car" :"Car Already Parked" %>
                            </asp:LinkButton>
                                        
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                 </ContentTemplate>
                        </asp:UpdatePanel>
                         </p> 
                    <br /> 
                    <p>
                    <asp:LinkButton style="margin-right: -15px;" CommandArgument='<%#Eval("carId") %>' Enabled='<%# Convert.ToBoolean(Session["value"])  %>' OnClick="btn_choose_Click" runat="server" ID="btn_choose">
                                                    <%# Convert.ToBoolean(Session["value"])  ? "Choose this car" :"Car Already Parked" %>
                            </asp:LinkButton>
                        </p> 
                     </div>
                              
            </ItemTemplate>
        </asp:Repeater>
            <a runat="server" class="messageText" id="lnk_msg" visible="false" href="Shop.aspx">It's lonely here.<h2> Please visit shop to buy a vehicle.</h2></a>
            </div><!-- /ps-contentwrapper -->
			
			<div class="ps-slidewrapper">
			
				<div class="ps-slides">
                   
                    <asp:Repeater runat="server" ID="a">
                        <ItemTemplate>
                            <div style="background-image: url(<%# Eval("car_icon") %>); background-size:contain;"></div>
                        </ItemTemplate>
                    </asp:Repeater>
			
				</div>
				
				<nav>
					<a href="#" class="ps-prev" ></a>
					<a href="#" class="ps-next" ></a>
				</nav>
				
			</div><!-- /ps-slidewrapper -->
			
        
		</section><!-- /ps-container -->
			 
		<!-- jQuery if needed -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="Scripts/jquery-2.1.3.js"></script>
        
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
       <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>--%>
		<script type="text/javascript" src="js/slider.js"></script>
		<script type="text/javascript">
		    $(function () {

		        Slider.init();

		    });
		</script>
    </form>
</body>
</html>
