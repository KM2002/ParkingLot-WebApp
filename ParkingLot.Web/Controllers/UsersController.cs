using System;
using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;
using ParkingLot.Web.Data;

namespace ParkingLot.Web.Controllers
{
	public class UsersController : Controller
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IUsersService _usersService;
        private readonly SignInManager<ApplicationUser> _signInManager;

        public UsersController(UserManager<ApplicationUser> userManager,IUsersService usersService, SignInManager<ApplicationUser> signInManager)
		{
			_usersService = usersService;
            _signInManager = signInManager;
            _userManager = userManager;
		}

		public IActionResult ViewUsers()
		{
			return View();
		}
        public IActionResult ViewUsersPaged(int PageNo = 1, int PageSize = 10, string searchTerm = "")
        {
            ParkingLotsViewModel model = _usersService.GetUsersPaged(PageNo, PageSize, searchTerm);
            ViewBag.UsersCount = _usersService.GetUsers().Count();
            ViewBag.CurrentPage = PageNo;
            ViewBag.CurrentPSize = PageSize;
            return PartialView("_pvViewUsers", model);
        }

        [HttpGet]
        [Route("Users/UpdateUsers/{id}")]
        public IActionResult UpdateUsers(string id)
        {
            ViewUser model = _usersService.GetUsersById(id);
            if (model == null)
            {
                TempData["ErrMsg"] = "UpdateUsers not found";
                return RedirectToAction("ViewUsers");
            }
            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateUsers(ViewUser dataModel)
        {
            if (ModelState.IsValid)
            {
                var response = await _usersService.UpdateUsers(dataModel);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        return RedirectToAction("ViewUsers", "Users", new { area = "" });
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }
                }
            }
            return View(dataModel);
        }

        public async Task<IActionResult> DeleteUser(string id)
        {

            var userid = User.FindFirstValue(ClaimTypes.NameIdentifier);
             if(userid==id)
            { 
                TempData["ErrMsg"] = "Invalid Operation: Cannot delete yourself ";
                return RedirectToAction("ViewUsers", "Users", new { area = "" });
            }
            if (ModelState.IsValid)
            {
                var response = await _usersService.DeleteUser(id);
                if (response != null)
                {
                    if (response.Status == "success")
                    {
                        TempData["ErrMsg"] = "success";
                         
                       
                            await _signInManager.SignOutAsync();
                        
                    }
                    else
                    {
                        TempData["ErrMsg"] = response.Message;
                    }
                }
            }
            return RedirectToAction("ViewUsers", "Users", new { area = "" });
        }

    }

}

