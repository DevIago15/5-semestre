using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using crud_automatizado.Data;
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<crud_automatizadoContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("crud_automatizadoContext") ?? throw new InvalidOperationException("Connection string 'crud_automatizadoContext' not found.")));

// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
	app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
	name: "default",
	pattern: "{controller=Clientes1}/{action=Index}/{id?}");

app.Run();
