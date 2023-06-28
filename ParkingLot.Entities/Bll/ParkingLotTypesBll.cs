using System;
using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;
using ParkingLot.Entities.Data;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Bll
{
	public class ParkingLotTypesBll:IParkingLotTypesService
	{
		private readonly ApplicationDbContext _applicationDbContext;
		public ParkingLotTypesBll(ApplicationDbContext applicationDbContext)
		{
			_applicationDbContext = applicationDbContext;
		}

        public List<utblMstParkingLotType> GetParkingLotTypes()
        {
            var response = _applicationDbContext.utblMstParkingLotTypes.FromSqlRaw("CALL GetParkingLotTypes()").ToList();
            return response;
        }

        public utblMstParkingLotType GetParkingLotTypeByid(int id)
        {
            var parId = new MySqlParameter("@p_id", id);
            var response = _applicationDbContext.utblMstParkingLotTypes.FromSqlRaw("CALL GetParkingLotTypesByid(@p_id)", new object[] { parId }).ToList();
            return response.FirstOrDefault();
        }

        public async Task<ResponseModel> AddParkingLotType(utblMstParkingLotType dataModel)
        {
            try
            {
                var parType = new MySqlParameter("@type", dataModel.type ?? "");
                var parCreatedBy = new MySqlParameter("@created_by", dataModel.createdby ?? "");
                var parLastUpdatedBy = new MySqlParameter("@lastupdated_by", dataModel.lastupdatedby);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL AddParkingLotTypes(@type,@created_by,@lastupdated_by)", new object[] { parType, parCreatedBy, parLastUpdatedBy }).ToListAsync();
                return response.FirstOrDefault();
            }

            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }

        public async Task<ResponseModel> UpdateParkingLotType(utblMstParkingLotType dataModel)
        {
            try
            {
                var parId = new MySqlParameter("@p_id", dataModel.id);
                var parType = new MySqlParameter("@type", dataModel.type ?? "");
                var parCreatedBy = new MySqlParameter("@created_by", dataModel.createdby ?? "");
                var parLastUpdatedBy = new MySqlParameter("@lastupdated_by", dataModel.lastupdatedby);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL UpdateParkingLotTypes(@p_id, @type, @created_by, @lastupdated_by)", new object[] { parId, parType, parCreatedBy, parLastUpdatedBy }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }

        }

        public async Task<ResponseModel> DeleteParkingLotTypes(int id)
        {
            try
            {
                var parId = new MySqlParameter("@p_id", id);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL DeleteParkingLotTypes(@p_id)", new object[] { parId }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }
    }
}

