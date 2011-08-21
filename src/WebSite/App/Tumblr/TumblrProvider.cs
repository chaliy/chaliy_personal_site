using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Xml.Linq;

namespace WebSite.App.Tumblr
{
    public class TumblrProvider
    {
        private readonly string _userName;

        public TumblrProvider(string userName)
        {
            _userName = userName;
        }

        public IList<TumblrPost> ReadAll()
        {            
            try
            {
                var doc = XDocument.Load("http://" + _userName + ".tumblr.com/api/read");

                return doc
                    .Element("tumblr")
                    .Element("posts")
                    .Elements("post")
                    .Select(x => new TumblrPost
                    {
                        UrlWithSlug = x.Attribute("url-with-slug").Value,
                        RegularTitle = x.Element("regular-title").Value,
                        RegularBody = x.Element("regular-body").Value,
                    })
                    .ToList();
            }
            catch
            {
            }
            
            return new List<TumblrPost>();
        }
    }

    public class TumblrPost
    {
        public string UrlWithSlug { get; set; }
        public string RegularTitle { get; set; }
        public string RegularBody { get; set; }
    }
}