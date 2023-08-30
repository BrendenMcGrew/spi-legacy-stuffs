using Moq;
using NUnit.Framework;
using SPIBase.Controllers;
using System.Web.Mvc;
using SPIBase.Models;
using SPIBase.Services;

namespace SPIBaseApplication_Test
{
    [TestFixture]
    public class UserTest
    {
        [Test]
        public void Authenticate_NullAsParam_RedirectToUnauthorizedPage()
        {
            // Setup
            UserController userController = new UserController(null);

            // Exercise
            RedirectToRouteResult result = userController.Authenticate(null) as RedirectToRouteResult;

            // Assert
            Assert.AreEqual("Unauthorized", result.RouteValues["Action"]);
        }
    }

    [TestFixture]
    public class UserTest_Mocks
    {
        private Mock<HttpClientCertificateBase> certMock;
        private Mock<IUserService> userServiceMock;
        private UserController userController;

        [SetUp]
        public void Setup()
        {
            certMock = new Mock<HttpClientCertificateBase>(null);
            userServiceMock = new Mock<IUserService>();
            userController = new UserController(userServiceMock.Object);
        }

        [Test]
        public void Authenticate_InvalidCertificate_RedirectToUnauthorizedPage()
        {
            // Setup
            certMock.Setup(x => x.Issuer).Returns("blah blah");
            certMock.Setup(x => x.Subject).Returns("C=US, O=U.S. Government, OU=DoD, OU=PKI, OU=USAF, CN=DOE.JOHN.SMITH.1234567890");
            userServiceMock.Setup(x => x.GetUserByCacId(It.IsAny<string>())).Returns(new User());

            // Exercise
            RedirectToRouteResult result = userController.Authenticate(certMock.Object) as RedirectToRouteResult;

            // Assert
            Assert.AreEqual("Unauthorized", result.RouteValues["Action"]);
        }

        [Test]
        public void Authenticate_ValidCertificateButUserNotFound_RedirectToUnauthorizedPage()
        {
            // Setup
            certMock.Setup(x => x.Issuer).Returns("C=US, O=U.S. Government, OU=DoD, OU=PKI, CN=DOD EMAIL CA-33");
            certMock.Setup(x => x.Subject).Returns("C=US, O=U.S. Government, OU=DoD, OU=PKI, OU=USAF, CN=DOE.JOHN.SMITH.1234567890");
            userServiceMock.Setup(x => x.GetUserByCacId(It.IsAny<string>())).Returns((User)null);

            // Exercise
            RedirectToRouteResult result = userController.Authenticate(certMock.Object) as RedirectToRouteResult;

            // Assert
            Assert.AreEqual("Unauthorized", result.RouteValues["Action"]);
        }

        [Test]
        public void Authenticate_ValidCertificateAndUserFound_RedirectToHomePage()
        {
            // Setup
            certMock.Setup(x => x.Issuer).Returns("C=US, O=U.S. Government, OU=DoD, OU=PKI, CN=DOD EMAIL CA-33");
            certMock.Setup(x => x.Subject).Returns("C=US, O=U.S. Government, OU=DoD, OU=PKI, OU=USAF, CN=DOE.JOHN.SMITH.1234567890");
            userServiceMock.Setup(x => x.GetUserByCacId(It.IsAny<string>())).Returns(new User() { FirstName = "JOHN", LastName = "DOE", MiddleName = "SMITH", CACId = "1234567890" });

            // Exercise
            RedirectToRouteResult result = userController.Authenticate(certMock.Object) as RedirectToRouteResult;

            // Assert
            Assert.AreEqual("Index", result.RouteValues["Action"]);
            Assert.AreEqual("Home", result.RouteValues["Controller"]);
        }
    }
}
