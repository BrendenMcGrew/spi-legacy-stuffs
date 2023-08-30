using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SPIBase.Models
{
    public class HttpClientCertificateBase
    {
        private readonly HttpClientCertificate _cert;

        public HttpClientCertificateBase(HttpClientCertificate cert)
        {
            _cert = cert;
        }

        public virtual string Issuer { get { return _cert.Issuer; } }
        public virtual string Subject { get { return _cert.Subject; } }
    }
}