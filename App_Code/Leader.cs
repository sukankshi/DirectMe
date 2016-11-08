using PARK;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Leader
/// </summary>
public class Leader
{
   
        public string Name { get; set; }
        public int Cash { get; set; }
        public int NetWorth { get; set; }
    
    public List<Leader> GetLeaders()
    {

        Connect connect;
        Connect.ConnectPark();
        string s = "select username,cash,ttid from user order by cast(cash as unsigned) desc";
        connect = new Connect(s);
        
        List<Leader> lst_leader = new List<Leader>();
        foreach (DataRow row in connect.ds.Tables[0].Rows)
        {
            int ttid = Convert.ToInt32(row[2]);
            Leader l = new Leader();
            l.Name = row[0].ToString();
            l.Cash = Convert.ToInt32(row[1]);
            l.NetWorth = new Cars().GetCarsOwnedByUser(ttid).Sum(i => i.cost) + l.Cash;

            lst_leader.Add(l);
        }
        return lst_leader.OrderByDescending(m => m.NetWorth ).ToList();

    }
}