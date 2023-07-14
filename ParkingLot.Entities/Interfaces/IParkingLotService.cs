using System;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Interfaces
{
	public interface IParkingLotService
	{
        CustomViewModel GetParkingLotDetailsbyId(int id);
        Task<List<CustomViewModel>> GetParkingLots();
        ParkingLotsViewModel GetParkingLotsPaged(int Pageno, int Psize, string searchterm);
		utblParkingLot GetParkingLotsbyid(int id);
		Task<ResponseModel> AddParkingLots(ParkingLotAddEditModel model);
		Task<ResponseModel> UpdateParkingLots(ParkingLotAddEditModel model);
		Task<ResponseModel> DeleteParkingLots(int id);
		List<SelectFacilityModel> GetSelectedFacilitiesbyid(int id);
		List<SelectParkingLotTypeModel> GetSelectParkingLotTypesbyid(int id);
		//Task<UserCount> GetUserCount();

    }
}

