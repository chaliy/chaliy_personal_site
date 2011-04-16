using System.Web.Mvc;

namespace WebSite.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /home/
        public ActionResult Index()
        {
            return View();
        }

        // GET: /home/contacts
        public ActionResult Contacts()
        {
            return View();
        }
    }
}
