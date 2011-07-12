using System.Web.Mvc;
using WebSite.App.Tumblr;

namespace WebSite.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /home/
        [OutputCache(Duration = 86400, VaryByParam = "none")]
        public ActionResult Index()
        {
            var provider = new TumblrProvider("chaliy");
            return View(provider.ReadAll());
        }

        // GET: /home/contacts
        [OutputCache(Duration = 86400, VaryByParam = "none")]
        public ActionResult Contacts()
        {
            return View();
        }
    }
}
