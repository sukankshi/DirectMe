<%@ Page Language="C#" AutoEventWireup="true" CodeFile="park.aspx.cs" Inherits="oponentsector" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Park now</title>
      <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="css/park.css" />

</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <a href="garage.aspx">
            <div class="logo">
                <img src="img/logo.png" width="170" />
            </div>
                </a>

            <div class="heading">
                <h1>Select Parking lot type</h1>
                <p>Select a parking lot where you would like to park your car</p>
                <p>in <strong>Sector<strong runat="server" id="lbl_sector"></strong> </strong></p>
                <h2 runat="server" id="parked_success" visible="false">Parked Successfully.</h2>
                <p>Go back to your <a href="garage.aspx"><strong>Garage</strong></a> </p>
                <asp:LinkButton  runat="server" OnClick="Unnamed_Click1" style="font-size:20px;">Choose another sector</asp:LinkButton>
                <%--<asp:Button Text="Want to earn more" ID="btn_earn_more" Visible="false" runat="server" OnClick="Unnamed_Click" />--%>
            </div>
            <div class="cloud">
                <div id="cloud1">
                    <img src="img/cloud1.png" id="cloud1Image" />
                </div>
                <div id="cloud2">
                    <img src="img/cloud2.png" id="cloud2Image" />
                </div>

            </div>


            


            <div class="gridPark">
                <div class="publicGrid park">
                    <div class="head2" data-toggle="modal" data-target="#grid_private_modal">
                        <h1>Private</h1>
                    </div>
                </div>
                <div class="privateGrid park">
                    <div class="head2" id="publicHead" data-toggle="modal" data-target="#grid_public_modal">
                        <h1>Public</h1>
                      
                    </div>
                </div>
            </div>
            <div class="footer">
                <!--<img src="img/road6.png" id="roadImage"/>-->
            </div>
            <div class="carContainer">
                <div class="car">
                    <img src="img/car.png">
                </div>
            </div>


        </div>

        <div class="modal fade" id="grid_public_modal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h2 class="modal-title" id="myModalLabel">Public Zones</h2>
                        

                    </div>
                    <div class="modal-body">
                        
                        <div class="gridPark parkPublic" style="margin-top:0px;">
                            
                            <asp:GridView CssClass="grids table table-bordered" runat="server" class="table" ID="grid_public" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField HeaderText="Sector" DataField="sector_id" />
                                    <asp:TemplateField HeaderText="Vacant">
                                        <ItemTemplate>
                                            <%#IsVacant(Convert.ToBoolean(Eval("isvacant"))) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button runat="server" Text='<%#IsVacant(Convert.ToBoolean(Eval("isvacant"))) == "Yes" ? "Park":"Unavailable"%>' Enabled='<%#IsVacant(Convert.ToBoolean(Eval("isvacant"))) == "Yes" ? true:false %>' OnClick="btn_public_park" CommandArgument='<%#Eval("id") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div class="modal fade" id="grid_private_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h2 class="modal-title" id="myModalLabel">Private Zones</h2>

                    </div>
                    <div class="modal-body">
                        <div class="search"><input type="text" placeholder="Search" class="form-control" id="search" /></div>
                        <br />
                        <br /><br />
                        <div class="gridPark parkPublic" style="margin-top:0px;">
                            <asp:GridView runat="server"  class="table" ID="grid_private" AutoGenerateColumns="false">
                                <Columns>

                                    <asp:BoundField HeaderText="Sector" DataField="sector_id" />
                                    <asp:BoundField HeaderText="Owner Name" DataField="UserName" />


                                    <asp:TemplateField HeaderText="vacant">
                                        <ItemTemplate>
                                            <%#IsVacant(Convert.ToBoolean(Eval("isvacant"))) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <%#IsAllowed(Convert.ToBoolean(Eval("allowed"))) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button runat="server" Text="Choose" OnClick="btn_private_park" CommandArgument='<%#Eval("id") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- container ends -->
    </form>
    <script src="Scripts/jquery-2.1.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="http://cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js"></script>
    <script src="http://cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js"></script>
    <%-- <script>
       $(document).ready(function () {
            $(".head").click(function () {
                $(".publicGrid").animate({
                    height: 'toggle'
                });
                console.log("toggle");
            });

            $(".head2").click(function () {
                $(".privateGrid").animate({
                    height: 'toggle'
                });
                console.log("toggle");
            });

        });

    </script>--%>
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
    <script src="Scripts/search.js"></script>
</body>

</html>
