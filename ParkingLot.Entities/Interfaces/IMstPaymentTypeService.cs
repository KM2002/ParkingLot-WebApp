using System;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Interfaces
{
	public interface IMstPaymentTypeService
	{
		List<utblMstParkingLotPaymentType> GetMstPaymentTypes();
		utblMstParkingLotPaymentType GetMstPaymentTypesByid(int id);
		Task<ResponseModel> AddMstPaymentTypes(utblMstParkingLotPaymentType dataModel);
		Task<ResponseModel> UpdateMstPaymentTypes(utblMstParkingLotPaymentType dataModel);
		Task<ResponseModel> DeleteMstPaymentTypes(int id);
	}
}

