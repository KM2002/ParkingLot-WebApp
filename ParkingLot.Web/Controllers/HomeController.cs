using System.Diagnostics;
using System.Net;
using System.Net.Mail;
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
    private readonly IEmailService _emailService;
    

    public HomeController(IEmailService emailService,ILogger<HomeController> logger,IParkingLotService parkingLotService)
    {
        _logger = logger;
        _parkingLotService = parkingLotService;
        _emailService = emailService;
        
    }

    public IActionResult Index()
    {
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

    public IActionResult About()
    {
        return View();
    }
    public IActionResult Contact()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    public async Task<JsonResult> GetAllParkingLots()
    {
        List<CustomViewModel> model =
        await _parkingLotService.GetParkingLots();
        return Json(new { parkinglots = model });
    }
    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Contact(string name, string email, string subject, string message)
    {
        
        var response = _emailService.SendEmail(name, email, subject, message);
        if(response=="success")
        {
            return View("~/account/ConfirmRegistration");
        }
        return View();

        //call sendemailfunction
    }

}

