namespace Poetry.Data.Model
{
    public class PoemsQueryModel
    {
        public PoemsQueryModel(int pageSize, int pageNumber)
        {
            PageSize = pageSize;
            PageNumber = pageNumber;
        }

        public int PageSize { get; private set; }

        public int PageNumber { get; private set; }
    }
}