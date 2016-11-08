using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Notification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Response.Redirect("leaders.html");
        if (Session["ttid"] != null)
        {
            grid_previous.DataSource = new Park.Notification().GetNotification(Convert.ToInt32(Session["ttid"]));
            grid_previous.DataBind();
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    protected void grid_notificationPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_previous.PageIndex = e.NewPageIndex;
        grid_previous.DataBind();
    }
}