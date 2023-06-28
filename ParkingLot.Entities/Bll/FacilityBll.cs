using System;
using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;
using ParkingLot.Entities.Data;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Bll
{
	public class FacilityBll:IParkingLotFacilitiesService
	{
		private readonly ApplicationDbContext _applicationDbContext;
		public FacilityBll(ApplicationDbContext applicationDbContext)
		{
			_applicationDbContext = applicationDbContext;
		}

        public List<utblParkingLotFacility> GetFacility()
        {
            var response = _applicationDbContext.utblParkingLotFacilities.FromSqlRaw("CALL GetFacility()").ToList();
            return response;
        }

        public utblParkingLotFacility GetFacilitybyid(int id)
        {
            var parId = new MySqlParameter("@p_id", id);
            var response = _applicationDbContext.utblParkingLotFacilities.FromSqlRaw("CALL GetFacilitybyid(@p_id)", new object[] { parId }).ToList();
            return response.FirstOrDefault();
        }

        public async Task<ResponseModel> AddFacility(utblParkingLotFacility dataModel)
        {
            try
            {
                var parParkingLotid = new MySqlParameter("@parkinglotid", dataModel.parkinglot_id);
                var parFacilityid = new MySqlParameter("@facilityid", dataModel.facility_id);
                var parCreatedBy = new MySqlParameter("@created_by", dataModel.createdby ?? "");
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL AddFacility(@parkinglotid,@facilityid,@created_by)", new object[] { parParkingLotid, parFacilityid, parCreatedBy }).ToListAsync();
                return response.FirstOrDefault();
            }

            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }

        public async Task<ResponseModel> UpdateFacility(utblParkingLotFacility dataModel)
        {
            try
            {
                var parID = new MySqlParameter("@p_id", dataModel.id);
                var parParkingLotid = new MySqlParameter("@parkinglotid", dataModel.parkinglot_id);
                var parFacilityid = new MySqlParameter("@facilityid", dataModel.facility_id);
                var parCreatedBy = new MySqlParameter("@created_by", dataModel.createdby ?? "");
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL UpdateFacility(@p_id,@parkinglotid,@facilityid,@created_by)", new object[] { parID, parParkingLotid, parFacilityid, parCreatedBy }).ToListAsync();
                return response.FirstOrDefault();
            }

            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }

        public async Task<ResponseModel> DeleteFacility(int id)
        {
            try
            {
                var parId = new MySqlParameter("@p_id", id);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL DeleteFacility(@p_id)", new object[] { parId }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }
    }
}

