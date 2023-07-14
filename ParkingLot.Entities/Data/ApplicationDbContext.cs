using System;
using Microsoft.EntityFrameworkCore;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Data
{
	public class ApplicationDbContext:DbContext
	{
		public ApplicationDbContext(DbContextOptions<ApplicationDbContext>options):base(options)
		{
		}
		public DbSet<utblMstDistrict> utblMstDistricts { get; set; }
		public DbSet<utblMstParkingLotFacility> utblMstParkingLotFacilities { get; set; }
		public DbSet<utblMstParkingLotPaymentType> utblMstParkingLotPaymentTypes { get; set; }
		public DbSet<utblMstParkingLotType> utblMstParkingLotTypes { get; set; }
		public DbSet<utblParkingLotFacility> utblParkingLotFacilities { get; set; }
		public DbSet<utblParkingLot> utblParkingLots { get; set; }
		public DbSet<CustomViewModel> customViewModels { get; set; }
		public DbSet<ResponseModel> ResponseModels { get; set; }
		public DbSet<SelectFacilityModel> SelectFacilityModels { get; set; }
		public DbSet<SelectParkingLotTypeModel> SelectParkingLotTypeModels { get; set; }
		public DbSet<Users> users { get; set; }
		public DbSet<ViewUser> viewUser { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CustomViewModel>().ToView("CustomViewModel").HasNoKey();
            modelBuilder.Entity<ResponseModel>().ToView("ResponseModel").HasNoKey();
            modelBuilder.Entity<SelectFacilityModel>().ToView("SelectFacilityModel").HasNoKey();
            modelBuilder.Entity<SelectParkingLotTypeModel>().ToView("SelectParkingLotTypeModel").HasNoKey();
			modelBuilder.Entity<Users>().ToView("Users").HasNoKey();
			modelBuilder.Entity<ViewUser>().ToView("ViewUser").HasNoKey();
        }
    }
}

