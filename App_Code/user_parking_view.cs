using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using PARK;
using System.Configuration;


public class user_parking_view
{
   
   public int parking_id { get; set; }
   public string username { get; set; }
   public int index { get; set; }
   public int userid { get; set; }
   public int carid { get; set; }
   
    public List<user_parking_view> GetUsersOnMyParking(int id)
    {
        Connect connect;
        Connect.ConnectPark();
        string q = "select user_parking.parking_id,garage.user_id,user.username from user_parking inner join garage on garage.parking_id = user_parking.parking_id inner join user on user.ttid = garage.user_id where user_parking.user_id = @id";
        string[] s2 = { "@id" };
        connect = new Connect(q, s2, id);
        
        List<user_parking_view> lst_user = new List<user_parking_view>();
        index = 0;
        foreach (DataRow row in connect.ds.Tables[0].Rows)
        {
            
                 user_parking_view user = new user_parking_view();
                user.userid = Convert.ToInt32(row[1]);
                user.username = row[2].ToString();
                user.parking_id = Convert.ToInt32(row[0]);
               // user.index = index;
                lst_user.Add(user);
           
        }
        
        return lst_user;
    }
    public List<user_parking_view> MyCarsParked(int ttid)
    {
        Connect connect;
        Connect.ConnectPark();
        string q = "Select garage.parking_id,garage.car_id,garage.user_id,parking.private from garage inner join parking on garage.parking_id = parking.id  where garage.user_id=@id && status=0 && garage.parking_id !=0";
            string[] s2 = { "@id" };
            connect = new Connect(q, s2, ttid);
            List<user_parking_view> lst_user = new List<user_parking_view>();

            foreach (DataRow row in connect.ds.Tables[0].Rows)
            {

                user_parking_view user = new user_parking_view();
                //int parkingid =
                user.parking_id = Convert.ToInt32(row["parking_id"]);
             //   user.userid = Convert.ToInt32(row[3]);
                user.carid = Convert.ToInt32(row[1]);
               // user.username = row[1].ToString();
                bool public1 = Convert.ToBoolean(row[3]);

                if (public1 == false)
                {
                    user.username = "Public lane";
                }
                else
                {
                    string insert4 = "Select user_id from user_parking where parking_id=@p_id";
                    string[] s4 = { "@p_id" };
                    connect = new Connect(insert4, s4, user.parking_id);
                    if (connect.ds.Tables[0].Rows.Count > 0)
                    {
                        user.userid = Convert.ToInt32(connect.ds.Tables[0].Rows[0][0]);
                    }
                    user.username = new User().getName(user.userid);

                } lst_user.Add(user);

            }

return lst_user;
    }
    //public void RemoveParkedCar(int ttid, int carid)
    //{
    //    Connect connect;
    //    Connect.ConnectPark();
        
    //    string q1 = "Select parking_id from garage where user_id=@u_id && car_id=@carid && status=0";
    //    string[] s1 = { "@u_id", "@carid" };
    //    connect = new Connect(q1, s1, ttid, carid);
    //    int parking_id = Convert.ToInt32(connect.ds.Tables[0].Rows[0][0]);
    //    User u = new User();
    //    int revenue=u.GetRevenueFromPrivateLanes(ttid, parking_id);
    //    string q = "update user set cash=cash+@rev where ttid=@ttid";
    //    string[] s2 = {"@rev","@ttid" };
    //    connect = new Connect(q,s2,revenue,ttid);
    //    string query = "Update garage set parking_id=0 where user_id=@u_id && car_id=@carid && status=0";
    //    string[] s = {"@u_id","@carid"};
    //    connect = new Connect(query, s, ttid, carid);
       
    //}
}