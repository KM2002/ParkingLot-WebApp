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
    [Authorize(Roles = "Admin")]
    public class DistrictController : Controller
    {
        private readonly IDistrictService _districtService;
        public DistrictController(IDistrictService districtService)
        {
            _districtService = districtService;
        }

        public IActionResult DistrictView()
        {
            DistrictViewModel objmodel = new DistrictViewModel();
            objmodel.Districts = _districtService.spGetDistrict();
            return View(objmodel);
        }


        [HttpGet]
        public IActionResult AddNew()
        {
            utblMstDistrict model = new utblMstDistrict();
            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddNew(utblMstDistrict data)
        {
            if (ModelState.IsValid)
            {
                data.lastupdatedon = DateTime.Now;
                var response = await _districtService.AddDistrict(data);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        return RedirectToAction("districtview", "district", new { area = "" });
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
        [Route("District/updateview/{id}")]
        public IActionResult UpdateView(int id)
        {
            utblMstDistrict model = _districtService.GetDistrictByIDusingSP(id);

            if (model == null)
            {
                TempData["ErrMsg"] = "District not found.";
                return RedirectToAction("DistrictView");
            }

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateView(utblMstDistrict dataModel)
        {
            if (ModelState.IsValid)
            {
                var response = await _districtService.UpdateDistrict(dataModel);
                dataModel.lastupdatedon = DateTime.Now;
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        return RedirectToAction("DistrictView", "district", new { area = " " });
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }
                }
            }
            return View(dataModel);
        }

        //[HttpGet]
        //public IActionResult deleteview(int id)
        //{
        //    utblMstDistrict model = _districtService.GetDistrictByIDusingSP(id);

        //    if (model == null)
        //    {
        //        TempData["ErrMsg"] = "District not found.";
        //        return RedirectToAction("DistrictView");
        //    }

        //    return View(model);
        //}

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> deleteDistrict(int id)
        {
            if (ModelState.IsValid)
            {
                var response = await _districtService.DeleteDistrict(id);
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
            return RedirectToAction("districtview", "district", new { area = "" });
        }
    }
}
