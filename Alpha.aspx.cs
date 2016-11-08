using PARK;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Alpha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("leaders.html");
        if (Convert.ToInt32(Session["Admin"]) != 1)
        {
            Response.Redirect("index.aspx");

        }
        else
        {
            Connect connect01 = new Connect();
            Connect.ConnectPark();
            string select01 = "select user.ttid,username,garage.hits,garage.car_id,parking_log.timestamp from parking_log inner join parking on parking_log.parking_owner_id = parking.Id inner join garage on garage.parking_id = parking_log.parking_owner_id inner join user on user.ttid = parking_log.user_id where parking_log.is_successful =2 and parking.private = 0";    // Pick up ids of public parking
            connect01 = new Connect(select01);
            grid_public.DataSource = connect01.ds;
            grid_public.DataBind();

        }

    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        string path = FileUpload();
        Cars tempCar = new Cars();

        tempCar.carname = txtbox_name.Text;
        tempCar.cost = Convert.ToInt32(txtbox_cost.Text);
        tempCar.base_revenue = Convert.ToInt32(txtbox_baserev.Text);
        tempCar.car_icon = path;

        Admin tempAdmin = new Admin();
        tempAdmin.CarGen(tempCar);


    }



    public string FileUpload()
    {
        string str = string.Empty;
        if (FileUploadControl.HasFile)
        {
            try
            {
                if (FileUploadControl.PostedFile.ContentType == "image/png")
                {

                    string filename = Path.GetFileName(FileUploadControl.FileName);
                    FileUploadControl.SaveAs(Server.MapPath("~/images/") + filename);
                    StatusLabel.Text = "Upload status: File uploaded!";
                    str = Server.MapPath("~/images/") + filename;

                }
                else
                    StatusLabel.Text = "Upload status: Only JPEG files are accepted!";

            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
        return str;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Admin a = new Admin();
        int x = Convert.ToInt32(txtbox_parking.Text);
        a.Parking_Gen(x);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        Admin a = new Admin();
        a.Send_Bot();
    }

    protected void grid_notificationPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_public.PageIndex = e.NewPageIndex;
        grid_public.DataBind();
    }
}