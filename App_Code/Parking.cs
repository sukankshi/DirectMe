using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using PARK;
using System.Data;

public class Parking
{

    public int id { get; set; }               //Parking id( id of every parking space)
    public bool private_park { get; set; }    //if False public :: True private  
    public int sector_id { get; set; }
    public bool allowed { get; set; }
    public bool isvacant { get; set; }
    public string UserName { get; set; }
    //if False non-parking :: True parking

    //public Parking()
    //{
    //    private_park = false;
    //    sector_id = 0;
    //    allowed = false;
    //}


    public int ParkOnPublicLane(int parkingid, int ttid, int carid)
    {
        Connect connect;
        Connect.ConnectPark();
        ChangeLaneStatusToOccupied(parkingid);
        string insert_1 = "update garage set parking_id=@parkingid,time_stamp=@time where car_id=@carid && user_id=@tid && status=0";
        string[] s1 = { "@carid", "@tid", "@parkingid", "@time" };
        connect = new Connect(insert_1, s1, carid, ttid, parkingid, DateTime.Now);

        string insert = "INSERT into parking_log (user_id, parking_owner_id,timestamp, is_successful ) values(@user_id,@parking_owner_id,@time_stamp,@is_successful)";
        string[] s5 = { "@user_id", "@parking_owner_id", "@time_stamp", "@is_successful" };
        connect = new Connect(insert, s5, ttid, parkingid, (DateTime.Now), 2);
        return connect.lastId;// parking_owner_id=0(public lane), is_successful=0(unsuccessful parking)


    }

    public int ParkOnPrivateLane(int ttid, int oponentparkingid, int carid)
    {
        Connect connect;
        Connect.ConnectPark();
        //string insert = "Select parking_id from user_parking where user_id=@id";
        //string[] s = { "@id" };
        //connect = new Connect(insert, s, ownerid);
        //int parkingid = Convert.ToInt32(connect.ds.Tables[0].Rows[0][0]);
        // int parkid = parkingid + lanevalue - 1;
        //string s2 = "Select count(parking_id) from garage where parking_id=@p_id";
        //string[] q = { "@p_id" };
        //connect = new Connect(s2, q, parkid);
        //int id = Convert.ToInt32(connect.executescalar());

        string insert_1 = "update garage set parking_id=@parkingid,time_stamp=@time where car_id=@carid && user_id=@tid && status=0";
        string[] s1 = { "@carid", "@tid", "@parkingid", "@time" };
        connect = new Connect(insert_1, s1, carid, ttid, oponentparkingid, DateTime.Now);
        ChangeLaneStatusToOccupied(oponentparkingid);

        string insert = "INSERT into parking_log (user_id, parking_owner_id,timestamp, is_successful ) values(@user_id,@parking_owner_id,@time_stamp,@is_successful)";
        string[] s5 = { "@user_id", "@parking_owner_id", "@time_stamp", "@is_successful" };
        connect = new Connect(insert, s5, ttid, oponentparkingid, (DateTime.Now), 2);    // parking_owner_id=0(public lane), is_successful=0(unsuccessful parking)
        return connect.lastId;

    }

    public void ChangeLaneStatusToOccupied(int laneid)
    {
        string q = "update parking set isvacant = 0 where Id = " + laneid.ToString();
        Connect c = new Connect(q);
    }

    public void ChangeLaneStatusToVacant(int laneid)
    {
        string q = "update parking set isvacant = 1 where Id = " + laneid.ToString();
        Connect c = new Connect(q);
    }

    public bool IsAllowed(int ownerparkingid, int ttid)              //last two checks for parking
    {

        Connect connect;
        Connect.ConnectPark();
        string query = "SELECT * from parking_log inner join user_parking on parking_log.parking_owner_id = user_parking.parking_id WHERE parking_log.user_id=@user_id && (is_successful=1 or is_successful =2)  order by timestamp desc limit 25";
        string[] s = { "@user_id" };
        connect = new Connect(query, s, ttid);
        int countrows = connect.ds.Tables[0].Rows.Count;
        if (countrows == 0)
        {
            return true;
        }
        else
        {
            int ownerttid = GetOwnerTTIDByParkingId(ownerparkingid);
            foreach (DataRow row in connect.ds.Tables[0].Rows)
            {
                int check = Convert.ToInt32(row[5]);

                if (ownerttid == check)
                {
                    return false;   //Happens if car was parked there... Loop breaks as use of return
                }

            }
            return true;

        }

    }

