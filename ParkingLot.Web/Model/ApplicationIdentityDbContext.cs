using System;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Web.Data
{
	public class ApplicationIdentityDbContext: IdentityDbContext<ApplicationUser>
    {
		public ApplicationIdentityDbContext(DbContextOptions<ApplicationIdentityDbContext> options):base(options)
		{
		}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

        }


    }
}

