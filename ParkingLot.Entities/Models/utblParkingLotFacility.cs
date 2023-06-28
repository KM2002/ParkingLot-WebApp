using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ParkingLot.Entities.Models
{
#nullable disable
	public class utblParkingLotFacility
	{
		[Key]
		public int id { get; set; }
		[ForeignKey("ParkingLot Id!!")]
		public int parkinglot_id { get; set; }
		[ForeignKey("Facility Id!!")]
		public int facility_id { get; set; }
		public string createdby { get; set; }
		public DateTime lastupdatedon { get; set; } = DateTime.Now;
	}
#nullable disable
}

