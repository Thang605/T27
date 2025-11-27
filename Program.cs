var builder = WebApplication.CreateBuilder(args);

// Configure web root path explicitly
builder.Environment.WebRootPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");

var app = builder.Build();

// Enable default files (index.html)
app.UseDefaultFiles();

// Enable serving static files (CSS, JS, images) with proper content types
app.UseStaticFiles(new StaticFileOptions
{
    OnPrepareResponse = ctx =>
    {
        // Set proper charset for HTML files
        if (ctx.File.Name.EndsWith(".html", StringComparison.OrdinalIgnoreCase))
        {
            ctx.Context.Response.Headers["Content-Type"] = "text/html; charset=utf-8";
        }
        // Set proper charset for CSS files
        else if (ctx.File.Name.EndsWith(".css", StringComparison.OrdinalIgnoreCase))
        {
            ctx.Context.Response.Headers["Content-Type"] = "text/css; charset=utf-8";
        }
        // Set proper charset for JavaScript files
        else if (ctx.File.Name.EndsWith(".js", StringComparison.OrdinalIgnoreCase))
        {
            ctx.Context.Response.Headers["Content-Type"] = "application/javascript; charset=utf-8";
        }
    }
});

// Fallback to index.html for SPA-like behavior (optional)
app.MapFallbackToFile("index.html");

app.Run();
