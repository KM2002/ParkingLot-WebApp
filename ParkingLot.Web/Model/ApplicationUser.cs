using System;
using Microsoft.AspNetCore.Identity;

namespace ParkingLot.Web.Data
{
   
        public class ApplicationUser : IdentityUser
        {
        public string FirstName { get; set; } = string.Empty;
            public string LastName { get; set; } = string.Empty;
    }
   
}

