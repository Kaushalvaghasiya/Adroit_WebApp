﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : MasterController
    {
        public IActionResult Customer(int id = 0)
        {
            CustomerViewModel model = new CustomerViewModel() { Id = id };
            model.BusinessList = _businessRepository.SelectList(_configurationData.DefaultConnection);
            //model.SoftwareList = _softwareRepository.SelectList(_configurationData.DefaultConnection);
            model.CountryList = _countryRepository.SelectList(_configurationData.DefaultConnection);
            model.CustomerTypeList = GenericHelper.GetCustomerTypeList();
            model.StatusList = GenericHelper.GetCustomerStatusList();

            return View(model);
        }

        [HttpGet]
        public JsonResult CustomerList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<CustomerGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _customerRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<CustomerGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public async Task<JsonResult> SaveCustomer([FromBody] CustomerViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                if (model.Id == 0)
                {
                    var data = await Common.RegisterCustomer(_userManager, _userStore, _emailStore, _emailService, _configurationData, Request, _logger, _customerRepository,
                    new Customer()
                    {
                        Name = model.Name,
                        BusinessName = model.BusinessName,
                        BusinessId = model.BusinessId,
                        StateId = model.StateId,
                        CityId = model.CityId,
                        Address1 = model.Address1,
                        Address2 = model.Address2,
                        Address3 = model.Address3,
                        AdharUID = model.AdharUID,
                        ContactPersonName = model.ContactPersonName,
                        Active = model.Active,
                        MobileAlternate = model.MobileAlternate,
                        Phone = model.Phone,
                        Pincode = model.Pincode,
                        TotalFirm = model.TotalFirm,
                        TotalUsers = model.TotalUsers,
                        Mobile = model.Mobile,
                        Email = model.Email,
                        Requirement = model.Requirement ?? "",
                        AgreeTerms = model.AgreeTerms,
                        EmailOtp = RandomNumber.SixDigigNumber(),
                        MobileOtp = RandomNumber.SixDigigNumber(),
                        CustomerType = model.CustomerType,
                        StatusId = model.StatusId,
                    });

                    if (data.id > 0)
                    {
                        result.data = true;
                        result.result = Constant.API_RESULT_SUCCESS;
                    }
                    else
                    {
                        throw new Exception(data.error);
                    }
                }
                else
                {
                    int id = _customerRepository.Save(model, _configurationData.DefaultConnection);
                    if (id > 0)
                    {
                        result.data = true;
                        result.result = Constant.API_RESULT_SUCCESS;
                    }
                }
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }

            return Json(result);
        }
        [HttpGet]
        public JsonResult DeleteCustomer(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _customerRepository.Delete(id, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [HttpGet]
        public JsonResult GetCustomer(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerRepository.Get(id, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
    }
}