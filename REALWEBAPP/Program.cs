using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using REALWEBAPP.Models;

namespace REALWEBAPP
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("test");
            using (var db = new LocationServiceContainer())
            {
                var person1 = db.People.Create();
                var location1 = db.Locations.Create();
                var address1 = db.Addresses.Create();

                person1.FirstName = "Ben"; person1.LastName = "Dreyer"; person1.Location = location1;
                location1.Name = "Convercent HQ"; location1.Addresses.Add(address1);
                address1.StNumber = "500";address1.StName = "El Camino Real";address1.City = "Denver";address1.State = "CO";address1.Locations.Add(location1);

                db.People.Add(person1);
                db.Locations.Add(location1);
                db.Addresses.Add(address1);
                db.SaveChanges();
            }
        }
    }
}