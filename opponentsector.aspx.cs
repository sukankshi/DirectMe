using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class oponentsector : System.Web.UI.Page
{
   protected void Page_Load(object sender, EventArgs e)
    {
       // Response.Redirect("leaders.html");
        if (Session["ttid"] != null)
        {
            if(Session["carid"] == null)
            {
                Response.Redirect("garage.aspx");
            }
            //
        }
       else
            Response.Redirect("index.aspx");

        new User().CheckUsers();
      
    }
   protected void Unnamed_Click(object sender, EventArgs e)
   {
       if (Session["ttid"] != null)
       {
           int ttid = Convert.ToInt32(Session["ttid"]);
           int i = Convert.ToInt16(hidden_server.Value);

           if (ValidateSectorId())
           {
               Session["oponent"] = i;
               Response.Redirect("park.aspx");
           }
           else
           {
               // user have changed the html. so show the error
               Response.Write("<script>alert('Invalid')</script>");

           }
       }
       else
       {
           Response.Redirect("index.aspx");
       }
   }
  

  

  

   protected bool ValidateSectorId()
   {
       int i = Convert.ToInt16(hidden_server.Value);

       if (i > 0 && i < 5)
       {
           return true;
       }
       else
           return false;
   }

   protected void lnk_click_Click(object sender, EventArgs e)
   {
       int ttid = Convert.ToInt32(Session["ttid"]);
       int i = Convert.ToInt16(((LinkButton)sender).CommandArgument);
       Session["oponent"] = i;
       Response.Redirect("park.aspx");
   }
}