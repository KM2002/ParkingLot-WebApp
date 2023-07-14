using System;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Entities.Interfaces
{
	public interface IUsersService
	{
		List<Users> GetUsers();
		ParkingLotsViewModel GetUsersPaged(int Pageno, int Psize, string searchterm);
		ViewUser GetUsersById(string id);
		Task<ResponseModel> UpdateUsers(ViewUser datamodel); 
		Task<ResponseModel> DeleteUser(string id);
	}
}

