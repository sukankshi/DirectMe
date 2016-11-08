<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NoCar.aspx.cs" Inherits="NoCar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body, h2 {
            text-align:center;
            font-size:42px;
            font-family:'Segoe UI';
            font-weight:300;
        }
        body {
            padding-top:200px;
        }
        a {
            text-decoration:none;
            color:black;
        }
    </style>
      <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
</head>
<body style="background-color:#EAAC02;">
    <form id="form1" runat="server">
    <div>
      <a runat="server" class="messageText" id="lnk_msg" href="Shop.aspx">It's lonely here.<h2> Please visit shop to buy a vehicle.</h2></a>
    </div>
    </form>
</body>
</html>
