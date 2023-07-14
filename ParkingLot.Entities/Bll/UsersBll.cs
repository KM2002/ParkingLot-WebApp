using System;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;
using ParkingLot.Entities.Data;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Bll
{
	public class UsersBll:IUsersService
	{
        private readonly ApplicationDbContext _applicationDbContext;

        public UsersBll(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public List<Users> GetUsers()
        {
            return _applicationDbContext.users.FromSqlRaw("CALL GetUsers()").ToList();
        }

        public ParkingLotsViewModel GetUsersPaged(int Pageno = 1, int Psize = 10, string searchterm = "")
        {
            try
            {
                ParkingLotsViewModel model = new ParkingLotsViewModel();
                var parPageno = new MySqlParameter("@pno", Pageno);
                var parsize = new MySqlParameter("@psize", Psize);
                var parsterm = new MySqlParameter("@sterm", searchterm ?? "");
                model.Users = _applicationDbContext.users.FromSqlRaw("CALL GetUsersPaged(@pno,@psize,@sterm)", new object[] { parPageno, parsize, parsterm }).ToList();
                //if (searchterm == "")
                //{
                //    model.TotalCount = _applicationDbContext.users.Count();
                //}
                //else
                //{
                //    model.TotalCount = _applicationDbContext.users.Where(x => x.name.Contains(searchterm)).Count();
                //}
                return model;
            }
            catch (Exception ex)
            {
                return default!;
            }
        }

        public ViewUser GetUsersById(string id)
        {
            var parId = new MySqlParameter("@p_id", id);
            var response = _applicationDbContext.viewUser.FromSqlRaw("CALL GetUsersById(@p_id)", new object[] { parId }).ToList();
            return response.FirstOrDefault();
        }

        public async Task<ResponseModel> UpdateUsers(ViewUser data)
        {
            try
            {
                var parId = new MySqlParameter("@p_id", data.id);
                var parFirstName = new MySqlParameter("@firstname", data.firstname);
                var parLastName = new MySqlParameter("@lastname", data.lastname);
                var parEmail = new MySqlParameter("@email", data.email);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL UpdateUsers(@p_id, @firstname, @lastname, @email)", new object[] { parId, parFirstName, parLastName, parEmail }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }

        public async Task<ResponseModel> DeleteUser(string id)
        {
            try
            {
                var parId = new MySqlParameter("@p_id", id);
                var response = await _applicationDbContext.ResponseModels.FromSqlRaw("CALL DeleteUser(@p_id)", new object[] { parId }).ToListAsync();
                return response.FirstOrDefault();
            }
            catch (Exception ex)
            {
                return new ResponseModel { Status = "error", Message = ex.InnerException.Message };
            }
        }
    }
}

