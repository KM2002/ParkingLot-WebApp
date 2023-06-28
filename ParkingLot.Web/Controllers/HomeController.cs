using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;

namespace ParkingLot.Web.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly IParkingLotService _parkingLotService;

    public HomeController(ILogger<HomeController> logger,IParkingLotService parkingLotService)
    {
        _logger = logger;
        _parkingLotService = parkingLotService;
    }

    public IActionResult Index()
    {
        //ParkingLotsViewModel objmodel = new ParkingLotsViewModel();
        //objmodel.CustomParkingLot = _parkingLotService.GetParkingLots();
        //ParkingLotsViewModel objmodel =
        //_parkingLotService.GetParkingLotsPaged(PageNo, PageSize, searchTerm);
        //ViewBag.CurrentPage = PageNo;
        //ViewBag.CurrentPSize = PageSize;
        return View();
    }
    public IActionResult LatestParkingLots(int PageNo = 1, int PageSize = 10, string searchTerm = "")
    {
        ParkingLotsViewModel objmodel =
        _parkingLotService.GetParkingLotsPaged(PageNo, PageSize, searchTerm);
        ViewBag.CurrentPage = PageNo;
        ViewBag.CurrentPSize = PageSize;

        return PartialView("_pvLatestParkingLots", objmodel);
    }
    public IActionResult ViewDetails(int id)
    {
        ParkingLotView objmodel = new ParkingLotView();
        objmodel.ParkingLotDetails = _parkingLotService.GetParkingLotDetailsbyId(id);
        objmodel.ParkingLotTypes = _parkingLotService.GetSelectParkingLotTypesbyid(id);
        objmodel.ParkingLotFacilities = _parkingLotService.GetSelectedFacilitiesbyid(id);
        return View(objmodel);
    }

    public IActionResult ParkingLots(int PageNo = 1, int PageSize = 10, string searchTerm = "")
    {
        ParkingLotsViewModel objmodel =
        _parkingLotService.GetParkingLotsPaged(PageNo, PageSize, searchTerm);
        ViewBag.CurrentPage = PageNo;
        ViewBag.CurrentPSize = PageSize;

        return PartialView("_pvParkingLots",objmodel);
    }

    public IActionResult ViewMoreParkingLots()
    {
        
        return View();
    }


    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

