//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
namespace Adroit.Accounting.Model.ViewModel
{
    public class TransportPackingAdminViewModel : TransportPackingAdmin
    {
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}
