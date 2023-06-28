using System;
using System.ComponentModel.DataAnnotations;

namespace ParkingLot.Entities.Models
{
#nullable disable
	public class utblMstParkingLotType
	{
		[Key]
		public int id { get; set; }
		[Required(ErrorMessage ="Enter type!")]
		public string type { get; set; }
		[Required]
		public string createdby { get; set; }
		public string lastupdatedby { get; set; } 
	}
#nullable restore
}

