using System.Web.Mvc;

namespace WebSite.Controllers
{
    public class ArchiveController : Controller
    {
        public ActionResult Get(string path)
        {
            var realPath = Server.MapPath("~/content/" + path + ".html");
            var content = System.IO.File.ReadAllText(realPath);
            return Content(content);
        }

        public ActionResult RedirectToArchive(string path)
        {
            return RedirectPermanent("/archive/" + path);            
        }
    }
}
