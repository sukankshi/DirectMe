<%@ Page Language="C#" AutoEventWireup="true" CodeFile="garage.aspx.cs" EnableEventValidation="false" Inherits="garage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Garage</title>
    <link rel="stylesheet" type="text/css" href="css1/stylemodal.css" />
     <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link href='http://fonts.googleapis.com/css?family=Dosis:200,400,700' rel='stylesheet' type='text/css' />
    <script type="text/javascript" src="js/modernizr.custom.79639.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />


    <link href="css/garage.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css' />
    <style type="text/css">
        .direct-tooltip + .tooltip > .tooltip-inner {
            padding:10px;
            font-size:14px;
            color:white;
        }
    </style>
</head>
<body>


    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" />



        <section class="rain"></section>

        <div class="container">
            <div class="helloMsg">
                <div class="herrbrueckers"></div>
                <h1 class="helloTxt">Howdy, <span id="name" style="text-transform: capitalize" runat="server"></span></h1>
                 <h2 class="helloTxt" style="text-align:center;">Your Sector is <span id="Span1" style="text-transform: capitalize" runat="server"></span></h2>
                <p style="font-family:'Segoe UI'; text-align:justify; width:500px; background-color:white; padding:10px;">
                   The competition in the market is increasing, car dealers from far away places are arriving in the city.
