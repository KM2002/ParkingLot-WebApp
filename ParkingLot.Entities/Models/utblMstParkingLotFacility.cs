using System;
using System.ComponentModel.DataAnnotations;

namespace ParkingLot.Entities.Models
{
#nullable disable
	public class utblMstParkingLotFacility
	{
		[Key]
		public int id { get; set; }
		[Required]
		public string facility { get; set; }
		[Required]
		public string createdby { get; set; }
		public DateTime lastupdatedon { get; set; } = DateTime.Now;
	}
#nullable restore
}

