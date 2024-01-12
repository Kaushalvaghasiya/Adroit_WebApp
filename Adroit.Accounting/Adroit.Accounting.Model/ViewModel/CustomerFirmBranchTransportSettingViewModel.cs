﻿//-----------------------------------------------------------------------
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

        public string? PurchaseBookName { get; set; }
        public string? BookingSalesBookName { get; set; }
        public string? DeliverySalesBookName { get; set; }
        public string? ToPayAccountName { get; set; }
        public string? CrossingAmountAccountName { get; set; }
        public string? CrossingCommissionAccountName { get; set; }
        public string? CrossingHamaliAccountName { get; set; }
        public string? CrossingDeliveryChargeAccountName { get; set; }
        public string? SalesAccountName { get; set; }
        public string? FirmName { get; set; }
        public string? BranchName { get; set; }
        public int? LoginId { get; set; }
        public CustomerViewModel? Customer { get; set; }
        public decimal? ToPayAccountValue { get; set; }
        public decimal? TBBValue { get; set; }
        public decimal? PaidValue { get; set; }

    }
}