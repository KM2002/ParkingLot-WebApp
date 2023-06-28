using System;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Interfaces
{
	public interface IDistrictService
	{
        //List<utblMstDistrict> GetDistricts();
        List<utblMstDistrict> spGetDistrict();
        Task<ResponseModel> AddDistrict(utblMstDistrict dataModel);
        Task<ResponseModel> UpdateDistrict(utblMstDistrict dataModel);
        Task<ResponseModel> DeleteDistrict(int id);
        utblMstDistrict GetDistrictByID(int id);
        utblMstDistrict GetDistrictByIDusingSP(int id);
        //string AddDistrict(utblMstDistrict dataModel);
    }
}

