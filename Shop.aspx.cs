using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Response.Redirect("leaders.html");
        if (Session["ttid"] != null)
        {
            Bind();
        }
        else
        {
            Response.Redirect("index.aspx");
        }
        new User().CheckUsers();
    }



    protected void buy_Click(object sender, EventArgs e)
    {
        if (Session["ttid"] != null)
        {
            int ttid = Convert.ToInt32(Session["ttid"]);
            int cashwithuser = new User().GetCashWithUser(ttid);
            int carid = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            int carcost = new Cars().GetCarCost(carid);
            if (cashwithuser < carcost)
            {
              //  lbl_msg.Visible = true;
               // lbl_msg.Text =new Cars().GetCarNameById(carid) + ": Not enough cash";
               // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#car_buy_fail').modal('show');</script>", false);
               ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('OOPS! You have insufficient money.');", true);
              
                /// show the error message

            }
            else
            {
                if (new Cars().GetCarsCountOwnedByUser(Convert.ToInt32(Session["ttid"])) != 5)
                {
                    //buys the car
                    int cashdiff = cashwithuser - carcost;
                    new User().UpdateCash(ttid, cashdiff);
                    new User().BuyCar(ttid, carid);

                    Bind();
                    //  lbl_msg.Text = new Cars().GetCarNameById(carid) +": Bought";
                    //  lbl_msg.Visible = true;
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#car_confirm').modal('show');</script>", false);
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Congratulations! You just bought a new car.');", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Max car limit reached.You cannot buy more than 5 cars.');", true);
                }
            }
            
        }
    }

    public void Bind()
    {
        List<Cars> carsownedbyuser = new Cars().GetCarsOwnedByUser(Convert.ToInt32(Session["ttid"]));
        
        d.DataSource = new Cars().GetALl().Where(i => !carsownedbyuser.Any(p => i.carId == p.carId));
        d.DataBind();
        a.DataSource = new Cars().GetALl().Where(i => !carsownedbyuser.Any(p => i.carId == p.carId));
        a.DataBind();
    }
}