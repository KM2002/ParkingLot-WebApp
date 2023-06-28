using System;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Interfaces
{
	public interface IMstFacilityService
	{
        MstFacilityViewModel GetMstFacilityPaged(int PageNo,int PageSize,string SearchTerm);
        List<utblMstParkingLotFacility> GetMstFacility();
		utblMstParkingLotFacility GetMstFacilitybyid(int id);
		Task<ResponseModel> AddMstFacility(utblMstParkingLotFacility dataModel);
		Task<ResponseModel> UpdateMstFacility(utblMstParkingLotFacility dataModel);
		Task<ResponseModel> DeleteMstFacility(int id);
	}
}

