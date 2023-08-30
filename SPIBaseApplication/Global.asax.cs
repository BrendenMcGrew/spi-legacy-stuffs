using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SPIBase.Services;
using System.Web.Optimization;
using System.Web.Routing;

namespace SPIBase
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Hooks up the Bootstrapper which is the file that initializes the Unity container and Dependency Resolver.
            Bootstrapper.Initialise();
        }
    }
}
