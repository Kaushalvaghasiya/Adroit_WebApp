//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerFirmBranchTransportSettingViewModel : CustomerFirmBranchTransportSetting
    {
        public List<DropdownViewModel> CustomerFirmBranchList { get; set; } 
        public List<DropdownViewModel> TransportLRRateOnList { get; set; } 
        public List<DropdownViewModel> TransportLRPayTypeList { get; set; } 
        public List<DropdownViewModel> CustomerBookList { get; set; }  
        public List<DropdownViewModel> CustomerAccountList { get; set; } 

        public string? FirmName {  get; set; } 
        public string? BranchName {  get; set; } 
        public string? PurchaseBookName {  get; set; } 
        public string? BkSalesBookName {  get; set; } 
        public string? DelSalesBookName {  get; set; } 
        public int? LoginId {  get; set; }
        public CustomerViewModel? Customer { get; set; }

        public string? ToPayAccountLabel { get; set; }
        public string? CrossingAmountLabel { get; set; }
        public string? CrossingCommissionLabel { get; set; }
        public string? CrossingHamaliLabel { get; set; }
        public string? CrossingDeliveryChargeLabel { get; set; }
        public decimal? ToPayAccountValue { get; set; }

    }
}