using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using SPIBase.Models;
using SPIBase.Services;
using System;
using System.Security.Claims;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace SPIBase.Controllers
{
    [AllowAnonymous]
    public class UserController : Controller
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        public ActionResult Login()
        {
            return View();
        }

        /// <summary>
        /// Automatically called when user clicks the "Login with CAC" button.
        /// </summary>
        public ActionResult StartAuthenticate()
        {
            return Authenticate(new HttpClientCertificateBase(Request.ClientCertificate));
        }

        public ActionResult Authenticate(HttpClientCertificateBase cert)
        {
            if (!IsValidCertificate(cert))
            {
                return RedirectToAction("Unauthorized");
            }

            // Extract common name (CN) from the certificate's Subject value (there is a better way to do this than below).
            // Ex: DOE.JOHN.MICHAEL.1234567890
            string[] subjectArray = cert.Subject.Split(',');
            string cn = subjectArray[5];
            string[] cnArray = cn.Split('.');

            // Get user information by 10-digit CAC identifier from database.
            User usr = _userService.GetUserByCacId((cnArray.Length == 4) ? cnArray[3] : null);

            if (usr == null)
            {
                return RedirectToAction("Unauthorized");
            }

            // user is valid -- use 10-digit CAC identifier as the user's claim, authenticate user to the application, and redirect user to the Home page.
            var ident = new ClaimsIdentity(
                new[]
                {
                    new Claim("Identifier", cnArray[3]),
                    new Claim(ClaimTypes.Name, String.Format("{0} {1}", cnArray[1], cnArray[0]))
                },
                DefaultAuthenticationTypes.ApplicationCookie);

            HttpContext?.GetOwinContext().Authentication.SignIn(new AuthenticationProperties { IsPersistent = false }, ident);
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Unauthorized()
        {
            return View();
        }

        private bool IsValidCertificate(HttpClientCertificateBase cert)
        {
            return cert != null && IsValidIssuer(cert.Issuer) && IsValidSubject(cert.Subject);
        }

        private bool IsValidIssuer(string issuer)
        {
            string pattern = "^C=US, O=U.S. Government, OU=DoD, OU=PKI, CN=DOD EMAIL CA-\\d{2}$";
            return Regex.Match(issuer, pattern).Success;
        }

        private bool IsValidSubject(string subject)
        {
            string pattern = "^C=US, O=U.S. Government, OU=DoD, OU=PKI, OU=USAF, CN=(.+[^s]+)$";
            return Regex.Match(subject, pattern).Success;
        }
    }
}