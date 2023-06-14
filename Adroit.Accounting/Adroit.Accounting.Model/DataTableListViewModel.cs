namespace Adroit.Accounting.Model
{
    public class DataTableListViewModel<T>
    {
        public long draw { get; set; }
        public int recordsTotal { get; set; }
        public int recordsFiltered { get; set; }
        public List<T> data { get; set; }
    }
}
