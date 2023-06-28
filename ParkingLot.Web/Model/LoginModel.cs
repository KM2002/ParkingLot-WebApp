using System;
using System.ComponentModel.DataAnnotations;

namespace ParkingLot.Web.Model
{
	public class LoginModel
	{
		[Required(ErrorMessage ="Username is required...")]
		[Display(Name ="Username")]
		public string UserName { get; set; } = default!;
        [Required(ErrorMessage = "Password is required...")]
		[Display(Name = "Password")]
		public string Password { get; set; } = default!;
	}
}

