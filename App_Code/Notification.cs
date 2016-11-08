using PARK;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Notification
/// </summary>
/// 
namespace Park
{
    public class Notification
    {

        public string Message { get; set; }
        public int MessageId { get; set; }
        public int UserId { get; set; }

        public Notification()
        {

        }

        public void CreateNotification(Notification notification)
        {
            Connect.ConnectPark();
            string q = "insert into notification(userid,notification,timestamp) values(@userid,@notification,now())";
            string[] param = { "@userid", "@notification" };
            Connect con = new Connect(q, param, notification.UserId, notification.Message);
        }

        public List<Notification> GetNotification(int userid)
        {
            Connect.ConnectPark();
            string q = "select * from notification where userid = @userid ORDER BY TIMESTAMP DESC";
            string[] param = { "@userid" };
            Connect con = new Connect(q, param, userid);
            List<Notification> lst = new List<Notification>();
            int index = 0;
            foreach (DataRow row in con.ds.Tables[0].Rows)
            {
                Notification i = new Notification();
                i.Message = row[2].ToString();
                i.MessageId = index + 1;
                lst.Add(i);
                index++;
            }
            return lst;
        }
    }
}