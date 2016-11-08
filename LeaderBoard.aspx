﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaderBoard.aspx.cs" Inherits="LeaderBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leaderboard | Direct Me</title>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
      <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <link href="css/leaderboard.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css' />
    <style type="text/css">
        table tr td {
            text-transform:uppercase;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
        <div class="container">
            <div class="row heading">
                <h1>Leaderboard</h1>
                <div>
                    <table class="table table-bordered" >
                        <tr>
                            <th>
                                TTID
                            </th>
                            <th>
                                Name
                            </th>
                            <th>
                                Cash
                            </th>
                            <th>
                                Net Worth
                            </th>
                        </tr>
                        <tr>
                            <td>1447</td>
                            <td>GYAN PRAKASH GUPTA</td>
                            <td>4377916</td>
                            <td>17377916</td>
                        </tr>
                         <tr>
                            <td>1165</td>
                            <td>ABHINAV RAI</td>
                             <td>839268</td>
                            <td>15839268</td>
                        </tr>
                         <tr>
                             <td>1270</td>
                            <td>MANYA SINGH</td>
                            <td>2152391</td>
                            <td>8002391</td>
                        </tr>
                    </table>

                    <asp:GridView runat="server" ID="grid_leaders" CssClass="table table-bordered" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="grid_leaders_PageIndexChanging"  PageSize="9">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Player Name" />
                           
                            <asp:BoundField DataField="Cash" HeaderText="Cash" />
                             <asp:BoundField DataField="Networth" HeaderText="Networth" />
                         
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
            </center>
    </form>
</body>
</html>
