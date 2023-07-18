﻿//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class ProductSizeViewModel: ProductSizeAdmin
    {
        public List<DropdownViewModel> ProductSizeList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}