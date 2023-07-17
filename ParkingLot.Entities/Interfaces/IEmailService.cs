using System;
namespace ParkingLot.Entities.Interfaces
{
	public interface IEmailService
	{
		

		public string SendEmail(string name, string email, string subject, string message);
	}
}

