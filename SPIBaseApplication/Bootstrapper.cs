using Microsoft.Practices.Unity;
using System.Web.Mvc;
using Unity.Mvc3;
using SPIBase.Services;
using SPIBase.Controllers;

namespace SPIBase
{
    public static class Bootstrapper
    {
        public static void Initialise()
        {
            var container = BuildUnityContainer();

            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }

        private static IUnityContainer BuildUnityContainer()
        {
            var container = new UnityContainer();

            // Registers the User Controller and User Service.
            container.RegisterType<IUserService, UserService>();
            container.RegisterType<IController, UserController>("User");

            return container;
        }
    }
}