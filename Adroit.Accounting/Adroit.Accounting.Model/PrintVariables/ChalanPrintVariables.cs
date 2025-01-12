﻿using System.ComponentModel;

namespace Adroit.Accounting.Model.PrintVariables
{
    public enum ChalanPrintVariables 
    {
        [Description("[ADVANCE_CASH]")]
        ADVANCE_CASH,
        [Description("[ADVANCE_NEFT]")]
        ADVANCE_NEFT,
        [Description("[AT_OWNER_RISK] ")]
        AT_OWNER_RISK,
        [Description("[SUBJECT_TO]")]
        TERMS_AND_CONDITIONS,
        [Description("[COMPANY_NAME]")]
        FIRM_NAME,
        [Description("[FIRM_GST_TYPE]")]
        FIRM_GST_TYPE,
        [Description("[FIRM_TYPE]")]
        FIRM_TYPE,
        [Description("[FIRM_OWNER]")]
        FIRM_OWNER,
        [Description("[FIRM_AADHAR_UID]")]
        FIRM_AADHAR_UID,
        [Description("[FIRM_TAN]")]
        FIRM_TAN,
        [Description("[FIRM_IEC]")]
        FIRM_IEC,
        [Description("[FIRM_LUT_BOND]")]
        FIRM_LUT_BOND,
        [Description("[FIRM_BUSINESS]")]
        FIRM_BUSINESS,
        [Description("[BRANCH]")]
        BRANCH_NAME,
        [Description("[BRANCH_TYPE]")]
        BRANCH_TYPE,
        [Description("[BRANCH_PRINT_TITLE]")]
        BRANCH_PRINT_TITLE,
        [Description("[BRANCH_CODE]")]
        BRANCH_CODE,
        [Description("[TRA_GST_NO]")]
        BRANCH_GST_NO,
        [Description("[BRANCH_PAN_NO]")]
        BRANCH_PAN_NO,
        [Description("[ADDRESS]")]
        BRANCH_ADDRESS,
        [Description("[BRANCH_CITY]")]
        BRANCH_CITY,
        [Description("[BRANCH_TALUKA]")]
        BRANCH_TALUKA,
        [Description("[BRANCH_DISTRICT]")]
        BRANCH_DISTRICT,
        [Description("[BRANCH_STATE]")]
        BRANCH_STATE,
        [Description("[PHONE_NUMBER]")]
        BRANCH_PHONE_NO,
        [Description("[BRANCH_MOBILE_NO]")]
        BRANCH_MOBILE_NO,
        [Description("[BRANCH_ALTERNATE_MOBILE_NO]")]
        BRANCH_ALTERNATE_MOBILE_NO,
        [Description("[COMPAYE_EMAIL]")]
        BRANCH_EMAIL_ADDRESS,
        [Description("[DATE]")]
        CHALAN_DATE,
        [Description("[BOOKING_BRANCH]")]
        BOOKING_BRANCH,
        [Description("[DELIVERY_BRANCH]")]
        DELIVERY_BRANCH,
        [Description("[VEHICLE_NO]")]
        VEHICLE_NUMBER,
        [Description("[BILL_PURCHASE_PARTY]")]
        BILL_PURCHASE_PARTY,
        [Description("[BILL_PARTY]")]
        BILL_PARTY,
        [Description("[EWAY_BILL_NUMBER_PART_B]")]
        EWAY_BILL_NUMBER_PART_B,
        [Description("[FIRM_CHALAN]")]
        FIRM_CHALAN,
        [Description("[BRANCH_CHALAN]")]
        BRANCH_CHALAN,
        [Description("[DRIVER_NAME]")]
        DRIVER_NAME,
        [Description("[DRIVER_LICENCE_NO]")]
        DRIVER_LICENCE_NO,
        [Description("[TO_PAY_ACCOUNT_BRANCH_MAPPING]")]
        TO_PAY_ACCOUNT_BRANCH_MAPPING,
        [Description("[TO_PAY_AMOUNT]")]
        TO_PAY_AMOUNT,
        [Description("[PAID_VALUE]")]
        PAID_VALUE,
        [Description("[TBB_VALUE]")]
        TBB_VALUE,
        [Description("[TOTAL_VALUE]")]
        TOTAL_VALUE,
        [Description("[CROSSING_AMOUNT_BRANCH_MAPPING]")]
        CROSSING_AMOUNT_BRANCH_MAPPING,
        [Description("[CROSSING_AMOUNT]")]
        CROSSING_AMOUNT,
        [Description("[CROSSING_COMMISION_BRANCH_MAPPING]")]
        CROSSING_COMMISION_BRANCH_MAPPING,
        [Description("[CROSSING_COMMISION]")]
        CROSSING_COMMISION,
        [Description("[CROSSING_HAMALI_BRANCH_MAPPING]")]
        CROSSING_HAMALI_BRANCH_MAPPING,
        [Description("[CROSSING_HAMALI]")]
        CROSSING_HAMALI,
        [Description("[CROSSING_DELIVERY_CHARGE_BRANCH_MAPPING]")]
        CROSSING_DELIVERY_CHARGE_BRANCH_MAPPING,
        [Description("[CROSSING_DELIVERY_CHARGE]")]
        CROSSING_DELIVERY_CHARGE,        
        [Description("[BROKER]")]
        BROKER,
        [Description("[BROKRAGE]")]
        BROKRAGE,
        [Description("[REMARKS]")]
        REMARKS,
        [Description("[LORRY_HIRE_FREIGHT]")]
        LORRY_HIRE_FREIGHT,
        [Description("[LESS_TDS_P]")]
        LESS_TDS_P,
        [Description("[LESS_TDS]")]
        LESS_TDS_AMOUNT,
        [Description("[CASH_TO_LORRY_TRIP]")]
        CASH_TO_LORRY_TRIP,
        [Description("[BANK_TRANSFER_TO_LORRY_TRIP]")]
        BANK_TRANSFER_TO_LORRY_TRIP,
        [Description("[RECEIVE_CASH]")]
        RECEIVED_CASH_BY_DRIVER,
        [Description("[OTHER_EXP]")]
        OTHER_EXP_OF_TRIP,
        [Description("[OTHER]")]
        OTHER_LESS,
        [Description("[CHALAN_NET_AMOUNT]")]
        CHALAN_NET_AMOUNT,
        [Description("[CHALAN_AMOUNT_IN_WORDS]")]
        CHALAN_AMOUNT_IN_WORDS,
        [Description("[BOOK_NAME]")]
        BOOK_NAME,
        [Description("[CITY]")]
        CITY,
        [Description("[FROM_CITY]")]
        BOOKING_CITY,
        [Description("[TO_CITY]")]
        DELIVERY_CITY,        
        [Description("[OWNER_NAME]")]
        VEHICLE_OWNER,
        [Description("[VEHICLE_OWNER_CITY]")]
        VEHICLE_OWNER_CITY,
        [Description("[PAN_NO]")]
        VEHICLE_OWNER_PAN_NUMBER,
        [Description("[MOB]")]
        VEHICLE_OWNER_MOBILE_NUMBER,
        [Description("[VEHICLE_MODEL]")]
        VEHICLE_MODEL,
        [Description("[VEHICLE_REGISTRATION_STATE]")]
        VEHICLE_REGISTRATION_STATE,
        [Description("[VEHICLE_CHASIS_NO]")]
        VEHICLE_CHASIS_NUMBER,
        [Description("[VEHICLE_ENGINE_NO]")]
        VEHICLE_ENGINE_NUMBER,
        [Description("[VEHICLE_STATE_PERMIT_NUMBER]")]
        VEHICLE_STATE_PERMIT_NUMBER,
        [Description("[VEHICLE_STATE_PERMIT_EXP_DATE]")]
        VEHICLE_STATE_PERMIT_EXP_DATE,
        [Description("[VEHICLE_NATIONAL_PERMIT_NO]")]
        VEHICLE_NATIONAL_PERMIT_NUMBER,
        [Description("[VEHICLE_NATIONAL_PERMIT_EXP_DATE]")]
        VEHICLE_NATIONAL_PERMIT_EXP_DATE,
        [Description("[VEHICLE_INSURANCE_POLICY_NO]")]
        VEHICLE_INSURANCE_POLICY_NUMBER,
        [Description("[VEHICLE_INSURANCE_POLICY_EXP_DATE]")]
        VEHICLE_INSURANCE_POLICY_EXP_DATE,
        [Description("[TOTAL]")]
        TOTAL,
        [Description("[TOTAL_WEIGHT]")]
        TOTAL_WEIGHT,
        [Description("[TOTAL_AMOUNT]")]
        TOTAL_AMOUNT,
        [Description("[DESTINATION]")]
        DESTINATION,
        [Description("[TOTAL_LR]")]
        TOTAL_LR,
        [Description("[TOTAL_PKGS]")]
        TOTAL_PKGS,
        [Description("[CROSSING_CHARGE]")]
        CROSSING_CHARGE,
        [Description("[HAMALI]")]
        HAMALI,
        [Description("[BOOKING_CHARGE]")]
        BOOKING_CHARGE,
        [Description("[NOTES]")]
        NOTES,
        [Description("[BALANCE_TYPE]")]
        BALANCE_TYPE,
        [Description("[AMOUNT_IN_SENTENCE]")]
        AMOUNT_IN_SENTENCE,
        [Description("[DRIVER_ADDRESS]")]
        DRIVER_ADDRESS,
        [Description("[LR_DETAIL]")]
        LR_DETAIL,
        [Description("[TOTAL_TO_PAY_AMOUNT]")]
        TOTAL_TO_PAY_AMOUNT,
        [Description("[TOTAL_PAID_TBB_AMOUNT]")]
        TOTAL_PAID_TBB_AMOUNT,
        [Description("[BALANCE]")]
        BALANCE,
        [Description("[TO_PAY_ACCOUNT_BRANCH_MAPPING_CHARGED_TO]")]
        TO_PAY_ACCOUNT_BRANCH_MAPPING_CHARGED_TO,
        [Description("[CROSSING_AMOUNT_BRANCH_MAPPING_CHARGED_TO]")]
        CROSSING_AMOUNT_BRANCH_MAPPING_CHARGED_TO,
        [Description("[CROSSING_COMMISION_BRANCH_MAPPING_CHARGED_TO]")]
        CROSSING_COMMISION_BRANCH_MAPPING_CHARGED_TO,
        [Description("[CROSSING_HAMALI_BRANCH_MAPPING_CHARGED_TO]")]
        CROSSING_HAMALI_BRANCH_MAPPING_CHARGED_TO,
        [Description("[CROSSING_DELIVERY_CHARGE_BRANCH_MAPPING_CHARGED_TO]")]
        CROSSING_DELIVERY_CHARGE_BRANCH_MAPPING_CHARGED_TO,
    }
}
