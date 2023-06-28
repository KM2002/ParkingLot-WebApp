using System;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Interfaces
{
	public interface IParkingLotFacilitiesService
	{
		List<utblParkingLotFacility> GetFacility();
		utblParkingLotFacility GetFacilitybyid(int id);
		Task<ResponseModel> AddFacility(utblParkingLotFacility dataModel);
		Task<ResponseModel> UpdateFacility(utblParkingLotFacility dataModel);
		Task<ResponseModel> DeleteFacility(int id);


	}
}

