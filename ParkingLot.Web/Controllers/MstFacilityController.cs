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
    public class MstFacilityController : Controller
	{
		private readonly IMstFacilityService _mstFacilityService;
		public MstFacilityController(IMstFacilityService mstFacilityService)
		{
			_mstFacilityService = mstFacilityService;
		}
        public IActionResult MstFacilityViewPaged(int PageNo=1,int PageSize=10,string searchTerm="")
        {
            MstFacilityViewModel objmodel =
             _mstFacilityService.GetMstFacilityPaged(PageNo,PageSize,searchTerm);
			ViewBag.CurrentPage = PageNo;
            ViewBag.CurrentPSize = PageSize;
		
            return View(objmodel);
        }
        public IActionResult MstFacilityView()
		{
			MstFacilityViewModel objmodel = new MstFacilityViewModel();
			objmodel.MstFacilites = _mstFacilityService.GetMstFacility();
			return View(objmodel);
		}

		[HttpGet]
		public IActionResult AddMstFacility()
		{
			utblMstParkingLotFacility objmodel = new utblMstParkingLotFacility();
			return View(objmodel);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> AddMstFacility(utblMstParkingLotFacility dataModel)
		{
			if (ModelState.IsValid)
			{
				dataModel.lastupdatedon = DateTime.Now;
				var response = await _mstFacilityService.AddMstFacility(dataModel);
				if (response != null)
				{
					if (response.Status == "success")
					{
						return RedirectToAction("MstFacilityView", "mstfacility", new { area = "" });
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
        [Route("MstFacility/UpdateMstFacility/{id}")]
        public IActionResult UpdateMstFacility(int id)
		{
			utblMstParkingLotFacility model = _mstFacilityService.GetMstFacilitybyid(id);
			if(model==null)
			{
                TempData["ErrMsg"] = "MstFacility not found";
				return RedirectToAction("MstFacilityView");
			}
			return View(model);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> UpdateMstFacility(utblMstParkingLotFacility dataModel)
		{
			if(ModelState.IsValid)
			{
				dataModel.lastupdatedon = DateTime.Now;
				var response = await _mstFacilityService.UpdateMstFacility(dataModel);
				if(response!=null)
				{
					if(response.Status == "success")
					{
						return RedirectToAction("MstFacilityView", "mstfacility", new { area = "" });
					}
					else
					{
						TempData["ErrMsg"] = response.Message;
					}
				}
			}
			return View(dataModel);
		}

		public async Task<IActionResult> DeleteFacility(int id)
		{
            if (ModelState.IsValid)
            {
                var response = await _mstFacilityService.DeleteMstFacility(id);
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
            return RedirectToAction("MstFacilityView", "MstFacility", new { area = "" });
        }

	}
}


