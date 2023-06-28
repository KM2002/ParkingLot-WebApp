using System;
using System.Text.Json;
using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;
using ParkingLot.Entities.Data;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Bll
{
	public class ParkingLotBll:IParkingLotService
	{
		private readonly ApplicationDbContext _applicationDbContext;
		public ParkingLotBll(ApplicationDbContext applicationDbContext)
		{
			_applicationDbContext = applicationDbContext;
		}

        public List<CustomViewModel> GetParkingLots()
        {
            var response = _applicationDbContext.customViewModels.FromSqlRaw("CALL GetParkingLots()").ToList();
            return response;
        }

        public ParkingLotsViewModel GetParkingLotsPaged(int Pageno = 1, int Psize = 10, string searchterm="")
        {
            try { 
            ParkingLotsViewModel model = new ParkingLotsViewModel();
            var parPageno = new MySqlParameter("@pno", Pageno);
            var parsize = new MySqlParameter("@psize", Psize);
            var parsterm = new MySqlParameter("@sterm", searchterm??"");
            model.ParkingLots = _applicationDbContext.utblParkingLots.FromSqlRaw("CALL GetParkingLotsPaged(@pno,@psize,@sterm)", new object[] { parPageno, parsize, parsterm }).ToList();
if(searchterm=="")
                { 
                model.TotalCount = _applicationDbContext.utblParkingLots.Count();
                }
                else
                {
                    model.TotalCount = _applicationDbContext.utblParkingLots.Where(x => x.location.Contains(searchterm)).Count();
                }
                return model;
            }
            catch(Exception ex)
            {
                return default!;
            }

        }

        public utblParkingLot GetParkingLotsbyid(int id)
        {
            var parId = new MySqlParameter("@p_id", id);
            var response = _applicationDbContext.utblParkingLots.FromSqlRaw("CALL GetParkingLotsByid(@p_id)", new object[] { parId }).ToList();
            return response.FirstOrDefault();
        }
        public CustomViewModel GetParkingLotDetailsbyId(int id)
        {
            var parId = new MySqlParameter("@p_id", id);
            var response = _applicationDbContext.customViewModels.FromSqlRaw("CALL GetParkingLotsByid(@p_id)", new object[] { parId }).ToList();
            return response.FirstOrDefault();
        }

        public List<SelectFacilityModel> GetSelectedFacilitiesbyid(int id)
        {
            var parId = new MySqlParameter("@p_id", id);
            var response = _applicationDbContext.SelectFacilityModels.FromSqlRaw("CALL GetSelectedFacilitiesbyid(@p_id)", new object[] { parId }).ToList();
            return response;
        }

        public List<SelectParkingLotTypeModel> GetSelectParkingLotTypesbyid(int id)
        {
            var parId = new MySqlParameter("@p_id", id);
            var response = _applicationDbContext.SelectParkingLotTypeModels.FromSqlRaw("CALL GetSelectParkingLotTypesbyid(@p_id)", new object[] { parId }).ToList();
            return response;
        }

        public async Task<ResponseModel> AddParkingLots(ParkingLotAddEditModel dataModel)
        {
            try
            {
                //convert to json dataModel.Facilities

                var selectedFacilitiesJson = JsonSerializer.Serialize(dataModel.SelectedFacilities);
                var selectedtypesJson = JsonSerializer.Serialize(dataModel.SelectedTypes);

                var parName = new MySqlParameter("@name", dataModel.utblParkingLot.name);
                var parLocation = new MySqlParameter("@location", dataModel.utblParkingLot.location);
                var parLatitude = new MySqlParameter("@latitude", dataModel.utblParkingLot.latitude);
                var parLongitude = new MySqlParameter("@longitude", dataModel.utblParkingLot.longitude);
                var parOpeningtime = new MySqlParameter("@opening_time", dataModel.utblParkingLot.openingtime);
                var parClosingtime = new MySqlParameter("@closing_time", dataModel.utblParkingLot.closingtime);
                var parClosedOn = new MySqlParameter("@closed_on", dataModel.utblParkingLot.closedon);
                var parOwnername = new MySqlParameter("@owner_name", dataModel.utblParkingLot.ownername);
                var parContactno = new MySqlParameter("@contact_no", dataModel.utblParkingLot.contactno);
                var parEmailid = new MySqlParameter("@email_id", dataModel.utblParkingLot.emailid);
                var parDistrictid = new MySqlParameter("@districtid", dataModel.utblParkingLot.district_id);
                var parPaymentTypeid = new MySqlParameter("@paymenttypeid", dataModel.utblParkingLot.paymenttype_id);
                var parCreatedBy = new MySqlParameter("@created_by", dataModel.utblParkingLot.createdby ?? "");
                var parSelectedFacilities = new MySqlParameter("@selected_facilities", selectedFacilitiesJson);
                var parSelectedTypes = new MySqlParameter("@selected_types", selectedtypesJson);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL AddParkingLots(@name, @location, @latitude, @longitude, @opening_time, @closing_time, @closed_on, @owner_name, @contact_no, @email_id, @districtid, @paymenttypeid ,@created_by, @selected_facilities, @selected_types)", new object[] { parName, parLocation, parLatitude, parLongitude, parOpeningtime, parClosingtime, parClosedOn, parOwnername, parContactno, parEmailid, parDistrictid, parPaymentTypeid, parCreatedBy, parSelectedFacilities, parSelectedTypes }).ToListAsync();
                return response.FirstOrDefault();
            }

            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }

        public async Task<ResponseModel> UpdateParkingLots(ParkingLotAddEditModel dataModel)
        {
            try
            {
                var selectedFacilitiesJson = JsonSerializer.Serialize(dataModel.SelectedFacilities);
                var selectedtypesJson = JsonSerializer.Serialize(dataModel.SelectedTypes);

                var parId = new MySqlParameter("@p_id", dataModel.utblParkingLot.id);
                var parName = new MySqlParameter("@name", dataModel.utblParkingLot.name);
                var parLocation = new MySqlParameter("@location", dataModel.utblParkingLot.location);
                var parLatitude = new MySqlParameter("@latitude", dataModel.utblParkingLot.latitude);
                var parLongitude = new MySqlParameter("@longitude", dataModel.utblParkingLot.longitude);
                var parOpeningtime = new MySqlParameter("@opening_time", dataModel.utblParkingLot.openingtime);
                var parClosingtime = new MySqlParameter("@closing_time", dataModel.utblParkingLot.closingtime);
                var parClosedOn = new MySqlParameter("@closed_on", dataModel.utblParkingLot.closedon);
                var parOwnername = new MySqlParameter("@owner_name", dataModel.utblParkingLot.ownername);
                var parContactno = new MySqlParameter("@contact_no", dataModel.utblParkingLot.contactno);
                var parEmailid = new MySqlParameter("@email_id", dataModel.utblParkingLot.emailid);
                var parDistrictid = new MySqlParameter("@districtid", dataModel.utblParkingLot.district_id);
                var parPaymentTypeid = new MySqlParameter("@paymenttypeid", dataModel.utblParkingLot.paymenttype_id);
                var parCreatedBy = new MySqlParameter("@created_by", dataModel.utblParkingLot.createdby ?? "");
                var parSelectedFacilities = new MySqlParameter("@selected_facilities", selectedFacilitiesJson);
                var parSelectedTypes = new MySqlParameter("@selected_types", selectedtypesJson);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL UpdateParkingLots(@p_id, @name, @location, @latitude, @longitude, @opening_time, @closing_time, @closed_on, @owner_name, @contact_no, @email_id, @districtid, @paymenttypeid ,@created_by, @selected_facilities, @selected_types)", new object[] { parId, parName, parLocation, parLatitude, parLongitude, parOpeningtime, parClosingtime, parClosedOn, parOwnername, parContactno, parEmailid, parDistrictid, parPaymentTypeid, parCreatedBy, parSelectedFacilities, parSelectedTypes }).ToListAsync();
                return response.FirstOrDefault();
            }

            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }

        public async Task<ResponseModel> DeleteParkingLots(int id)
        {
            try
            {
                var parId = new MySqlParameter("@p_id", id);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL DeleteParkingLots(@p_id)", new object[] { parId }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }
    }
}

