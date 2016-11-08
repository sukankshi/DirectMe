using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class garage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Response.Redirect("leaders.html");
        if (Session["ttid"] == null)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            if (!Page.IsPostBack)
            {
                Session.Remove("oponent");
                name.InnerText = new User().getName(Convert.ToInt32(Session["ttid"]));
                money.InnerText = money.InnerText + new User().GetCashWithUser(Convert.ToInt32(Session["ttid"]));
                Span1.InnerText = new User().getSector(Convert.ToInt32(Session["ttid"])).ToString();
                var u = new user_parking_view().MyCarsParked(Convert.ToInt32(Session["ttid"]));
                
               
                new User().CheckUsers();

            }



        }

    }

    protected bool GetStatusOfCar(int parkingid)
    {
        return new Parking().IsParkingAllowed(parkingid);
    }




    protected void Unnamed_Click1(object sender, EventArgs e)
    {

        int id = Convert.ToInt32(((Button)sender).CommandArgument);

        var lst = new user_parking_view().MyCarsParked(Convert.ToInt32(Session["ttid"]));
        if (lst.Count == 0) { return; }
        user_parking_view parking = lst.Find(m => m.carid == id);

        if (parking.username != "Public lane")
        {
            int logid = new User().RemoveParkedCar(Convert.ToInt32(Session["ttid"]), id);
        }
        else
        {
            new User().pick_from_public(Convert.ToInt32(Session["ttid"]), parking.parking_id);
        }

        money.InnerText = "";
        money.InnerText = money.InnerText + new User().GetCashWithUser(Convert.ToInt32(Session["ttid"]));
        grid_view_parked_cars.DataSource = new user_parking_view().MyCarsParked(Convert.ToInt32(Session["ttid"]));
        grid_view_parked_cars.DataBind();


    }

    protected void btn_fine_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(((ImageButton)sender).CommandArgument);

        var i = new user_parking_view().GetUsersOnMyParking(Convert.ToInt32(Session["ttid"]));

        var u = i.Find(l => l.parking_id == id);
        
        new fine().Finebyuser(Convert.ToInt32(Session["ttid"]), id, u.userid);
        money.InnerText = "";
        money.InnerText = money.InnerText + new User().GetCashWithUser(Convert.ToInt32(Session["ttid"]));
        GridView2.DataSource = new user_parking_view().GetUsersOnMyParking(Convert.ToInt32(Session["ttid"]));
        GridView2.DataBind();
    }





  
    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("index.aspx");
    }

    protected string GetCarName(int id)
    {
        return new Cars().GetCarNameById(id);
    }
    protected void Unnamed_Click3(object sender, EventArgs e)
    {
        GridView2.DataSource = new user_parking_view().GetUsersOnMyParking(Convert.ToInt32(Session["ttid"]));
        GridView2.DataBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#UsersParked').modal('show');</script>", false);

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        grid_view_parked_cars.DataSource = new user_parking_view().MyCarsParked(Convert.ToInt32(Session["ttid"]));
        grid_view_parked_cars.DataBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#ViewParkedCarsModal').modal('show');</script>", false);
    }
}