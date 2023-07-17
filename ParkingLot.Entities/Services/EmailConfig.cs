using System;
using ParkingLot.Entities.Interfaces;

namespace ParkingLot.Entities.Services
{
	public class EmailConfig: IEmailConfiguration
    {
		public string myEmail { get; set; }
        public string myPassword { get; set; }
    }
	
}

