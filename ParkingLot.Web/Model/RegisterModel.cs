using System;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ParkingLot.Web.Model
{
    public class RegisterModel
    {
        [Required(ErrorMessage = "Firstname is required...")]
        [Display(Name = "Firstname")]
        public string FirstName { get; set; } = default!;
        [Required(ErrorMessage = "Lastname is required...")]
        [Display(Name = "Lastname")]
        public string LastName { get; set; } = default!;
        [Required(ErrorMessage = "Email is required...")]
        [Display(Name = "Email")]
        public string Email { get; set; } = default!;
        [Required(ErrorMessage = "Password is required...")]
        [Display(Name = "Password")]
        [DataType(DataType.Password)]
        public string Password { get; set; } = default!;
        [Required(ErrorMessage = "Password is required...")]
        [Display(Name = "Password")]
        [DataType(DataType.Password)]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{6,15}$", ErrorMessage = "Password doesn't fulfill the given requirement!")]
        [Compare("Password", ErrorMessage = "The Passwords are not matching!")]
        public string ConfirmPassword { get; set; } = default!;
    }
}

