using System;
using System.ComponentModel.DataAnnotations;

namespace ParkingLot.Entities.Models
{
#nullable disable
	public class utblMstDistrict
	{
		[Key]
		public int id { get; set; }
		[Required(ErrorMessage ="Enter District Name!")]
		public string districtname { get; set; }
		public string description { get; set; }
		public string createdby{ get; set; }
		public DateTime lastupdatedon { get; set; } = DateTime.Now;
	}
#nullable restore
}

