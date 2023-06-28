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
    
        public DashboardController()
        {
            
        }
        public IActionResult Index()
        {
            
            return View();
        }
        
    }
}
