namespace Poetry.Data.Query
{
    public interface IQueryHandler<TQueryBy, TResult>
    {
        TResult Execute(TQueryBy query);
    }
}
