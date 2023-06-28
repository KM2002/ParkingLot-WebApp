using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ParkingLot.Entities.Interfaces;
using ParkingLot.Entities.Models;
using ParkingLot.Entities.ViewModels;
using Microsoft.AspNetCore.Identity;
using ParkingLot.Web.Data;
using ParkingLot.Web.Model;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.WebUtilities;
using System.Text;
using System.Text.Encodings.Web;

namespace ParkingLot.Web.Controllers;

public class AccountController : Controller
{
    private readonly UserManager<ApplicationUser> _userManager;
    private readonly SignInManager<ApplicationUser> _signInManager;
    private readonly RoleManager<IdentityRole> _roleManager;
    private readonly IParkingLotService _parkingLotService;
    
    public AccountController(RoleManager<IdentityRole> roleManager ,UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager)
    {
        _userManager = userManager;
        _signInManager = signInManager;
        _roleManager = roleManager;
    }

    public IActionResult Index()
    {
        return View();
    }
    public async Task<IActionResult> Logout()
    {
        await _signInManager.SignOutAsync();
        return RedirectToAction("Index", "Home");
    }
    public IActionResult Login()
    {
        //if(User.Identity.IsAuthenticated)
        //{
        //    return Redirect("~/dashboard");
        //}
        return View();
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Login(LoginModel data)
    {
        if(ModelState.IsValid)
        {
            var user = await _userManager.FindByEmailAsync(data.UserName);
            
            if(user!=null)
            {
                var signinresult = _signInManager.PasswordSignInAsync(user, data.Password, true, true);
                if(signinresult.Result.Succeeded)
                {
                    return Redirect("~/dashboard");
                }
            }
        }
        return View(data);
    }
    public async Task<IActionResult> Register()
    {
        return View();
    }
        [HttpPost]
    [ValidateAntiForgeryToken]

    public async Task<IActionResult> Register(RegisterModel data)
    {
        //var ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();

        if (ModelState.IsValid)
        {
            var user = new ApplicationUser { UserName = data.Email, Email = data.Email };
            var result = await _userManager.CreateAsync(user, data.Password);
            if(result.Succeeded)
            {
                var roleexists = await _roleManager.RoleExistsAsync("User");
                if(roleexists)
                { 
                await _userManager.AddToRoleAsync(user,"User");
                }
                else
                {
                   var roleResult = await _roleManager.CreateAsync(new IdentityRole("User"));
                    await _userManager.AddToRoleAsync(user, "User");
                }
                return RedirectToAction("ConfirmRegistration",new { newuser=user});
            }
        }
        return View(data);

    }

    public IActionResult ConfirmRegistration(ApplicationUser newuser)
    {
        return View();
    }

}

