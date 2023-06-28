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
		public int TotalCount { get; set; }
	}
	public class ParkingLotView
	{
        public CustomViewModel ParkingLotDetails { get; set; }
        public List<SelectParkingLotTypeModel> ParkingLotTypes { get; set; }
        public List<SelectFacilityModel> ParkingLotFacilities { get; set; }
    }
	
#nullable restore
}

