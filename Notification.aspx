﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Notification.aspx.cs" Inherits="Notification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <title>Notifications | Direct Me</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <link href="css/leaderboard.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css' />
    <style type="text/css">
        table tr td, table tr th {
            text-align: center;
            
        }

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            border: none;
            text-transform: capitalize;
            border: 1px solid #09210c;
        }

        .table {
            border-collapse: collapse;
            font-size: 14px;
            border: none;
            letter-spacing: 1px;
        }
        h2 {
            font-size:20px;
            font-weight:bold;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
        <div class="previousLogs">
            <h2>Your Notifications</h2>
            <asp:GridView runat="server" ID="grid_previous" class="table" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="grid_notificationPageIndexChanging" PageSize="7">
                <Columns>
                    <asp:BoundField DataField="MessageId" HeaderText="S No." />
                    <asp:BoundField DataField="Message" HeaderText="Notification" />
                    
                </Columns>
            </asp:GridView>

         </center>
    </form>
</body>
</html>
