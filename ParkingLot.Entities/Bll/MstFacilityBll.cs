using System;
using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;
using ParkingLot.Entities.Data;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Bll
{
	public class MstFacilityBll:IMstFacilityService
	{
		private readonly ApplicationDbContext _applicationDbContext;
		public MstFacilityBll(ApplicationDbContext applicationDbContext)
		{
			_applicationDbContext = applicationDbContext;
		}
        public MstFacilityViewModel GetMstFacilityPaged(int PageNo=1,int PageSize=10,string searchterm="")
        {
			MstFacilityViewModel model = new MstFacilityViewModel();
            var parPageno = new MySqlParameter("@pno", PageNo);
			var parPSize=new MySqlParameter("@psize", PageSize);
			var parSTerm=new MySqlParameter("@sterm", searchterm??"");
            model.MstFacilites = _applicationDbContext.utblMstParkingLotFacilities.FromSqlRaw("CALL GetFacilityPaged(@pno,@psize,@sterm)",new object[] {parPageno,parPSize,parSTerm}).ToList();
			model.TotalCount = _applicationDbContext.utblMstParkingLotFacilities.Count();
			return model;
        }
        public List<utblMstParkingLotFacility> GetMstFacility()
		{
			var response = _applicationDbContext.utblMstParkingLotFacilities.FromSqlRaw("CALL GetFacility()").ToList();
			return response;
		}

		public utblMstParkingLotFacility GetMstFacilitybyid(int id)
		{
			var parId = new MySqlParameter("@p_id", id);
			var response = _applicationDbContext.utblMstParkingLotFacilities.FromSqlRaw("CALL GetFacilitybyid(@p_id)", new object[] { parId }).ToList();
			return response.FirstOrDefault();
		}

		public async Task<ResponseModel> AddMstFacility(utblMstParkingLotFacility dataModel)
		{
			try
			{
				var parFacility = new MySqlParameter("@facility", dataModel.facility ?? "");
				var parCreatedBy = new MySqlParameter("@created_by", dataModel.createdby ?? "");
				var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL AddFacility(@facility,@created_by)", new object[] { parFacility, parCreatedBy }).ToListAsync();
				return response.FirstOrDefault();
			}

			catch(Exception ex)
			{
				return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
			}
		}

		public async Task<ResponseModel> UpdateMstFacility(utblMstParkingLotFacility dataModel)
		{
			try
			{
				var parId = new MySqlParameter("@p_id", dataModel.id);
                var parFacility = new MySqlParameter("@facility", dataModel.facility ?? "");
                var parCreatedBy = new MySqlParameter("@created_by", dataModel.createdby ?? "");
				var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL UpdateFacility(@p_id, @facility, @created_by)", new object[] { parId, parFacility, parCreatedBy }).ToListAsync();
				return response.FirstOrDefault();
            }
			catch(Exception ex)
			{
				return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
			}

        }

		public async Task<ResponseModel> DeleteMstFacility(int id)
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

