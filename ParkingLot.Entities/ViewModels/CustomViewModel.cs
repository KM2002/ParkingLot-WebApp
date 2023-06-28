using System;
using System.ComponentModel.DataAnnotations;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.ViewModels
{
#nullable disable
    public class CustomViewModel
	{
        [Key]
        public int id { get; set; }
        [Required(ErrorMessage = "Enter name!")]
        public string name { get; set; }
        [Required(ErrorMessage = "Enter location!")]
        public string location { get; set; }
        [Required(ErrorMessage = "Enter latitude!")]
        public decimal latitude { get; set; }
        [Required(ErrorMessage = "Enter longitude")]
        public decimal longitude { get; set; }
        [Required(ErrorMessage = "Enter opening time!")]
        public TimeSpan openingtime { get; set; }
        [Required(ErrorMessage = "Enter closing time")]
        public TimeSpan closingtime { get; set; }
        [Required(ErrorMessage = "Enter closing dates!")]
        public string closedon { get; set; }
        [Required(ErrorMessage = "Enter owner's name!")]
        public string ownername { get; set; }
        [Required(ErrorMessage = "Enter contact no!")]
        public string contactno { get; set; }
        [Required(ErrorMessage = "Enter email id")]
        public string emailid { get; set; }
        [Required(ErrorMessage = "Enter district id!")]
        public string districtName { get; set; }
        [Required(ErrorMessage = "Enter payment type id!")]
        public string Type { get; set; }
        [Required(ErrorMessage = "Enter creator's name!")]
        public string createdby { get; set; }
        public DateTime lastupdatedon { get; set; } = DateTime.Now;
       
    }
#nullable restore
}

