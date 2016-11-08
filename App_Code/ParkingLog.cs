using PARK;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ParkingLog
/// </summary>
public class ParkingLog
{
    public string UserName { get; set; }
    public string ParkedOn { get; set; }
    public DateTime ParkingDate { get; set; }
    public string IsSuccess { get; set; }
    public int Revenue { get; set; }
    public int Fine { get; set; }


    public List<ParkingLog> GetLogs(int ttid)
    {
        string q = "select timestamp,is_successful,allowed,username,parking_log.id from parking_log  inner join parking on parking_owner_id = parking.Id inner join user_parking on parking_log.parking_owner_id = user_parking.parking_id inner join user on user_parking.user_id = user.ttid  where parking_log.user_id = @ttid";
        string[] s = { "@ttid" };
        Connect c = new Connect(q, s, ttid);
        List<ParkingLog> lst = new List<ParkingLog>();
        foreach (DataRow row in c.ds.Tables[0].Rows)
        {
            int logid = Convert.ToInt32(row[4]);
            ParkingLog p = new ParkingLog();
            p.Fine = GetFine(logid);
            p.Revenue = GetRevenue(logid);
            p.ParkingDate = Convert.ToDateTime(row[0]);
            if (int.Parse(row[1].ToString()) == 0)
            {
                p.IsSuccess = "Unsuccessful";

            }
            else if (int.Parse(row[1].ToString()) == 1)
            {
                p.IsSuccess = "Successful";
            }
            else
            {
                p.IsSuccess = "Pending";
            } //p.IsSuccess = int.Parse(row[4].ToString()) == 0 ? "Unsuccessfull" : "Successfull";

           // p.IsSuccess = int.Parse(row[1].ToString()) == 0 ? "Unsuccessfull" : "Successfull";
            p.UserName = row[3].ToString();

            if (row[2].ToString() == "1")
            {
                p.ParkedOn = "Parking Zone";
            }
            else
                p.ParkedOn = "Non Parking Zone";
            lst.Add(p);
        }
        return lst.OrderByDescending(m=>m.ParkingDate).ToList();
    }

    public int GetFine(int logid)
    {
        string q = "Select fine from fine_log where id = " + logid.ToString();
        Connect c = new Connect(q);
        if (c.ds.Tables[0].Rows.Count > 0)
            return Int32.Parse(c.ds.Tables[0].Rows[0][0].ToString());
        else
            return 0;
    }

    public int GetRevenue(int logid)
    {
        string q = "Select revenue from revenuelog where logid = " + logid.ToString();
        Connect c = new Connect(q);
        if (c.ds.Tables[0].Rows.Count > 0)
            return Int32.Parse(c.ds.Tables[0].Rows[0][0].ToString());
        else
            return 0;
    }

    public List<ParkingLog> GetLogsPublic(int ttid)
    {
        string q = "select * from parking_log inner join parking on parking_owner_id = parking.Id where private = 0 and user_id = @ttid";
        string[] s = { "@ttid" };
        Connect c = new Connect(q, s, ttid);
        List<ParkingLog> lst = new List<ParkingLog>();
        foreach (DataRow row in c.ds.Tables[0].Rows)
        {
            int logid = Convert.ToInt32(row[3]);
            ParkingLog p = new ParkingLog();
            p.Fine = GetFine(logid);
            p.Revenue = GetRevenue(logid);
            p.ParkingDate = Convert.ToDateTime(row[2]);
            if (int.Parse(row[4].ToString()) == 0)
            {
                p.IsSuccess = "Unsuccessful";

            }
            else if (int.Parse(row[4].ToString()) == 1)
            {
                p.IsSuccess = "Successful";
            }
            else
            {
                p.IsSuccess = "Pending";
            } //p.IsSuccess = int.Parse(row[4].ToString()) == 0 ? "Unsuccessfull" : "Successfull";

            lst.Add(p);
        }
        return lst.OrderByDescending(m => m.ParkingDate).ToList(); 
    }

    //public List<user_parking_view> GetUsersOnMyParking(int id)
    //{
    //    Connect connect;
    //    Connect.ConnectPark();
    //    string q = "Select garage.parking_id,user.username,garage.car_id,garage.user_id from garage inner join user_parking on garage.parking_id = user_parking.parking_id inner join parking on user_parking.parking_id = parking.Id inner join user on garage.user_id = user.ttid  where garage.user_id=@ttid && status=0 && garage.parking_id !=0";
    //    string[] s2 = { "@id" };
    //    connect = new Connect(q, s2, id);

    //    List<user_parking_view> lst_user = new List<user_parking_view>();

    //    foreach (DataRow row in connect.ds.Tables[0].Rows)
    //    {

    //        user_parking_view user = new user_parking_view();
    //        //int parkingid =
    //        user.parking_id = Convert.ToInt32(row["parking_id"]);
    //        user.userid = Convert.ToInt32(row[3]);
    //        user.carid = Convert.ToInt32(row[2]);
    //        user.username = row[1].ToString();
    //        lst_user.Add(user);

    //    }

    //    return lst_user;
    //}
}