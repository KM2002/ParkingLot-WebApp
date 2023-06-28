using System;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Interfaces
{
	public interface IParkingLotTypesService
	{
		List<utblMstParkingLotType> GetParkingLotTypes();
		utblMstParkingLotType GetParkingLotTypeByid(int id);
		Task<ResponseModel> AddParkingLotType(utblMstParkingLotType dataModel);
		Task<ResponseModel> UpdateParkingLotType(utblMstParkingLotType dataModel);
		Task<ResponseModel> DeleteParkingLotTypes(int id);
	}
}

