﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="opponentsector.aspx.cs" Inherits="oponentsector" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Opponent Sector</title>
      <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="css/opponentsector.css"/>
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
            <div class="logo"><img src="img/logo.png" width="170" /> </div>

            <div class="heading"><h1>Select Sector</h1>
            <p>Select a sector where you would like to park your car</p>
               
            </div>
        
        <asp:ScriptManager runat="server" />
    
       
            <div class="buildingContainer">

                <asp:LinkButton runat="server"  CommandArgument="1" ID="lnk_click" OnClick="lnk_click_Click">
                <div id="building1Div" class="building" onclick="div_click(this)">
                    <h1>Sector 1</h1>
                    <div class="arrowDown"><img src="img/arrowdown.png" width="32" /></div>
                    <img src="img/building/building1.png" class="buildingImage" style="width:200px;" />
                    

                </div>
                    </asp:LinkButton>
                <asp:LinkButton runat="server"  CommandArgument="2" OnClick="lnk_click_Click">
                <div id="building2Div" class="building" onclick="div_click(this)">
                    <h1>Sector 2</h1>
                    <div class="arrowDown"><img src="img/arrowdown.png" width="32" /></div>
                    <img src="img/building/building2.png" class="buildingImage" />
                  
                </div>
                    </asp:LinkButton>

                <asp:LinkButton runat="server"  CommandArgument="3" OnClick="lnk_click_Click">
                <div id="building3Div" class="building" onclick="div_click(this)">
                    <h1>Sector 3</h1>
                    <div class="arrowDown"><img src="img/arrowdown.png" width="32" /></div>
                    <img src="img/building/building3.png" class="buildingImage" style="width:200px;" />
                    
                </div>
                    </asp:LinkButton>
                <asp:LinkButton runat="server"  CommandArgument="4" OnClick="lnk_click_Click">
                <div id="building4Div" class="building" onclick="div_click(this)">
                    <h1>Sector 4</h1>
                    <div class="arrowDown"><img src="img/arrowdown.png" width="32" /></div>
                    <img src="img/building/building4.png" class="buildingImage" />
                   
                </div>
                    </asp:LinkButton>
            </div>
 
        
			<div class="footer">
				<!--<img src="img/road6.png" id="roadImage"/>-->
			</div>
            <div class="carContainer">
                <div class="car"><img src="img/car.png" ></div>                
            </div>
             
       <%-- <div >
        <asp:Button  class="continue" runat="server" Text="Continue" OnClick="Unnamed_Click" />
            </div>

		</div>--%>
        <asp:HiddenField runat="server" id="hidden_server" />

   


		<!-- container ends -->
    </form>
    <script src="Scripts/jquery-2.1.3.js"></script>
    <%--BACKGROUND COLOR ACCRDN TO TYM--%>
<script type="text/javascript">
    var currentTime = new Date().getHours();
    if (7 <= currentTime && currentTime < 17) {
        if (document.body) {
            document.body.style.backgroundColor = "rgb(175, 230, 255)";
        }
    }
    else if (17 <= currentTime && currentTime < 22) {
        if (document.body) {
            document.body.style.backgroundColor = "rgb(247, 219, 157)";
        }
    }
    else {
        if (document.body) {
            document.body.style.backgroundColor = "rgb(55,55,55)";
        }
    }

</script>
</body>

</html>
