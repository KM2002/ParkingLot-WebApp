using System;
using System.ComponentModel.DataAnnotations;

namespace ParkingLot.Entities.Models
{
#nullable disable
	public class utblMstParkingLotPaymentType
	{
		[Key]
		public int id { get; set; }
		[Required(ErrorMessage = "Enter Payment Type!")] 
		public string type { get; set; }
		public string createdby { get; set; }
		public DateTime lastupdatedon { get; set; } = DateTime.Now;
	}
#nullable restore
}

