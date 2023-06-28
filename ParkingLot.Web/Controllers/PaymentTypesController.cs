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
    public class PaymentTypesController:Controller
	{
		IMstPaymentTypeService _mstPaymentTypeService;
		public PaymentTypesController(IMstPaymentTypeService mstPaymentTypeService)
		{
			_mstPaymentTypeService = mstPaymentTypeService;
		}

		public IActionResult PaymentTypesView()
		{
			PaymentTypeViewModel model = new PaymentTypeViewModel();
			model.PaymentTypes = _mstPaymentTypeService.GetMstPaymentTypes();
            return View(model);
		}

        [HttpGet]
        public IActionResult AddMstPaymentTypes()
        {
            utblMstParkingLotPaymentType model = new utblMstParkingLotPaymentType();
            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
		public async Task<IActionResult> AddMstPaymentTypes(utblMstParkingLotPaymentType data)
		{
            if (ModelState.IsValid)
            {
                data.lastupdatedon = DateTime.Now;
                var response = await _mstPaymentTypeService.AddMstPaymentTypes(data);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        return RedirectToAction("PaymentTypesView", "PaymentTypes", new { area = "" });
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }

                }

            }
            return View(data);
        }

        [HttpGet]
        [Route("PaymentTypes/UpdateMstPaymentTypes/{id}")]
        public IActionResult UpdateMstPaymentTypes(int id)
        {
            utblMstParkingLotPaymentType model = _mstPaymentTypeService.GetMstPaymentTypesByid(id);
            if (model == null)
            {
                TempData["ErrMsg"] = "Payment Type not found.";
                return RedirectToAction("PaymentTypesView");
            }

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateMstPaymentTypes(utblMstParkingLotPaymentType data)
        {
            if (ModelState.IsValid)
            {
                data.lastupdatedon = DateTime.Now;
                var response = await _mstPaymentTypeService.UpdateMstPaymentTypes(data);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        return RedirectToAction("PaymentTypesView", "PaymentTypes", new { area = "" });
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }

                }

            }
            return View(data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeletePaymentTypes(int id)
        {
            if (ModelState.IsValid)
            {
                var response = await _mstPaymentTypeService.DeleteMstPaymentTypes(id);
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
            return RedirectToAction("PaymentTypesView", "PaymentTypes", new { area = "" });
        }
	}
}

