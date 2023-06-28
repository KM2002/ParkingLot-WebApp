using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Web.Controllers
{
    [Authorize(Roles ="Admin")]
	public class ParkingLotController:Controller
	{
		private readonly IParkingLotService _parkingLotService;
        private readonly IMstPaymentTypeService _paymentService;
        private readonly IDistrictService _districtService;
        private readonly IParkingLotTypesService _parkingLotTypesService;
        private readonly IMstFacilityService _parkingLotFacilitiesService;
         public ParkingLotController(IMstFacilityService parkingLotFacilitiesService,IParkingLotTypesService parkingLotTypesService,IMstPaymentTypeService paymentService,IParkingLotService parkingLotService,IDistrictService districtService)
		{
			_parkingLotService = parkingLotService;
            _districtService = districtService;
            _paymentService = paymentService;
            _parkingLotTypesService = parkingLotTypesService;
            _parkingLotFacilitiesService = parkingLotFacilitiesService;
		}

        public IActionResult ParkingLotView()
        {
            ParkingLotsViewModel objmodel = new ParkingLotsViewModel();
            objmodel.CustomParkingLot = _parkingLotService.GetParkingLots();
            return View(objmodel);
        }

        [HttpGet]
        public IActionResult AddParkingLots()
        {
            
            ParkingLotAddEditModel objmodel = new ParkingLotAddEditModel();
            objmodel.Districts = _districtService.spGetDistrict();
            objmodel.PaymentTypes = _paymentService.GetMstPaymentTypes();
            objmodel.ParkingLotTypes = _parkingLotTypesService.GetParkingLotTypes();
            objmodel.Facilities = _parkingLotFacilitiesService.GetMstFacility();
            return View(objmodel);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddParkingLots(ParkingLotAddEditModel dataModel)
        {
            if (ModelState.IsValid)
            {
                dataModel.utblParkingLot.lastupdatedon = DateTime.Now;
                var response = await _parkingLotService.AddParkingLots(dataModel);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        return RedirectToAction("ParkingLotView", "ParkingLot", new { area = "" });
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }
                }
            }
            dataModel.Districts = _districtService.spGetDistrict();
            dataModel.PaymentTypes = _paymentService.GetMstPaymentTypes();
            dataModel.ParkingLotTypes = _parkingLotTypesService.GetParkingLotTypes();
            dataModel.Facilities = _parkingLotFacilitiesService.GetMstFacility();
            return View(dataModel);
        }

        [HttpGet]
        [Route("ParkingLot/UpdateParkingLots/{id}")]
        public IActionResult UpdateParkingLots(int id)
        {
            ParkingLotAddEditModel model = new ParkingLotAddEditModel();
            model.Districts = _districtService.spGetDistrict();
            model.PaymentTypes = _paymentService.GetMstPaymentTypes();
            model.ParkingLotTypes = _parkingLotTypesService.GetParkingLotTypes();
            model.Facilities = _parkingLotFacilitiesService.GetMstFacility();
            model.utblParkingLot=_parkingLotService.GetParkingLotsbyid(id);

            model.SelectedFacilities = _parkingLotService.GetSelectedFacilitiesbyid(id);
            model.SelectedTypes = _parkingLotService.GetSelectParkingLotTypesbyid(id);
            if (model == null)
            {
                TempData["ErrMsg"] = "ParkingLot not found";
                return RedirectToAction("ParkingLotView");
            }
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateParkingLots(ParkingLotAddEditModel dataModel)
        {
            if (ModelState.IsValid)
            {
                dataModel.utblParkingLot.lastupdatedon = DateTime.Now;
                var response = await _parkingLotService.UpdateParkingLots(dataModel);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        return RedirectToAction("ParkingLotView", "ParkingLot", new { area = "" });
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }
                }
            }
            dataModel.Districts = _districtService.spGetDistrict();
            dataModel.PaymentTypes = _paymentService.GetMstPaymentTypes();
            dataModel.ParkingLotTypes = _parkingLotTypesService.GetParkingLotTypes();
            dataModel.Facilities = _parkingLotFacilitiesService.GetMstFacility();
            return View(dataModel);
        }

        public async Task<IActionResult> DeleteParkingLots(int id)
        {
            if (ModelState.IsValid)
            {
                var response = await _parkingLotService.DeleteParkingLots(id);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        TempData["ErrMsg"] = "success";
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }
                }
            }
            return RedirectToAction("ParkingLotView", "ParkingLot", new { area = "" });
        }
    }
}

