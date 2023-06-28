using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ParkingLot.Entities.Models
{
#nullable disable
    public class utblParkingLotType
	{
        [Key]
        public int id { get; set; }
        [ForeignKey("ParkingLot Id!!")]
        public int parkinglot_id { get; set; }
        [ForeignKey("Type Id!!")]
        public int type_id{ get; set; }
        public string createdby { get; set; }
        public DateTime lastupdatedon { get; set; } = DateTime.Now;
    }
#nullable restore
}

