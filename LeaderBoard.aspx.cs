using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LeaderBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

     //   Response.Redirect("leaders.html");
        //if (Session["ttid"] != null)
        //{
            grid_leaders.DataSource = new Leader().GetLeaders();
            grid_leaders.DataBind();
        //}
        //else
        //{
        //    Response.Redirect("index.aspx");
        //}
    }
    protected void grid_leaders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_leaders.PageIndex = e.NewPageIndex;
        grid_leaders.DataBind();
    }
}