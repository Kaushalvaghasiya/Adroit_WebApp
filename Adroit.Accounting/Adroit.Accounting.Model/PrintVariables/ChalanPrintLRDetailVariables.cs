﻿using System.ComponentModel;

namespace Adroit.Accounting.Model.PrintVariables
{
    public enum ChalanPrintLRDetailVariables 
    {
        [Description("[SR_NO]")]
        SR_NO,
        [Description("[L_R_NO]")]
        L_R_NO,        
        [Description("[CONSIGNEE_NAME]")]
        CONSIGNEE_NAME,
        [Description("[CONSIGNEE_GSTIN]")]
        CONSIGNEE_GST,
        [Description("[CONSIGNEE_MOBILE]")]
        CONSIGNEE_MOBILE,
        [Description("[CONSIGNOR_NAME]")]
        CONSIGNOR_NAME,
        [Description("[CONSIGNOR_GSTIN]")]
        CONSIGNOR_GST,
        [Description("[CONSIGNOR_MOBILE]")]
        CONSIGNOR_MOBILE,
        [Description("[BILL_PARTY_NAME]")]
        BILL_PARTY_NAME,
        [Description("[BILL_PARTY_GST]")]
        BILL_PARTY_GST,
        [Description("[BILL_PARTY_MOBILE]")]
        BILL_PARTY_MOBILE,
        [Description("[PAYMENT_TYPE]")]
        PAY_TYPE,
        [Description("[PARCEL]")]
        PARCEL,
        [Description("[DESCRIPTION]")]
        DESCRIPTION,
        [Description("[PACKING]")]
        PACKING,
        [Description("[ACT_WT]")]
        ACTUAL_WEIGHT,
        [Description("[CH_WT]")]
        CHARGE_WEIGHT,
        [Description("[EWAY_BILL_NUMBER_PART_A]")]
        EWAY_BILL_NUMBER_PART_A,
        [Description("[PRIVATE_MARK]")]
        PRIVATE_MARK,
        [Description("[LR_AMOUNT]")]
        LR_AMOUNT,
        [Description("[FROM_CITY]")]
        BOOKING_CITY,
        [Description("[TO_CITY]")]
        DELIVERY_CITY,
    }
}