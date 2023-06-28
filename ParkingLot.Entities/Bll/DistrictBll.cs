using System;
using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;
using ParkingLot.Entities.Data;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Bll
{
	public class DistrictBll : IDistrictService
	{
		private readonly ApplicationDbContext _applicationDbContext;

        public object utblMstDistricts => throw new NotImplementedException();

        public DistrictBll(ApplicationDbContext applicationDbContext)
		{
			_applicationDbContext = applicationDbContext;
		}

		public List<utblMstDistrict> GetDistricts()
		{
            return _applicationDbContext.utblMstDistricts.ToList();
        }
        public utblMstDistrict GetDistrictByID(int id)
        {
            return _applicationDbContext.utblMstDistricts.Where(x=>x.id==id).FirstOrDefault();
        }
        //RETURN LIST OF DISTRICTS
        public List<utblMstDistrict> spGetDistrict()
        {
            var response= _applicationDbContext.utblMstDistricts.FromSqlRaw("CALL GetDistrict()").ToList();
            return response;
        }
        //Return Single District Record using id 
        public utblMstDistrict GetDistrictByIDusingSP(int id)
        {
            var parId = new MySqlParameter("@p_id", id);
            var response = _applicationDbContext.utblMstDistricts.FromSqlRaw("CALL GetDistrictById(@p_id)",new object[] {parId}).ToList();
            return response.FirstOrDefault();
        }

        public async Task<ResponseModel> AddDistrict(utblMstDistrict dataModel)
        {
            try
            {
                var parDistrictName = new MySqlParameter("@district_name", dataModel.districtname);
                var parDescription = new MySqlParameter("@description", dataModel.description ?? "");
                var parCreatedBy = new MySqlParameter("@created_by", dataModel.createdby ?? "");

                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL AddDistrict(@district_name,@description,@created_by)", new object[] { parDistrictName, parDescription, parCreatedBy }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }

        public async Task<ResponseModel> UpdateDistrict(utblMstDistrict data)
        {
            try
            {
                var parID = new MySqlParameter("@p_id", data.id);
                var parDistrictName = new MySqlParameter("@district_name", data.districtname);
                var parDescription = new MySqlParameter("@description", data.description ?? "");
                var parCreatedBy = new MySqlParameter("@created_by", data.createdby ?? "");

                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL UpdateDistrict(@p_id,@district_name,@description,@created_by)", new object[] { parID,parDistrictName, parDescription, parCreatedBy }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }

        public async Task<ResponseModel> DeleteDistrict(int id)
        {
            try
            {
                var parID = new MySqlParameter("@p_id", id);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL DeleteDistrict(@p_id)", new object[] { parID}).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }
    }
}

