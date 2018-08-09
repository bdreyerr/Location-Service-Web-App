using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using REALWEBAPP.Models;

namespace REALWEBAPP
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {

            using (var db = new LocationServiceContainer())
            {

                if (db.People.Any())
                {
                }
                else
                {
                    var person1 = db.People.Create();
                    var location1 = db.Locations.Create();
                    var location2 = db.Locations.Create();
                    var address1 = db.Addresses.Create();
                    var address2 = db.Addresses.Create();

                    person1.FirstName = "Ben"; person1.LastName = "Dreyer"; person1.Location = location1;
                    location1.Name = "Convercent HQ";
                    location2.Name = "Russia";
                    address1.StNumber = "500"; address1.StName = "El Camino Real"; address1.City = "Denver"; address1.State = "CO"; address1.Locations.Add(location1); address1.Locations.Add(location2);
                    address2.StNumber = "123"; address2.StName = "Scoop St"; address2.City = "Santa Clara"; address2.State = "CA";

                    db.People.Add(person1);
                    db.Locations.Add(location1);
                    db.Locations.Add(location2);
                    db.Addresses.Add(address1);
                    db.Addresses.Add(address2);
                    location1.Addresses.Add(address1); //location1.Addresses.Add(address2);
                    db.SaveChanges();
                }
                
            }
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
