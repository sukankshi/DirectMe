<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PreviousLogs.aspx.cs" Inherits="PreviousLogs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <title>Previous Parking Transactions | Direct Me</title>
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
            <h2>Your Parkings on Private Lanes</h2>
            <asp:GridView runat="server" ID="grid_previous" class="table" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="grid_previous_PageIndexChanging" PageSize="4">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="Lane Owner" />
                    <asp:BoundField DataField="ParkedOn" HeaderText="Lane Type" />
                    <asp:BoundField DataField="ParkingDate" HeaderText="Parked On" />
                    <asp:BoundField DataField="IsSuccess" HeaderText="Status" />
                    <asp:BoundField DataField="Revenue" HeaderText="Revenue" />
                    <asp:BoundField DataField="Fine" HeaderText="Fine" />
                </Columns>
            </asp:GridView>

            <br />
            <h2>Your Parkings on Public Lanes</h2>
            <asp:GridView runat="server" ID="GridView_public_logs" class="table" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView_public_logs_PageIndexChanging" PageSize="4">
                <Columns>
                    <asp:BoundField DataField="ParkingDate" HeaderText="Parked On" />
                    <asp:BoundField DataField="IsSuccess" HeaderText="Status" />
                    <asp:BoundField DataField="Revenue" HeaderText="Revenue" />
                    <asp:BoundField DataField="Fine" HeaderText="Fine" />
                </Columns>
            </asp:GridView>
        </div>
            </center>
    </form>
</body>
</html>
