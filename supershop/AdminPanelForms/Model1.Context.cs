﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace supershop.AdminPanelForms
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class sellomat_Entities : DbContext
    {
        public sellomat_Entities()
            : base("name=sellomat_Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tbl_userlicense> tbl_userlicense { get; set; }
        public virtual DbSet<tbl_customerdetails> tbl_customerdetails { get; set; }
    }
}
