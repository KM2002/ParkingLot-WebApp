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
using Microsoft.AspNetCore.Authorization;

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
        if (User.Identity.IsAuthenticated)
        {
            return Redirect("~/dashboard");
        }
        return View();
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Login(LoginModel data)
    {
        
        try { 
        if(ModelState.IsValid)
        {
            var user = await _userManager.FindByEmailAsync(data.UserName);
            
            if(user!=null)
            {
                var signinresult = _signInManager.PasswordSignInAsync(user, data.Password, true, true);
                if(signinresult.Result.Succeeded)
                {
                    return RedirectToAction("Index","Dashboard");
                }
            }
        }

        return View(data);
        }
        catch(Exception ex)
        {
            throw ex;
        }
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
            var user = new ApplicationUser { UserName = data.Email, Email = data.Email,FirstName=data.FirstName, LastName=data.LastName };
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


    [Authorize(Roles ="Admin")]
    public async Task<IActionResult> RegisterAdmin()
    {
        return View();
    }

    [Authorize(Roles = "Admin")]
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> RegisterAdmin(RegisterModel data)
    {
        //var ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();

        if (ModelState.IsValid)
        {
            var user = new ApplicationUser { UserName = data.Email, Email = data.Email, FirstName = data.FirstName, LastName = data.LastName };
            var result = await _userManager.CreateAsync(user, data.Password);
            if (result.Succeeded)
            {
                var roleexists = await _roleManager.RoleExistsAsync("Admin");
                if (roleexists)
                {
                    await _userManager.AddToRoleAsync(user, "Admin");
                }
                else
                {
                    var roleResult = await _roleManager.CreateAsync(new IdentityRole("Admin"));
                    await _userManager.AddToRoleAsync(user, "Admin");
                }
                return RedirectToAction("ConfirmRegistration", new { newuser = user });
            }
        }
        return View(data);

    }

}

