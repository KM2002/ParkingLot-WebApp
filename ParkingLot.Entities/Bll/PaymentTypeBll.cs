using System;
using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;
using ParkingLot.Entities.Data;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Bll
{
	public class PaymentTypeBll:IMstPaymentTypeService
	{
		private readonly ApplicationDbContext _applicationDbContext;
		public PaymentTypeBll(ApplicationDbContext applicationDbContext)
		{
			_applicationDbContext = applicationDbContext;
		}

		public List<utblMstParkingLotPaymentType> GetMstPaymentTypes()
		{
			var response = _applicationDbContext.utblMstParkingLotPaymentTypes.FromSqlRaw("CALL GetPaymentTypes()").ToList();
			return response;
		}

		public utblMstParkingLotPaymentType GetMstPaymentTypesByid(int id)
		{
			var parId = new MySqlParameter("@p_id", id);
			var response = _applicationDbContext.utblMstParkingLotPaymentTypes.FromSqlRaw("CALL GetPaymentTypesByid(@p_id)", new object[] { parId }).ToList();
			return response.FirstOrDefault();
		}

		public async Task<ResponseModel> AddMstPaymentTypes(utblMstParkingLotPaymentType model)
		{
			try
			{
                var partype = new MySqlParameter("@type", model.type);
                var parcreatedby = new MySqlParameter("@created_by", model.createdby);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL AddPaymentTypes(@type,@created_by)", new object[] { partype, parcreatedby }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }
        

		public async Task<ResponseModel> UpdateMstPaymentTypes(utblMstParkingLotPaymentType model)
		{
			try
			{
                var parId = new MySqlParameter("@p_id", model.id);
                var partype = new MySqlParameter("@type", model.type);
                var parcreatedby = new MySqlParameter("@created_by", model.createdby);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL UpdatePaymentTypes(@p_id,@type,@created_by)", new object[] { parId, partype, parcreatedby }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }

        }

		public async Task<ResponseModel> DeleteMstPaymentTypes(int id)
		{
			try
			{
                var parId = new MySqlParameter("p_id", id);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL DeletePaymentTypes(@p_id)", new object[] { parId }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }

        }
	}
}

