using System;
using Microsoft.AspNetCore.Authorization;
using System.Data;
using Microsoft.AspNetCore.Mvc;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Web.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ParkingLotTypesController:Controller
	{
		IParkingLotTypesService _parkingLotTypesService;
		public ParkingLotTypesController(IParkingLotTypesService parkingLotTypesService)
		{
			_parkingLotTypesService = parkingLotTypesService;
		}

		public IActionResult ParkingLotTypesView()
		{
			ParkingLotTypesViewModel model = new ParkingLotTypesViewModel();
			model.ParkingTypes = _parkingLotTypesService.GetParkingLotTypes();
			return View(model);
		}

		[HttpGet]
		public IActionResult AddParkingLotTypes()
		{
			utblMstParkingLotType model = new utblMstParkingLotType();
			return View(model);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> AddParkingLotTypes(utblMstParkingLotType dataModel)
		{
            if (ModelState.IsValid)
            {
                var response = await _parkingLotTypesService.AddParkingLotType(dataModel);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        return RedirectToAction("ParkingLotTypesView", "ParkingLotTypes", new { area = "" });
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }
                }
            }
            return View(dataModel);
        }

        [HttpGet]
        [Route("ParkingLotTypes/UpdateParkingLotTypes/{id}")]
        public IActionResult UpdateParkingLotTypes(int id)
        {
            utblMstParkingLotType model = _parkingLotTypesService.GetParkingLotTypeByid(id);
            if (model == null)
            {
                TempData["ErrMsg"] = "ParkingLotType not found";
                return RedirectToAction("ParkingLotTypesView");
            }
            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateParkingLotTypes(utblMstParkingLotType dataModel)
        {
            if (ModelState.IsValid)
            {
                var response = await _parkingLotTypesService.UpdateParkingLotType(dataModel);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        return RedirectToAction("ParkingLotTypesView", "ParkingLotTypes", new { area = "" });
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }
                }
            }
            return View(dataModel);
        }

        public async Task<IActionResult> DeleteParkingLotTypes(int id)
        {
            if (ModelState.IsValid)
            {
                var response = await _parkingLotTypesService.DeleteParkingLotTypes(id);
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
            return RedirectToAction("ParkingLotTypesView", "ParkingLotTypes", new { area = "" });
        }
    }
}

