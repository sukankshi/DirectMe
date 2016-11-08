<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Alpha.aspx.cs" Inherits="Alpha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>
        
    </title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="container">
            <div class="col-md-5">
        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
        
        <asp:TextBox ID="txtbox_name" runat="server" style="position: relative; top: 8px; left: 82px"></asp:TextBox>
        <br />
        
        <br />
        <asp:Label ID="Label2" runat="server" Text="Cost"></asp:Label>
        <asp:TextBox ID="txtbox_cost" runat="server" style="position: relative; top: 5px; left: 90px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Base Revenue"></asp:Label>
        <asp:TextBox ID="txtbox_baserev" runat="server" style="position: relative; top: 6px; left: 29px"></asp:TextBox>
        <br />
        <br />
        <asp:FileUpload id="FileUploadControl" runat="server" />
        <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
        <br /><br />
        <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
    </div>
            <div class="col-md-5">
      
            <asp:Label ID="Label4" runat="server" Text="Number of Parkings per sector"></asp:Label>
            <asp:TextBox ID="txtbox_parking" runat="server" style="position: relative; top: 4px; left: 23px; width: 49px; margin-bottom: 0px"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="position: relative; top: 44px; left: -240px; width: 141px" Text="Generate Parkings" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="position: relative; top: 91px; left: 9px; width: 141px" Text="Send Bots" />

        
                </div>
        <div class="container">


        <asp:GridView runat="server" ID="grid_public" class="table table-hover" AllowPaging="true" PageSize="10" OnPageIndexChanging="grid_notificationPageIndexChanging">
            
        </asp:GridView>
                </div>
        </div>
    </form>
</body>
</html>
