using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using WebSite.App.Tumblr;
using Should.Fluent;

namespace Tests.Tumblr
{
    public class When_downloading_posts_from_tumblr
    {
        private IEnumerable<TumblrPost> _posts;

        [TestFixtureSetUp]
        public void Given_my_blog_account_name()
        {
            var provider = new TumblrProvider("chaliy");
            _posts = provider.ReadAll();
        }

        [Test]
        public void Should_read_more_then_one_post()
        {
            _posts.Should().Not.Be.Empty();
        }

        [Test]
        public void Should_read_post_data()
        {
            _posts.First().UrlWithSlug.Should().Not.Be.Empty();
            _posts.First().RegularBody.Should().Not.Be.Empty();
            _posts.First().RegularTitle.Should().Not.Be.Empty();
        }
    }
}