New cars with exciting deals will be launched every hour.
                    <a href="https://www.facebook.com/pages/Direct-Me/822537164466099"><b>Stay Tuned >> </b></a>
                    <br /><br />
                    <strong>Many more to come.</strong>
                </p>
            </div>

            <asp:LinkButton runat="server" ID="btn_logout" OnClick="btn_logout_Click">
            <div class="logout">
                <img src="img/login.png" width="60" /><h4>Logout</h4>
            </div>
            </asp:LinkButton>
            <%--     <div class="logo">
                <img src="img/logo.png" width="260" />
            </div>--%>


            <div class="leftContent">
                <a data-toggle="tooltip" class="direct-tooltip" data-placement="left" target="_blank" title="Get your notifications right here." href="Notification.aspx">
                    <div class="park light park0">

                        <h1>Notifications</h1>

                    </div>
                </a>

                <a data-toggle="tooltip" class="direct-tooltip" data-placement="left" title="Want to earn some cash? Spot a parking lot in any of the sectors and just Park!" href="Cars.aspx">
                    <div class="park light">

                        <h1>Park Now</h1>

                    </div>
                </a>
                
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                 <asp:Button ID="Button1"  data-toggle="tooltip" data-placement="left" title="View your parked cars here.Beware of the police.You dont want police  to fine you on public lanes" Text="Parked Cars" Font-Size="27px" CssClass="myParking hvrGrow key key1 light direct-tooltip" OnClick="Button1_Click" runat="server"></asp:Button>

                <%-- <div class="hvrGrow key key2 light" data-toggle="modal" data-target="#UsersParked">
                    <h1>My Parking</h1>
                </div>--%>
               <br />

                        <asp:Button  data-toggle="tooltip" data-placement="left" title="Want to fine others? Catch other players parking on your spot and fine them here!" Text="My Parking" Font-Size="27px" CssClass="myParking hvrGrow key key2 light direct-tooltip" OnClick="Unnamed_Click3" runat="server"></asp:Button>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <a data-toggle="tooltip" class="direct-tooltip" data-placement="left" title="Check out who fined you, by how much & from whose parking you earned cash." href="PreviousLogs.aspx" target="_blank">
                    <div class="hvrGrow key key3 light ">
                        <h1 style="font-size: 26px; padding: 0; margin: 4px;">Previous Parking</h1>
                    </div>

                </a>

            </div>



            <div class="rightInfo">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                    
                <span>&#8377;<p runat="server" id="money"></p>

                </span>
                        </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div  class=" rightContent" >
                <div class="direct-tooltip" data-toggle="tooltip" data-placement="top" title="Shop for better cars which can earn you some more cash!">
                    <a href="Shop.aspx">
                        <img src="img/shop.png" /><h4>Shop</h4>
                    </a>
                </div>
                
                <div>
                    <a href="leaderboard.aspx" target="_blank">
                        <img src="img/leader.png" /><h4>Leaderboard</h4>
                    </a>
                </div>
                <div>
                    <a href="rules.aspx" target="_blank">
                        <img src="img/rules.png" />
                        <h4>Rules</h4>
                    </a>
                </div>

            </div>

            <div class="carContainer">
                <div class="arrowDown">
                    <img src="img/arrowdown.png" width="32" />
                </div>

                <a href="Cars.aspx">
                    <h2>View your cars.</h2>
                    <img src="img/car.png" width="340" />
                </a>

            </div>



            <%--======================ALL MODALS===========================================--%>
            <!-- YOUR CARS Modal -->

            <asp:UpdateProgress runat="server">
                <ProgressTemplate>
                    <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                        <asp:Image  ID="imgUpdateProgress" runat="server" ImageUrl="img/spinner.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="height: 80px; padding: 10px; position: fixed; top: 45%; left: 50%;" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <%--modal ends--%>







            <!-- Sell CAR Modal -->







            <!-- my parking Modal -->
            <asp:UpdatePanel runat="server">
                <ContentTemplate>

               
            <div class="modal fade" id="UsersParked" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title" id="myModalLabel">Cars parked on your lanes</h2>

                        </div>
                        <div class="modal-body">
                            <center>
                            
                                    <asp:GridView CssClass="parkedCars" runat="server" ID="GridView2" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField HeaderText="Car Owner" DataField="username" />


                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ToolTip="Fine This User" ImageUrl="~/img/hammer.png" Visible='<%# !new Parking().IsParkingAllowed(Convert.ToInt32(Eval("parking_id"))) %>' CommandArgument='<%#Eval("parking_id") %>'  runat="server" ID="btn_fine" OnClick="btn_fine_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                               
                               </center>

                        </div>

                    </div>
                </div>
            </div>

 

            <!--  parked cars Modal -->
            <div class="modal fade" id="ViewParkedCarsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title" id="myModalLabel">Cars parked by you</h2>

                        </div>
                        <div class="modal-body">
                            <asp:GridView runat="server" class="table" ID="grid_view_parked_cars" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="index" Visible="false" HeaderText="S.No." />

                                    <asp:TemplateField HeaderText="Car Name">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# GetCarName(Convert.ToInt32(Eval("carid"))) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="username" HeaderText="Lane Owner" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button Text="X" CssClass="removeItem" CommandArgument='<%#Eval("carid") %>' runat="server" OnClick="Unnamed_Click1" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>


                            </asp:GridView>


                        </div>

                    </div>
                </div>
            </div>
            <%--modal ends--%>

            </ContentTemplate>
            </asp:UpdatePanel>
            <%--POP_UP MODAL for no cars--%>

            <div class="modal fade" id="NoCarsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title" id="myModalLabel">Sorry, No Car</h2>

                        </div>
                        <div class="modal-body">
                            You have no cars to park, in your garage.
                              
                              <a href="Shop.aspx">Please buy a car.</a>
                        </div>

                    </div>
                </div>
            </div>


            <%--modal ends--%>
        </div>
        <%--container ends--%>
    </form>
</body>

<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery if needed -->
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    })
</script>

<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function EndRequestHandler(sender, args) {
            $(function () {

                Slider.init();

            });
        }

    });
</script>
<script type="text/javascript">

    $(function () {

        Slider.init();

    });


</script>
<script>
    // number of drops created.
    var nbDrop = 108;

    // function to generate a random number range.
    function randRange(minNum, maxNum) {
        return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
    }

    // function to generate drops
    function createRain() {

        for (i = 1; i < nbDrop; i++) {
            var dropLeft = randRange(3, 1400);
            var dropTop = randRange(-1000, 660);

            $('.rain').append('<div class="drop" id="drop' + i + '"></div>');
            $('#drop' + i).css('left', dropLeft);
            $('#drop' + i).css('top', dropTop);
        }

    }
    // Make it rain
    createRain();</script>  

<script type="text/javascript">
    function stop() {
        return false;
    }
    document.onmousewheel = stop;
</script>


</html>
