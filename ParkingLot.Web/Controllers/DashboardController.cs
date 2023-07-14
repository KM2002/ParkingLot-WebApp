using System;
using Microsoft.AspNetCore.Mvc;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;
using ParkingLot.Entities.Data;
using ParkingLot.Web.Controllers;
using Microsoft.AspNetCore.Authorization;
using System.Data;

namespace ParkingLot.Web.Controllers
{
    [Authorize]
    public class DashboardController : Controller
    {
        private readonly IParkingLotService _parkingLotService;
        private readonly IMstPaymentTypeService _paymentService;
        private readonly IDistrictService _districtService;
        private readonly IParkingLotTypesService _parkingLotTypesService;
        private readonly IMstFacilityService _parkingLotFacilitiesService;
        private readonly IUsersService _usersService;

        public DashboardController(IUsersService usersService,IMstFacilityService parkingLotFacilitiesService, IParkingLotTypesService parkingLotTypesService, IMstPaymentTypeService paymentService, IParkingLotService parkingLotService, IDistrictService districtService)
        {
            _parkingLotService = parkingLotService;
            _districtService = districtService;
            _paymentService = paymentService;
            _parkingLotTypesService = parkingLotTypesService;
            _parkingLotFacilitiesService = parkingLotFacilitiesService;
            _usersService = usersService;
        }
        public IActionResult Index()
        {
            ParkingLotAddEditModel objmodel = new ParkingLotAddEditModel();
            objmodel.Districts = _districtService.spGetDistrict();
            ViewBag.FreePaymentType = _paymentService.GetMstPaymentTypes().Where(x=>x.type== "Free" || x.type == "Free/Paid").Count();
            ViewBag.PaidPaymentType = _paymentService.GetMstPaymentTypes().Where(x => x.type == "Paid" || x.type == "Free/Paid").Count();
            ViewBag.LargeFacillity = _parkingLotFacilitiesService.GetMstFacility().Where(x => x.facility == "Large").Count();
            objmodel.ParkingLotTypes = _parkingLotTypesService.GetParkingLotTypes();
            ViewBag.UsersCount = _usersService.GetUsers().Where(x => x.name == "User").Count();
            ViewBag.AdminCount = _usersService.GetUsers().Where(x => x.name == "Admin").Count();
            return View(objmodel);
        }
    }
}
