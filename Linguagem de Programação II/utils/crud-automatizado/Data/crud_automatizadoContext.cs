using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using crud_automatizado.Models;

namespace crud_automatizado.Data
{
    public class crud_automatizadoContext : DbContext
    {
        public crud_automatizadoContext (DbContextOptions<crud_automatizadoContext> options)
            : base(options)
        {
        }

        public DbSet<crud_automatizado.Models.Clientes> Clientes { get; set; } = default!;
    }
}
