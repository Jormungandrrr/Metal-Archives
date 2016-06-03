using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Metal_Archives.Startup))]
namespace Metal_Archives
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
