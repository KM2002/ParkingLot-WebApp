using System;
using System.ComponentModel.DataAnnotations;
using ParkingLot.Entities.Models;

namespace ParkingLot.Entities.ViewModels
{
	public class ParkingLotManageModel
	{
		
	}
	public class ParkingLotAddEditModel
	{
		public utblParkingLot utblParkingLot { get; set; } = default!;
		public List<SelectFacilityModel> SelectedFacilities { get; set; } = default!;
        public List<SelectParkingLotTypeModel> SelectedTypes { get; set; } = default!;
		//For DropDowns and Checkboxes for view.
		public IEnumerable<utblMstDistrict>? Districts { get; set; } = null!;
		public IEnumerable<utblMstParkingLotPaymentType>? PaymentTypes { get; set; } = null!;
		public List<utblMstParkingLotType>? ParkingLotTypes { get; set; } = null!;
        public List<utblMstParkingLotFacility>? Facilities { get; set; } = null!;
        public List<Users> Users { get; set; }

    }

	public class SelectFacilityModel
	{
		public int FacilityID { get; set; }
        public string? Facility { get; set; }
        public bool IsChecked { get; set; }
	}
    public class SelectParkingLotTypeModel
    {
        public int TypeID { get; set; }
		public string? Type { get; set; }
        public bool IsChecked { get; set; }
    }
	//public class UserCount
	//{
	//	public int? TotalCount{ get; set; }
	//}

}

