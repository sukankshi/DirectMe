using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCars : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Response.Redirect("leaders.html");
        if (Session["ttid"] != null)
        {
            if (!Page.IsPostBack)
            {
                if (new Cars().GetCarsCountOwnedByUser(Convert.ToInt32(Session["ttid"])) == 0)
                {
                    Response.Redirect("nocar.aspx");
                }
                else
                {
                    var i = new Cars().GetCarsOwnedByUser(Convert.ToInt32(Session["ttid"]));
                    d.DataSource = i;
                    d.DataBind();
                    a.DataSource = i;
                    a.DataBind();
                }
            }
        }
        else
            Response.Redirect("index.aspx");
    }

    protected bool GetCarStatus(int carid, int ttid)
    {
        bool value = new Cars().IsCarAvailableForParking(carid, ttid);
        Session["value"] = value;
        return value;
    }

    protected void btn_choose_Click(object sender, EventArgs e)
    {
         int id = Convert.ToInt32(((LinkButton)sender).CommandArgument);
        Session["carid"] = id;
        Response.Redirect("opponentsector.aspx");
    
    }

    protected void btn_sell_Click(object sender, EventArgs e)
    {

        int id = Convert.ToInt32(((LinkButton)sender).CommandArgument);
        Session["caridforselling"] = id;
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#sell_car').modal('show');</script>", false);

        //
   
    }


    protected void Unnamed_Click(object sender, EventArgs e)
    {

        int id = Convert.ToInt32(Session["caridforselling"]);
        new Cars().Sell(id, Convert.ToInt32(Session["ttid"]));
        //var i = new Cars().GetCarsOwnedByUser(Convert.ToInt32(Session["ttid"]));
        Session.Remove("caridforselling");
        Response.Redirect("Cars.aspx");

        
    }
}