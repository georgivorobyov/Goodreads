namespace Poetry.Data.Command
{
    public interface ICommandHandler<TCommandModel>
    {
        void Execute(TCommandModel model);
    }
}
