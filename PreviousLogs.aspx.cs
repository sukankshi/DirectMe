using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PreviousLogs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     //   Response.Redirect("leaders.html");
        if(Session["ttid"] == null)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            GridView_public_logs.DataSource = new ParkingLog().GetLogsPublic(Convert.ToInt32(Session["ttid"]));
            GridView_public_logs.DataBind();
            grid_previous.DataSource = new ParkingLog().GetLogs(Convert.ToInt32(Session["ttid"]));
            grid_previous.DataBind();
        }
    }

    protected void grid_previous_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_previous.PageIndex = e.NewPageIndex;
        grid_previous.DataBind();
    }
    protected void GridView_public_logs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView_public_logs.PageIndex = e.NewPageIndex;
        GridView_public_logs.DataBind();

    }
}