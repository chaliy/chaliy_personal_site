using System.Web.Mvc;

namespace WebSite.Controllers
{
    public class ArchiveController : Controller
    {
        public ActionResult Get(string path)
        {
            var realPath = Server.MapPath("~/content/" + path);
            var content = System.IO.File.ReadAllText(realPath);
            return Content(content);
        }
    }
}
