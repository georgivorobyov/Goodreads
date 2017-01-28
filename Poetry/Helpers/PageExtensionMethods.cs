using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace Poetry.Helpers
{
    public static class PageExtensionMethods
    {
        public static Guid GetCurrentUserId(this Page page)
        {
            return (Guid)Membership.GetUser().ProviderUserKey;
        }
    }
}