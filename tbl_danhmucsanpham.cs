//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebNC
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_danhmucsanpham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_danhmucsanpham()
        {
            this.tbl_sanpham = new HashSet<tbl_sanpham>();
        }
    
        public System.Guid id_danhmucsanpham { get; set; }
        public string c_tendanhmuc { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_sanpham> tbl_sanpham { get; set; }
    }
}