    private int GetOwnerTTIDByParkingId(int ownerparkingid)
    {
        string query = "SELECT user_id FROM user_parking where parking_id=@parkingId";
        string[] s = { "@parkingId" };
        Connect con = new Connect(query, s, ownerparkingid);
        return int.Parse(con.ds.Tables[0].Rows[0][0].ToString());
    }


    public bool IsParkingAllowed(int parkingid)
    {
        string q = "Select allowed from parking where id =" + parkingid.ToString();
        Connect connect = new Connect(q);
        return Convert.ToBoolean(connect.ds.Tables[0].Rows[0][0]);
    }

    public List<Parking> GetPublicParking(int sectorid)
    {
        Connect connect;
        Connect.ConnectPark();
        string q = "SELECT * FROM parking where private = 0 and sector_id = @sectorid";
        string[] s = { "@sectorid" };
        connect = new Connect(q, s, sectorid);
        List<Parking> lst_id = new List<Parking>();
        foreach (DataRow row in connect.ds.Tables[0].Rows)
        {
            Parking p = new Parking();
            p.allowed = Convert.ToBoolean(int.Parse(row[3].ToString()));
            p.isvacant = Convert.ToBoolean(int.Parse(row[4].ToString()));
            p.id = int.Parse(row[0].ToString());
            p.sector_id = sectorid;
            lst_id.Add(p);
        }
        return lst_id;

    }
    public List<Parking> GetPrivateParking(int sectorid, int ttid)
    {
        Connect connect;
        Connect.ConnectPark();
        string q = "SELECT id,private,parking.sector_id,allowed,isvacant,username FROM parking inner join user_parking on parking.Id = user_parking.parking_id inner join user on user_parking.user_id = user.ttid where isvacant = 1 and private = 1 and parking.sector_id =" + sectorid.ToString() + " and user.ttid !=" + ttid.ToString();

        connect = new Connect(q);
        List<Parking> lst_id = new List<Parking>();
        foreach (DataRow row in connect.ds.Tables[0].Rows)
        {
            Parking p = new Parking();
            p.allowed = Convert.ToBoolean(int.Parse(row[3].ToString()));
            p.isvacant = Convert.ToBoolean(int.Parse(row[4].ToString()));
            p.id = int.Parse(row[0].ToString());
            p.sector_id = sectorid;
            p.UserName = row[5].ToString();
            lst_id.Add(p);
        }
        return lst_id;

    }



    /// <summary>
    ///  Assigns parking lot for a new user, from which 3 are non-parking and 2 of them are parking. The table 'parking' is populated
    ///  Also the table with user-parking mapping is populated, which helds parking ids for a given user
    /// </summary>
    /// <param name="ttid">TT id of player, passed from session</param>
    /// <param name="selected_sector">Gives value of sector selected(1-A,2-B..).</param>
    /// 

    public void AssignParking(int ttid, int selected_sector)
    {

        for (int i = 1; i <= 5; i++)
        {


            Connect connect;
            Connect.ConnectPark();

            if (i % 2 == 0)   //parking lanes
            {
                string insert = "INSERT into parking (private,sector_id,allowed) VALUES (1,@sector_id,1)";
                string[] s = { "@sector_id" };
                connect = new Connect(insert, s, selected_sector);
                int id = connect.lastId;
                string insert_1 = "INSERT into user_parking (user_id,parking_id)  VALUES (@user,@id)";
                string[] s1 = { "@user", "@id" };
                connect = new Connect(insert_1, s1, ttid, id);

            }
            else             //non-parking lanes
            {
                string insert = "INSERT into parking (private,sector_id,allowed) VALUES (1,@sector_id,0)";
                string[] s = { "@sector_id" };
                connect = new Connect(insert, s, selected_sector);
                int id = connect.lastId;
                string insert_1 = "INSERT into user_parking (user_id,parking_id)  VALUES (@user,@id)";
                string[] s1 = { "@user", "@id" };
                connect = new Connect(insert_1, s1, ttid, id);

            }
        }

    }

    public bool IsParkingVacant(int id)
    {
        string q = "SELECT isvacant FROM parking where id =" + id.ToString();
        Connect c = new Connect(q);
        return Convert.ToBoolean(c.ds.Tables[0].Rows[0][0]);
    }
}


