using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;


public partial class AdminMain : System.Web.UI.Page
{
    public string name, password;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("leaders.html");
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {

        name = TextBoxName.Text;
        password = TextBoxPassword.Text;

        if (name == "junejamudit" && password == "sirocks")
        {
            Session["Admin"] = 1;
            Response.Redirect("Alpha.aspx");
        }

        else
        {
            LabelMessage.Text = "Invalid username or password!!! ";
        }


    }
}