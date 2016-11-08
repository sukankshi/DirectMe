<%@ Page Language="C#" Async="true" EnableEventValidation="false" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Direct Me</title>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
    <link href="css/dialog.css" rel="stylesheet" />
    <link href="css/dialog-val.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
    <script src="js/modernizr.custom.js"></script>
</head>
<body>
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <form id="form1" runat="server">
        <div>
            <section class="rain"></section>
            <div class="container">
                <div style="position: absolute; top: 10px; right: 180px;">
                    <span style="font-size: 18px;">Game</span>&nbsp;
                    <div class="fb-like" data-href="https://www.facebook.com/pages/Direct-Me/822537164466099" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>
                    &nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 18px;">Developers</span>&nbsp;
                   <div class="fb-like" data-href="https://www.facebook.com/RedefiningLimitations" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>
                </div>
                <div class="logo"></div>

                <div class="login button-wrap">
                    <div data-dialog="somedialog1" class="trigger">
                        <img src="img/login.png" /><br />
                        <span>Login</span>
                    </div>
                    <br />
                    <a href="rules.aspx" target="_blank">
                        <div class="trigger">
                            <img src="img/rules.png" /><br />
                            <span>Rules</span>
                        </div>
                    </a>
                    <br />


                    <div class="trigger button-wrap" data-toggle="modal" data-target="#creditsModal">
                        <img src="img/credits.png" /><br />
                        <span>Credits</span>
                    </div>

                </div>

                <div class="cloud">
                    <div id="cloud1">
                        <img src="img/cloud1.png" id="cloud1Image" />
                    </div>
                    <div id="cloud2">
                        <img src="img/cloud2.png" id="cloud2Image" />
                    </div>
                    <!--<div id="cloud3"></div>-->
                </div>


                <div class="footer">
                    <!--<img src="img/road5.png" id="roadImage"/>-->
                </div>
                <div class="carContainer">
                    <div class="car">
                        <img src="img/car.png">
                    </div>
                    <div class="tyre">
                        <div id="tyre1">
                            <!--<img src="img/tyre.png" />-->
                        </div>
                        <div id="tyre2">
                            <img src="img/tyre.png" />
                        </div>
                    </div>
                </div>

            </div>

            <!--login dialog box-->

            <div id="somedialog1" class="dialog">
                <div class="dialog__overlay"></div>
                <div class="dialog__content">
                    <h2><strong>Howdy</strong>, login here</h2>
                    <div>
                        <div class="loginDetails">
                            <form class="loginForm">
                                <p>
                                    <input required="required"  type="text" runat="server" name="login" value="" id="txt_email" placeholder="Your Email" autofocus="autofocus" />
                                </p>
                                <p>
                                    <input required="required" type="password"  runat="server" name="password" value="" id="txt_password" placeholder="TT Password" />
                                </p>
                            </form>
                        </div>


                        <asp:ScriptManager runat="server" />

                        <asp:UpdatePanel runat="server" ID="login">
                            <ContentTemplate>

                                <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="login" DynamicLayout="true">
                                    <ProgressTemplate>

                                        <img src="~/img/spinner.gif" style="height: 33px; margin-top: 30px;" runat="server" id="loader" />
                                        </center>
                                </p>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <input type="button" class="action formButton" data-dialog-close value="CLOSE">
                                <asp:Button ID="Button1" class="formButton" runat="server" Text="SUBMIT" OnClick="Button1_Click" />
                                <p>
                                    <center><asp:Label runat="server" ID="lbl_error"></asp:Label></center>
                                </p>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>


            </div>

            <%--credits modal--%>
            <div class="modal fade" id="creditsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content text-center">
                        <div class="modal-header ">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title" id="myModalLabel">Tech heads behind this Game</h2>

                        </div>
                        <div class="modal-body">

                            <div class="creditspage">
                                <div class="container1" id="credits-container">

                                    <div class="row" id="credits_pic">
                                        <div style="margin-left: -40px; margin-top: -40px;" class="col-md-12">


                                            <div class="persona">
                                                <a href="https://www.facebook.com/ashutosh.jainvi " target="_blank">
                                                    <img src="img/jainvi.jpg" class="img-responsive person">
                                                    <p>
                                                        Ashutosh Jainvi
                                                    </p>
                                                    <p>Designer </p>
                                                </a>
                                            </div>

                                            <div class="persona">
                                                <a href="https://www.facebook.com/juneja.mudit" target="_blank">
                                                    <img src="img/mudit.jpg" class="img-responsive person">
                                                    <p>Mudit Juneja</p>
                                                    <p>Developer</p>
                                                </a>
                                            </div>

                                            <div class="persona">
                                                <a href="https://www.facebook.com/himanshu.mandal.007" target="_blank">
                                                    <img src="img/mandal.jpg" class="img-responsive person">
                                                    <p>
                                                        Himanshu Mandal
                                                    </p>
                                                    <p>Designer</p>
                                                </a>
                                            </div>


                                            <div class="persona">
                                                <a href="https://www.facebook.com/The.Anup.Kumar.Gupta" target="_blank">
                                                    <img src="img/anup.jpg" class="img-responsive person">
                                                    <p>
                                                        Anup Kumar Gupta
                                                    </p>
                                                    <p>Developer</p>
                                                </a>
                                            </div>

                                            <div class="persona">
                                                <a href="https://www.facebook.com/aditisinghsikarwar" target="_blank">
                                                    <img src="img/aditi.jpg" class="img-responsive person">
                                                    <p>
                                                        Aditi Singh
                                                    </p>
                                                    <p>Developer</p>
                                                </a>
                                            </div>

                                            <div class="persona">
                                                <a href="https://www.facebook.com/sukankshi.jain" target="_blank">
                                                    <img src="img/sukk.jpg" class="img-responsive person">
                                                    <p>
                                                        Sukankshi Jain
                                                    </p>
                                                    <p>Developer</p>
                                                </a>
                                            </div>



                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>


            <!-- container ends -->


            <script src="js/classie.js"></script>
            <script src="js/dialogFx.js"></script>

            <!--dialog box trigger-->

            <script>
                (function () {

                    var dlgtrigger = document.querySelector('[data-dialog]'),
                        somedialog = document.getElementById(dlgtrigger.getAttribute('data-dialog')),
                        dlg = new DialogFx(somedialog);

                    dlgtrigger.addEventListener('click', dlg.toggle.bind(dlg));

                })();
            </script>


        </div>
    </form>


</body>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>


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


<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script>
    // number of drops created.
    var nbDrop = 38;

    // function to generate a random number range.
    function randRange(minNum, maxNum) {
        return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
    }

    // function to generate drops
    function createRain() {

        for (i = 1; i < nbDrop; i++) {
            var dropLeft = randRange(0, 1400);
            var dropTop = randRange(-1000, 600);

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
