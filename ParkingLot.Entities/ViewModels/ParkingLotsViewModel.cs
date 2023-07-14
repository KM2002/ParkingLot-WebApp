using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ParkingLot.Entities.Models;

namespace ParkingLot.Entities.ViewModels
{
#nullable disable
	public class ParkingLotsViewModel
	{
		public List<utblParkingLot> ParkingLots { get; set; }
		public List<CustomViewModel> CustomParkingLot { get; set; }
		public List<Users> Users { get; set; }
        public List<ViewUser> viewUsers { get; set; }
		public int TotalCount { get; set; }
	}
	public class ParkingLotView
	{
        public CustomViewModel ParkingLotDetails { get; set; }
        public List<SelectParkingLotTypeModel> ParkingLotTypes { get; set; }
        public List<SelectFacilityModel> ParkingLotFacilities { get; set; }
    }

    public class Users
    {
        public string id { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string name { get; set; }
        public string email { get; set; }
    }
    public class ViewUser
    {
        public string id { get; set; } = default!;
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string email { get; set; }
    }
#nullable restore
}

