<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="AdminMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
        }
        .auto-style2
        {
            width: 230px;
            text-align: right;
        }
        .auto-style3
        {
            width: 189px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Admin:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBoxName" runat="server" Width="179px"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style2">Password:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" 
                        Width="178px"></asp:TextBox>
                </td>
                
            </tr>
        </table>
        <asp:Label ID="LabelMessage" runat="server" style="position: absolute; z-index: 1; left: 168px; top: 99px; width: 74px; right: 1039px; margin-left: 0px"></asp:Label>
        <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" 
            style="margin-left: 376px" Text="Login" />
    </form>
</body>
</html>