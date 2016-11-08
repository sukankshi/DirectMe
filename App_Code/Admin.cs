using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using PARK;
using System.Data;
using Park;

/// <summary>
/// Summary description for Admin
/// </summary>
public class Admin
{

    public Admin()
    {
        
    }

    public void CarGen(Cars c)
    {

        Connect connect;
        Connect.ConnectPark();
        string insert = "INSERT INTO car(name,value,base_revenue,car_icon) values(@name,@cost,@base_revenue,@car_icon)";
        string[] s = { "@name", "@cost", "@base_revenue", "@car_icon"};
        connect = new Connect(insert, s, c.carname, c.cost, c.base_revenue, c.car_icon);

    }

    public void Parking_Gen(int x)
    {
        int i = 0;
        Connect connect;
        Connect.ConnectPark();
        string insert = "INSERT INTO parking(private,sector_id,allowed) values(0,@sector,0)";
        string[] s = { "@sector" };

        for (i = 0; i < x; i++)
        {
            connect = new Connect(insert, s, 1);
        }
        for (i = 0; i < x; i++)
        {
            connect = new Connect(insert, s, 2);
        }
        for (i = 0; i < x; i++)
        {
            connect = new Connect(insert, s, 3);
        }
        for (i = 0; i < x; i++)
        {
            connect = new Connect(insert, s, 4);
        }
    }

    /// <summary>
    /// Bot removes all cars from public lanes and fines user
    /// If bots hits car for more than 3 times, it gets confesticated
    /// </summary>
    /// 
    public void Send_Bot()   //Testing Remaining
    {

       

        Connect connect01 = new Connect();
        Connect.ConnectPark();
        string select01 = "select parking_log.user_id,parking_log.id,parking_log.parking_owner_id,garage.hits,garage.car_id,parking_log.timestamp from parking_log inner join parking on parking_log.parking_owner_id = parking.Id inner join garage on garage.parking_id = parking_log.parking_owner_id where parking_log.is_successful =2 and parking.private = 0";    // Pick up ids of public parking
        connect01 = new Connect(select01);
        int hits = 0, car_id = 0, user_id = 0;
        foreach (DataRow row in connect01.ds.Tables[0].Rows)
        {
            user_id = Convert.ToInt32(row[0]);

            //user_id == 1165 || user_id == 1017 || user_id==1038 || user_id == 1447 || user_id == 1249
            if (true)
            {
                int parking_id = Convert.ToInt32(row[2]);
                hits = Convert.ToInt32(row[3]);
                car_id = Convert.ToInt32(row[4]);


                int logid = Convert.ToInt32(row[1]);


                if (hits < 2)                                                                     // If hits is less than 2
                {

                    User u = new User();
                    int fine = Convert.ToInt32((u.GetRevenueFromPublicLanes(user_id, parking_id)) * 0.07);
                    new User().UpdateCash(user_id, new User().GetCashWithUser(user_id) - fine);   // Generate fine
                    Connect connect2 = new Connect();
                    string update = "UPDATE garage SET parking_id=0, hits=@hits WHERE parking_id=@parking_id";
                    string[] s2 = { "@hits", "@parking_id" };
                    connect2 = new Connect(update, s2, (hits + 1), parking_id);

                    Connect connect4 = new Connect();
                    string insert = "update parking_log set is_successful = 0 where id = @id";
                    string[] s4 = { "@id" };
                    connect4 = new Connect(insert, s4, logid);

                    new Parking().ChangeLaneStatusToVacant(parking_id);

                    string q = "insert into fine_log(id,fine) values(@logid,@fine)";
                    string[] param = { "@logid", "@fine" };
                    Connect connect = new Connect(q, param, logid, fine);

                    new Parking().ChangeLaneStatusToVacant(parking_id);
                    string message = "Sorry!! You have been unlucky...The cop has caught you this time.Under his rage your " + new Cars().GetCarNameById(car_id) + " has been fined with Rs." + fine.ToString() + ".Keep playing !!";
                    Notification n = new Notification();
                    n.Message = message;
                    n.UserId = user_id;
                    n.CreateNotification(n);

                }

                else
                {

                    User u = new User();
                    int fine = Convert.ToInt32((u.GetRevenueFromPublicLanes(user_id, parking_id)) * 0.30);
                    new Parking().ChangeLaneStatusToVacant(parking_id);// Generate fine
                    new User().UpdateCash(user_id, new User().GetCashWithUser(user_id) - fine);
                    Connect connect2 = new Connect();
                    string update = "UPDATE garage SET parking_id=0, hits=@hits, status=@status WHERE parking_id=@parking_id";
                    string[] s2 = { "@hits", "@status", "@parking_id" };
                    connect2 = new Connect(update, s2, (hits + 1), 2, parking_id);              // Set status = 2 (confesticated)


                    Connect connect4 = new Connect();
                    string insert = "update parking_log set is_successful = 0 where id = @id";
                    string[] s4 = { "@id" };
                    connect4 = new Connect(insert, s4, logid);

                    new Parking().ChangeLaneStatusToVacant(parking_id);

                    string q = "insert into fine_log(id,fine) values(@logid,@fine)";
                    string[] param = { "@logid", "@fine" };
                    Connect connect = new Connect(q, param, logid, fine);

                    //User u1 = new User();
                    //int status= u1.Restart(user_id);
                    string message = "Sorry!! You have been unlucky...The cop has caught you for the third time.Under his rage your " + new Cars().GetCarNameById(car_id) + " has been confesticated. Keep playing and earn for the next car.";
                    Notification n = new Notification();
                    n.Message = message;
                    n.UserId = user_id;
                    n.CreateNotification(n);



                }
                if (hits == 2)
                {
                    string message = "Watch it!! This is the second time you have been caught by the  Police bots. Next time you park it will be confesticated. Play smart!!";
                    Notification n = new Notification();
                    n.Message = message;
                    n.UserId = user_id;
                    n.CreateNotification(n);
                }
            }
        }
    }
}