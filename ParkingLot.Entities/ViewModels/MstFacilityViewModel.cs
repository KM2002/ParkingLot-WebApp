using System;
using ParkingLot.Entities.Models;

namespace ParkingLot.Entities.ViewModels
{
#nullable disable
	public class MstFacilityViewModel
	{
		public List<utblMstParkingLotFacility> MstFacilites { get; set; }
		public int TotalCount { get; set; }
	}
#nullable restore
}

