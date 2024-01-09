//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

using Newtonsoft.Json;

namespace Adroit.Accounting.Model
{
    public partial class CustomerChalanBranchMapping
    {
        public CustomerChalanBranchMapping()
        {
        }
        public int Id { get; set; }
        public int BranchId { get; set; }
        public int SharedBranchId { get; set; }
    }
}