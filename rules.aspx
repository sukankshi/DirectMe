<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rules.aspx.cs" Inherits="rules" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <title>Direct Me | Techtrishna 2015 | Ajay Kumar Garg Engineering College</title>
    <style type="text/css">
        body {
            padding: 30px;
            color: #9f1a1a;
            background-image: url("images/directMe.jpg");
            color: darkgreen;
            background-repeat: repeat;
            background-size: cover;
        }

        .container {
        }

        h1 {
            font-size: 36px;
        }

        h1, h3 {
            font-family: 'Segoe UI';
            font-weight: 600;
        }

        #rulesDefine {
            text-align: justify;
            font-family: 'Segoe UI';
            font-size: 18px;
            margin-top: 20px;
        }

        b {
            font-size: 24px;
            font-weight: 400;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
         <h1>Rules</h1>
            <hr style="border-color:black;"/>
        <div class="row">
    <div id="rulesDefine" class="col-md-12" >
<b>1.</b>   Initialy user need to select a sector to reside in, which can't be changed later .<br /><br />
<b>2.</b>   Each player will be given a parking lane comprising of 3 non-parking and 2 parking spots.<br /><br />
<b>3.</b>   There are 10 public lanes in each sector.<br /><br />
<b>4.</b> 	Player can only park in other users’ lanes and public lanes.<br /><br />
<b>5.</b> 	Parking spots are secure but generate lesser revenue than non-parking spots.<br /><br />
<b>6.</b> 	Public lanes are most rewarding but have a risk of Police.<br /><br />
<b>7.</b> 	Users need to park atleast for 15 minutes to get handsome amount of revenue.<br /><br />
<b>8.</b> 	After completion of 30 minutes parked car automaticaly comes back to garage but user can move their car back anytime before completion of the same.<br /><br />
<b>9.</b>   The parking owner can fine you if you are on his no parking zone.<br /><br />
<b>10.</b>   On being fined, the car is returned back to the garage automatically and all the revenue generated during that period will be given to the parking holder along with propotionate amount of deduction from car-owner's cash.<br /><br />
<b>11.</b>   Your cars will get confiscated after receiving 3 non-parking stamps from the Police.<br /><br />
<b>12.</b>   The more you earn, the better vehicle you can buy.<br /><br />
<b>13.</b>   The car with higher cost has a higher revenue-rate.<br /><br />
<b>14.</b>   User can park more than 1 car at a time.<br /><br />
<b>15.</b> You need to have at least <strong>22</strong> successful parking before parking on the same user's lane again. <br /><br />
<b>16.</b>   A player can have at most 5 cars.<br /><br />
<b>17.</b>   Cars can be sold at half the cost price.<br /><br />
<b>18.</b> 	Any hacking, illegal activity caught for destroying the integrity of the game will lead to prohibition of the player from the game.<br /><br />
<b>19.</b> 	The one having maximum net-worth i.e. cash+worth of cars owned by user by the end of Techtrishna 2015 will be declared the winner.<br /><br />
    </div>
            <br />
            <br />
            <br />
   
                        </center>
        </div>
    </form>
</body>
</html>
